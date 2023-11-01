report 70000 "Purchase Requisition Extended"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Purchase Requisition Extended.rdlc';

    dataset
    {
        dataitem("Requisition Header1";"Requisition Header1")
        {
            DataItemTableView = SORTING("No.") WHERE("Requisition Type"=CONST("Purchase Requisition"));
            PrintOnlyIfDetail = true;
            RequestFilterFields = "No.";
            column(Department;Department)
            {
            }
            column(Requisition_Header1__Requisition_Header1___No__;"Requisition Header1"."No.")
            {
            }
            column(CompInfo_Picture;CompInfo.Picture)
            {
            }
            column(CompInfo_Name;CompInfo.Name)
            {
            }
            column(Requisition_Header1__Employee_Name_;"Employee Name")
            {
            }
            column(Requisition_Header1__Requisition_Header1___Requisition_Date_;"Requisition Header1"."Requisition Date")
            {
            }
            column(PROCUREMENT_REQUISITIONCaption;PROCUREMENT_REQUISITIONCaptionLbl)
            {
            }
            column(FromCaption;FromCaptionLbl)
            {
            }
            column(DepartmentCaption;DepartmentCaptionLbl)
            {
            }
            column(QTYCaption;QTYCaptionLbl)
            {
            }
            column(DESCRIPTIONCaption;DESCRIPTIONCaptionLbl)
            {
            }
            column(UNITCaption;UNITCaptionLbl)
            {
            }
            column(Previous_Supplied__Where_Known_Caption;Previous_Supplied__Where_Known_CaptionLbl)
            {
            }
            column(No_Caption;No_CaptionLbl)
            {
            }
            column(ToCaption;ToCaptionLbl)
            {
            }
            column(Procurement_ManagerCaption;Procurement_ManagerCaptionLbl)
            {
            }
            column(Please_procure_the_following_items_on_our_behalfCaption;Please_procure_the_following_items_on_our_behalfCaptionLbl)
            {
            }
            column(Unit_PriceCaption;Unit_PriceCaptionLbl)
            {
            }
            column(Estimated_CostCaption;Estimated_CostCaptionLbl)
            {
            }
            column(Date_Caption;Date_CaptionLbl)
            {
            }
            column(Requisition_Lines1__Budget_Line_Caption;"Requisition Lines1".FieldCaption("Budget Line"))
            {
            }
            column(NO_Caption_Control1000000126;NO_Caption_Control1000000126Lbl)
            {
            }
            dataitem("Requisition Lines1";"Requisition Lines1")
            {
                DataItemLink = "Requisition No"=FIELD("No.");
                DataItemTableView = SORTING("Requisition No","Line No");
                column(Requisition_Lines1_Quantity;Quantity)
                {
                }
                column(Requisition_Lines1_Description;Description)
                {
                }
                column(EmptyString;'')
                {
                }
                column(Requisition_Lines1__Requisition_Lines1___Unit_of_Measure_;"Requisition Lines1"."Unit of Measure")
                {
                }
                column(Requisition_Lines1__Requisition_Lines1___Unit_Price_;"Requisition Lines1"."Unit Cost")
                {
                }
                column(RecSeq;RecSeq)
                {
                }
                column(Requisition_Lines1_Amount;Amount)
                {
                }
                column(Requisition_Lines1__Budget_Line_;"Budget Line")
                {
                }
                column(V1stapprover_;"1stapprover")
                {
                }
                column(V2ndapprover_;"2ndapprover")
                {
                }
                column(UserRecApp2_Picture;UserRecApp2.Picture)
                {
                }
                column(UserRecApp1_Picture;UserRecApp1.Picture)
                {
                }
                column(UserRecApp3_Picture;UserRecApp3.Picture)
                {
                }
                column(V3rdapprover_;"3rdapprover")
                {
                }
                column(V3rdapproverdate_;"3rdapproverdate")
                {
                }
                column(V2ndapproverdate_;"2ndapproverdate")
                {
                }
                column(V1stapproverdate_;"1stapproverdate")
                {
                }
                column(PREPARED_BYCaption;PREPARED_BYCaptionLbl)
                {
                }
                column(CHECKED_BY_Caption;CHECKED_BY_CaptionLbl)
                {
                }
                column(SIGNATURECaption;SIGNATURECaptionLbl)
                {
                }
                column(SIGNATURECaption_Control1000000032;SIGNATURECaption_Control1000000032Lbl)
                {
                }
                column(DATE__________________________________________________Caption;DATE__________________________________________________CaptionLbl)
                {
                }
                column(DATE__________________________________________________Caption_Control1000000036;DATE__________________________________________________Caption_Control1000000036Lbl)
                {
                }
                column(APPROVED_BY_Caption;APPROVED_BY_CaptionLbl)
                {
                }
                column(SIGNATURE_Caption;SIGNATURE_CaptionLbl)
                {
                }
                column(DATE__________________________________________________Caption_Control1000000040;DATE__________________________________________________Caption_Control1000000040Lbl)
                {
                }
                column(Requisition_Lines1_Requisition_No;"Requisition No")
                {
                }
                column(Requisition_Lines1_Line_No;"Line No")
                {
                }

                trigger OnAfterGetRecord()
                begin


                      ThisLNAmt:=ThisLNAmt+"Requisition Lines1".Amount;
                      RecSeq:=RecSeq+1;
                end;

                trigger OnPreDataItem()
                begin
                     RecSeq:=0;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                        Dimvalues.SetRange(Dimvalues."Dimension Code",GenLedSetup."Global Dimension 1 Code");
                        Dimvalues.SetRange(Dimvalues.Code,"Requisition Header1"."Global Dimension 1 Code");
                        if Dimvalues.Find('-') then
                          Department:=Dimvalues.Name;

                  //DateRequired:="Requisition Header"."Required Date";
                  CompInfo.CalcFields(Picture);

                ApprovalEntries.Reset;
                ApprovalEntries.SetRange(ApprovalEntries."Table ID",59002);
                ApprovalEntries.SetRange(ApprovalEntries."Document No.","Requisition Header1"."No.");
                ApprovalEntries.SetRange(ApprovalEntries.Status,ApprovalEntries.Status::Approved);
                if ApprovalEntries.Find('-') then
                begin
                i:=0;
                repeat
                i:=i+1;
                if i=1 then
                begin
                "1stapprover":=ApprovalEntries."Approver ID";
                 "1stapproverdate":=ApprovalEntries."Last Date-Time Modified";
                 if UserRecApp1.Get("1stapprover") then
                 UserRecApp1.CalcFields(UserRecApp1.Picture);

                end;

                if i=2 then
                begin
                "2ndapprover":=ApprovalEntries."Approver ID";
                "2ndapproverdate":=ApprovalEntries."Last Date-Time Modified";
                 if UserRecApp2.Get("2ndapprover") then
                 UserRecApp2.CalcFields(UserRecApp2.Picture);

                end;

                if i=3 then
                begin
                "3rdapprover":=ApprovalEntries."Approver ID";
                "3rdapproverdate":=ApprovalEntries."Last Date-Time Modified";
                 if UserRecApp3.Get("3rdapprover") then
                 UserRecApp3.CalcFields(UserRecApp3.Picture);

                end;

                until ApprovalEntries.Next=0;
                end;
            end;

            trigger OnPreDataItem()
            begin
                     CompInfo.Get;
                     GenLedSetup.Get;
            end;
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        Department: Text[60];
        Dimvalues: Record "Dimension Value";
        Vendors: Record Vendor;
        PrevMonthBud: Decimal;
        CurrMonthBud: Decimal;
        TotAvailableBud: Decimal;
        GLAccount: Record "G/L Account";
        GenLedSetup: Record "General Ledger Setup";
        QtyStore: Record Item;
        GenPostGroup: Record "General Posting Setup";
        Budget: Decimal;
        CurrMonth: Code[10];
        CurrYR: Code[10];
        BudgDate: Text[30];
        ReqHeader: Record "Purchase Header";
        BudgetDate: Date;
        YrBudget: Decimal;
        "BudgetB/F": Decimal;
        RequisitionLine: Record "Purchase Line";
        BudgetGL: Code[20];
        ThisLNAmt: Decimal;
        MonthReqHdr: Record "Purchase Header";
        PeriodTo: Date;
        MonthReq: Record "Purchase Line";
        TotalMonthReq: Decimal;
        RecSeq: Integer;
        DateRequired: Date;
        CompInfo: Record "Company Information";
        ApprovalEntries: Record "Approval Entry";
        "1stapprover": Text[30];
        "2ndapprover": Text[30];
        i: Integer;
        "1stapproverdate": DateTime;
        "2ndapproverdate": DateTime;
        UserRec: Record "User Setup";
        UserRecApp1: Record "User Setup";
        UserRecApp2: Record "User Setup";
        UserRecApp3: Record "User Setup";
        "3rdapprover": Text[30];
        "3rdapproverdate": DateTime;
        PROCUREMENT_REQUISITIONCaptionLbl: Label 'PROCUREMENT REQUISITION';
        FromCaptionLbl: Label 'From';
        DepartmentCaptionLbl: Label 'Department';
        QTYCaptionLbl: Label 'QTY';
        DESCRIPTIONCaptionLbl: Label 'DESCRIPTION';
        UNITCaptionLbl: Label 'UNIT';
        Previous_Supplied__Where_Known_CaptionLbl: Label 'Previous Supplied (Where Known)';
        No_CaptionLbl: Label 'No.';
        ToCaptionLbl: Label 'To';
        Procurement_ManagerCaptionLbl: Label 'Procurement Manager';
        Please_procure_the_following_items_on_our_behalfCaptionLbl: Label 'Please procure the following items on our behalf';
        Unit_PriceCaptionLbl: Label 'Unit Price';
        Estimated_CostCaptionLbl: Label 'Estimated Cost';
        Date_CaptionLbl: Label 'Date:';
        NO_Caption_Control1000000126Lbl: Label 'NO.';
        PREPARED_BYCaptionLbl: Label 'PREPARED BY';
        CHECKED_BY_CaptionLbl: Label 'CHECKED BY ';
        SIGNATURECaptionLbl: Label 'SIGNATURE';
        SIGNATURECaption_Control1000000032Lbl: Label 'SIGNATURE';
        DATE__________________________________________________CaptionLbl: Label 'DATE _________________________________________________';
        DATE__________________________________________________Caption_Control1000000036Lbl: Label 'DATE _________________________________________________';
        APPROVED_BY_CaptionLbl: Label 'APPROVED BY ';
        SIGNATURE_CaptionLbl: Label 'SIGNATURE ';
        DATE__________________________________________________Caption_Control1000000040Lbl: Label 'DATE _________________________________________________';

    procedure GetMonthlyTot(var Periodfrom: Date;var Dept: Code[20]) TotMonthReq: Decimal
    begin
        /*TotMonthReq:=0;
        PeriodTo:=CALCDATE('1M',Periodfrom);
        PeriodTo:=CALCDATE('-1D',PeriodTo);
        MonthReqHdr.RESET;
        //MonthReqHdr.SETRANGE(MonthReqHdr."Request date",Periodfrom,PeriodTo);
        MonthReqHdr.SETRANGE(MonthReqHdr."Global Dimension 1 Code",Dept);
        MonthReqHdr.SETRANGE(MonthReqHdr.Status,MonthReqHdr.Status::Released);
        IF MonthReqHdr.FIND('-') THEN BEGIN
           REPEAT
           MonthReq.RESET;
           MonthReq.SETRANGE(MonthReq."Requistion No",MonthReqHdr.No);
           IF MonthReq.FIND('-') THEN BEGIN
              REPEAT
              TotMonthReq:=TotMonthReq+MonthReq."Line Amount";
              UNTIL MonthReq.NEXT=0;
           END;
           UNTIL MonthReqHdr.NEXT=0;
        END;*/

    end;
}

