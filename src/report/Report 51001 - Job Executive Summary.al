report 51001 "Job Executive Summary"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Job Executive Summary.rdlc';

    dataset
    {
        dataitem(Job;Job)
        {
            RequestFilterFields = "No.",Status;
            column(CompanyName;CompanyInfo.Name)
            {
            }
            column(JobNo;Job."No.")
            {
            }
            column(JobDescription;Job.Description)
            {
            }
            column(JobPercentCompleted;PercentCompleted)
            {
            }
            column(JobCurrentYearBudget;CurrentYearBudget)
            {
            }
            column(JobCurrentYearActualExpenses;CurrentYearActualExpenses)
            {
            }
            column(JobCumulativeBudget;CumulativeBudget)
            {
            }
            column(JobCumulativeActualExpenses;CumulativeActualExpenses)
            {
            }
            column(JobCumulativeCommitments;CumulativeCommitments)
            {
            }
            column(JobAvailableBudget;AvailableBudget)
            {
            }

            trigger OnAfterGetRecord()
            begin
                CumulativeBudget:=0;
                CumulativeActualExpenses:=0;
                CumulativeCommitments:=0;
                CurrentYearBudget:=0;
                CurrentYearActualExpenses:=0;
                CurrentYearCommitments:=0;
                AvailableBudget:=0;
                CumulativeImprestCommitments:=0;
                CumulativePOCommitments:=0;
                CumulativePRNCommitments:=0;
                CumulativeS11Commitments:=0;
                CurrentYearPOCommitments:=0;
                CurrentYearPRNCommitments:=0;
                CurrentYearS11Commitments:=0;
                
                //TRACK BUDGET ENTRIES
                JobPlanningLine.Reset;
                JobPlanningLine.SetRange(JobPlanningLine."Job No.",Job."No.");
                if JobPlanningLine.Find('-') then begin
                //Track Cumulative Budget
                JobPlanningLine.SetRange(JobPlanningLine."Line Type",JobPlanningLine."Line Type"::Budget);
                if JobPlanningLine.Find('-') then
                repeat
                CumulativeBudget:=(CumulativeBudget+JobPlanningLine."Total Cost (LCY)");
                until JobPlanningLine.Next=0;
                
                //Track Current Year Budget
                JobSetup.Get;
                JobPlanningLine.SetRange(JobPlanningLine."Line Type",JobPlanningLine."Line Type"::Budget);
                JobPlanningLine.SetRange(JobPlanningLine."Planning Date",JobSetup."Current Year Budget Start Date",JobSetup."Current Year Budget End Date");
                if JobPlanningLine.Find('-') then
                repeat
                CurrentYearBudget:=(CurrentYearBudget+JobPlanningLine."Total Cost (LCY)");
                until JobPlanningLine.Next=0;
                end;
                
                //TRACK USAGE (ACTUAL EXPENSES) ENTRIES
                Jobledgerentry.Reset;
                Jobledgerentry.SetRange(Jobledgerentry."Job No.",Job."No.");
                if Jobledgerentry.Find('-') then begin
                //Cumulative Actual Expenses
                Jobledgerentry.SetRange(Jobledgerentry."Entry Type",Jobledgerentry."Entry Type"::Usage);
                if Jobledgerentry.Find('-') then
                repeat
                CumulativeActualExpenses:=(CumulativeActualExpenses+Jobledgerentry."Total Cost (LCY)");
                until Jobledgerentry.Next=0;
                
                //Current Year Actual Expenses
                JobSetup.Get;
                Jobledgerentry.SetRange(Jobledgerentry."Entry Type",Jobledgerentry."Entry Type"::Usage);
                Jobledgerentry.SetRange(Jobledgerentry."Posting Date",JobSetup."Current Year Budget Start Date","Report As At");
                if Jobledgerentry.Find('-') then
                repeat
                CurrentYearActualExpenses:=(CurrentYearActualExpenses+Jobledgerentry."Total Cost (LCY)");
                until Jobledgerentry.Next=0;
                end;
                
                //TRACK PROJECT COMMITMENTS
                //Track PO, PRN and SII Commitments
                PurchaseLine.Reset;
                PurchaseLine.SetRange(PurchaseLine."Job No.",Job."No.");
                PurchaseLine.SetRange(PurchaseLine.Status,PurchaseLine.Status::Released);
                if PurchaseLine.Find('-') then begin
                //Cumulative PO Commitments
                PurchaseLine.SetRange(PurchaseLine."Document Type",PurchaseLine."Document Type"::Order);
                if PurchaseLine.Find('-') then
                repeat
                CumulativePOCommitments:=(CumulativePOCommitments+PurchaseLine."Line Amount");
                until PurchaseLine.Next=0;
                //Current Year PO Commitments
                JobSetup.Get;
                PurchaseLine.SetRange(PurchaseLine."Document Type",PurchaseLine."Document Type"::Order);
                PurchaseLine.SetRange(PurchaseLine."Order Date",JobSetup."Current Year Budget Start Date","Report As At");
                if PurchaseLine.Find('-') then
                repeat
                CurrentYearPOCommitments:=(CurrentYearPOCommitments+PurchaseLine."Line Amount");
                until PurchaseLine.Next=0;
                
                //Cumulative PRN Commitments
                PurchaseLine.SetRange(PurchaseLine."Document Type",PurchaseLine."Document Type"::"Purchase Requisition");
                PurchaseLine.SetRange(PurchaseLine.Ordered,false);
                if PurchaseLine.Find('-') then
                repeat
                CumulativePRNCommitments:=(CumulativePRNCommitments+PurchaseLine."Line Amount");
                until PurchaseLine.Next=0;
                //Current Year PRN Commitments
                JobSetup.Get;
                PurchaseLine.SetRange(PurchaseLine."Document Type",PurchaseLine."Document Type"::"Purchase Requisition");
                PurchaseLine.SetRange(PurchaseLine.Ordered,false);
                PurchaseLine.SetRange(PurchaseLine."Order Date",JobSetup."Current Year Budget Start Date","Report As At");
                if PurchaseLine.Find('-') then
                repeat
                CurrentYearPRNCommitments:=(CurrentYearPRNCommitments+PurchaseLine."Line Amount");
                until PurchaseLine.Next=0;
                
                //Cumulative S11 Commitments
                PurchaseLine.SetRange(PurchaseLine."Document Type",PurchaseLine."Document Type"::"Store Requisition");
                PurchaseLine.SetFilter(PurchaseLine."Quantity To  Issue",'>0');
                if PurchaseLine.Find('-') then
                repeat
                CumulativeS11Commitments:=(CumulativeS11Commitments+PurchaseLine."Line Amount");
                until PurchaseLine.Next=0;
                //Current Year S11 Commitments
                JobSetup.Get;
                PurchaseLine.SetRange(PurchaseLine."Document Type",PurchaseLine."Document Type"::"Store Requisition");
                PurchaseLine.SetFilter(PurchaseLine."Quantity To  Issue",'>0');
                PurchaseLine.SetRange(PurchaseLine."Order Date",JobSetup."Current Year Budget Start Date","Report As At");
                if PurchaseLine.Find('-') then
                repeat
                CurrentYearS11Commitments:=(CurrentYearS11Commitments+PurchaseLine."Line Amount");
                until PurchaseLine.Next=0;
                
                end;//End of PO, PRN and SII Commitments
                
                //Track Imprest Application Commitments
                ImprestLine.Reset;
                ImprestLine.SetRange(ImprestLine."Job No.",Job."No.");
                if ImprestLine.Find('-') then begin
                //Track Cumulative Imprest Commitments
                  ImprestLine.CalcFields(ImprestLine."Payment Type");
                  ImprestLine.SetRange(ImprestLine.Status,ImprestLine.Status::Released);
                  ImprestLine.SetRange(ImprestLine."Payment Type",ImprestLine."Payment Type"::Imprest);
                  if ImprestLine.Find('-') then
                  repeat
                  CumulativeImprestCommitments:=(CumulativeImprestCommitments+ImprestLine.Amount);
                  until ImprestLine.Next=0;
                
                end;//End of Imprest Lines
                
                //CALCULATE TOTAL COMMITMENTS, AVAILABLE BUDGET & % COMPLETED
                CumulativeCommitments:=CumulativeImprestCommitments+CumulativePOCommitments+CumulativePRNCommitments+CumulativeS11Commitments;
                AvailableBudget:=CumulativeBudget-CumulativeActualExpenses-CumulativeCommitments;
                /*
                IF CumulativeBudget>0 THEN BEGIN
                  PercentCompleted:=CumulativeActualExpenses/CumulativeBudget*100;
                END;
                */

            end;

            trigger OnPreDataItem()
            begin
                CompanyInfo.Get;
                JobSetup.Get;
                JobSetup.TestField(JobSetup."Current Year Budget Start Date");
                JobSetup.TestField(JobSetup."Current Year Budget End Date");
                if "Report As At"=0D then Error('Report As At..... date must be specicifed!');
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("Report As At";"Report As At")
                {
                    Caption = 'Report As At';
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        "Report As At": Date;
        Jobledgerentry: Record "Job Ledger Entry";
        JobSetup: Record "Jobs Setup";
        CumulativeBudget: Decimal;
        CumulativeActualExpenses: Decimal;
        CumulativeCommitments: Decimal;
        CurrentYearBudget: Decimal;
        CurrentYearActualExpenses: Decimal;
        CurrentYearCommitments: Decimal;
        AvailableBudget: Decimal;
        JobPlanningLine: Record "Job Planning Line";
        PurchaseLine: Record "Purchase Line";
        ImprestLine: Record "Imprest Lines";
        CumulativePOCommitments: Decimal;
        CumulativePRNCommitments: Decimal;
        CumulativeS11Commitments: Decimal;
        CumulativeImprestCommitments: Decimal;
        CurrentYearPOCommitments: Decimal;
        CurrentYearPRNCommitments: Decimal;
        CurrentYearS11Commitments: Decimal;
        CurrentYearImprestCommitments: Decimal;
        CompanyInfo: Record "Company Information";
        PercentCompleted: Decimal;
}

