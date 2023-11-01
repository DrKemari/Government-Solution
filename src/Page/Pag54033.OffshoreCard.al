#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 54033 "Offshore Card"
{
    PageType = Card;
    SourceTable = "Investment Asset";
    SourceTableView = where("Asset Type" = const(Equity),
                            UnitTrust = const(false),
                            Offshore = const(true));

    layout
    {
        area(content)
        {
            group(Offshore)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Institution; Rec.Institution)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Investment Type"; Rec."Investment Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investment Type field.';
                }
                field("Investment Posting Group"; Rec."Investment Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investment Posting Group field.';
                }
                field("Custodian Code"; Rec."Custodian Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Custodian Code field.';
                }
                field("Fund Code"; Rec."Fund Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Fund Code field.';
                }
                field(Broker; Rec.Broker)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Broker field.';
                }
                field("RBA Class"; Rec."RBA Class")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the RBA Class field.';
                }
                field("Purchase Link"; Rec."Purchase Link")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Purchase Link field.';
                }
                field("Sale Link"; Rec."Sale Link")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sale Link field.';
                }
                field(Sector; Rec.Sector)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sector field.';
                }
                field("Sector Description"; Rec."Sector Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sector Description field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
            }
            group("Offshore Foreign Currency(FCY)")
            {
                field("No.Of Units"; Rec."No.Of Units")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No.Of Units field.';
                }
                field("UnitCost (FCY)"; "UnitCost (FCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the UnitCost (FCY) field.';
                }
                field("Current Value (FCY)"; Rec."Current Value (FCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Value (FCY) field.';
                }
                field("Disposal Value (FCY)"; Rec."Disposal Value (FCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disposal Value (FCY) field.';
                }
                field("Revaluations (FCY)"; Rec."Revaluations (FCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Revaluations (FCY) field.';
                }
                field("<Gain/Loss on Disposal (FCY)>"; Rec."Gain on Disposal (FCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gain on Disposal (FCY) field.';
                }
                field("Acquisition Cost (FCY)"; Rec."Acquisition Cost (FCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Acquisition Cost (FCY) field.';
                }
                field("Dividend Receivable (FCY)"; Rec."Dividend Receivable (FCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dividend Receivable (FCY) field.';
                }
            }
            group("Offshore Local Currency(LCY)")
            {
                field("No of Units"; Rec."No.Of Units")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No.Of Units field.';
                }
                field(UnitCost; UnitCost)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the UnitCost field.';
                }
                field("Current Value"; Rec."Current Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Value field.';
                }
                field("Disposal Value"; Rec."Disposal Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disposal Value field.';
                }
                field("Gain/(Loss) on Disposal"; Rec."Gain/(Loss) on Disposal")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gain/(Loss) on Disposal field.';
                }
                field(Revaluations; Rec.Revaluations)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Revaluations field.';
                }
                field("Acquisition Cost"; Rec."Acquisition Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Acquisition Cost field.';
                }
                field("Dividend Receivable"; Rec."Dividend Receivable")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dividend Receivable field.';
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Fund Deposit")
            {
                ApplicationArea = Basic;
                Image = DepositSlip;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Fund Deposit action.';
            }
            action(Buy)
            {
                ApplicationArea = Basic;
                Image = Payment;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Buy action.';
                trigger OnAction()
                begin
                    /*
                    //MESSAGE('yes');
                    IF CONFIRM('Are you sure you would like to BUY this share?',FALSE)= TRUE THEN BEGIN
                    
                    TESTFIELD("Purchase Link");
                    
                    
                     //RESET;
                    Purchase.RESET;
                    Purchase.SETRANGE(Purchase."Investment Payment Type",Purchase."Investment Payment Type"::Equity);
                    
                    Purchase.SETRANGE(Purchase."Investment No","No.");
                    Purchase.SETRANGE(Purchase.Posted,FALSE);
                    //Purchase.SETFILTER(Purchase.No,'<>%1','');
                    IF Purchase.FINDFIRST=TRUE THEN BEGIN
                    
                    PAGE.RUN(54056,Purchase);
                    
                    END ELSE BEGIN
                    
                    Purchase.INIT;
                    Purchase.No:='';
                    //Purchase.VALIDATE(Purchase.No);
                    Purchase.Date:=TODAY;
                    Purchase."Payement Type":="Purchase Link";
                    Purchase.VALIDATE(Purchase."Payment Type");
                    Purchase.Institution:=Institution;
                    //Purchase.VALIDATE(Purchase.Institution);
                    Purchase."Investment Payment Type":=Purchase."Investment Payment Type"::Equity;
                    Purchase."Investment No":="No.";
                    Purchase.VALIDATE(Purchase."Investment No");
                    Purchase.Broker:=Broker;
                    Purchase."Pay Mode":='EFT';
                    Purchase.VALIDATE(Purchase.Broker);
                    Purchase."Payment Type":=Purchase."Payment Type"::Normal;
                    Purchase.Status:=Purchase.Status::"Cheque Printing" ;
                    Purchase."Investment Payment Type":=Purchase."Investment Payment Type"::Equity;
                    Purchase.Currency:="Currency Code";
                    Purchase.VALIDATE(Purchase.Currency);
                    Purchase.INSERT(TRUE);
                    Purchase.VALIDATE(Purchase.Institution);
                    //Purchase.RESET;
                    //Purchase.SETRANGE(Purchase."Investment No","No.");
                    PAGE.RUN(54003,Purchase);
                    END;
                    END;*/


                    //MESSAGE('yes');
                    if Confirm('Are you sure you would like to BUY this share?', false) = true then begin

                        Rec.TestField("Purchase Link");


                        /*RESET;
                       Purchase.RESET;
                       Purchase.SETRANGE(Purchase."Investment Payment Type",Purchase."Investment Payment Type"::Equity);

                       Purchase.SETRANGE(Purchase."Investment No","No.");
                       Purchase.SETRANGE(Purchase.Posted,FALSE);
                       IF Purchase.FINDFIRST THEN BEGIN

                       FORM.RUN(54046,Purchase);
                       END ELSE BEGIN
                        */
                        Purchase.Init;
                        Purchase.No := '';
                        //Purchase.VALIDATE(Purchase.No);
                        //Purchase.Date:=TODAY;
                        Purchase."Payement Type" := Rec."Purchase Link";
                        Purchase.Validate(Purchase."Payement Type");
                        Purchase.Institution := Rec.Institution;
                        //Purchase.VALIDATE(Purchase.Institution);
                        Purchase."Investment No" := Rec."No.";
                        Purchase.Validate(Purchase."Investment No");
                        Purchase.Broker := Rec.Broker;
                        Purchase."Pay Mode" := 'EFT';
                        Purchase.Validate(Purchase.Broker);
                        Purchase."Payment Type" := Purchase."payment type"::Normal;
                        Purchase.Status := Purchase.Status::"Cheque Printing";
                        Purchase."Investment Payment Type" := Purchase."investment payment type"::Equity;

                        Purchase.Insert(true);
                        Purchase.Validate(Purchase.Institution);
                        //Purchase.RESET;
                        //Purchase.SETRANGE(Purchase."Investment No","No.");
                        //************************FORM.RUN(54056,Purchase)***************************//;
                        Page.Run(54003, Purchase);
                        //END;
                    end;

                end;
            }
            action(Sale)
            {
                ApplicationArea = Basic;
                Image = Sales;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Sale action.';
                trigger OnAction()
                begin

                    //GLsetup.GET;
                    if Confirm('Are you sure you would like to SALE this share?', false) = true then begin


                        Sale.Init;
                        Sale.No := '';
                        Sale.Validate(Sale.No);
                        Sale.Date := Today;
                        Sale."Receipt Type" := Rec."Sale Link";
                        Sale.Validate(Sale."Receipt Type");
                        Sale.Institution := Rec.Institution;
                        //Sale.VALIDATE(Sale.Institution);
                        Sale."Investment No" := Rec."No.";
                        Sale.Validate(Sale."Investment No");
                        Sale.Broker := Rec.Broker;
                        //Sale."Receipt No":='';
                        //Sale.VALIDATE(Sale."Receipt No");

                        //Sale."Receipt No":=INCSTR(GLsetup."Receipts No");
                        Sale.Currency := Rec."Currency Code";
                        Sale.Validate(Sale.Currency);
                        Sale."Pay Mode" := 'EFT';
                        Sale.Validate(Sale.Broker);
                        Sale."Receipt Payment Type" := Sale."receipt payment type"::Equity;
                        Sale.Insert(true);
                        //Sale.VALIDATE(Sale.No);
                        //Sale.RESET;
                        Sale.Validate(Sale.Institution);
                        //Sale.SETRANGE(Sale."Investment No","No.");
                        Page.Run(54005, Sale);

                    end;
                end;
            }
            action("Dividend Schedule")
            {
                ApplicationArea = Basic;
                Image = document;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Dividend Payment";
                RunPageLink = "Investment No." = field("No.");
                ToolTip = 'Executes the Dividend Schedule action.';
            }
            action("Share Prices")
            {
                ApplicationArea = Basic;
                Image = document;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Interest Rates";
                RunPageLink = No = field("No.");
                ToolTip = 'Executes the Share Prices action.';
            }
            action("Share Split")
            {
                ApplicationArea = Basic;
                Image = document;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Shares Split";
                RunPageLink = "Investment No" = field("No.");
                ToolTip = 'Executes the Share Split action.';
            }
            action(Bonus)
            {
                ApplicationArea = Basic;
                Image = document;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page Bonus;
                RunPageLink = "Investment No" = field("No.");
                ToolTip = 'Executes the Bonus action.';
            }
        }
    }

    trigger OnAfterGetRecord()
    begin

        Rec.CalcFields("Current Value", "Current Value (FCY)");
        Rec.CalcFields("No.Of Units");

        if Rec."No.Of Units" <> 0 then begin
            UnitCost := ROUND(Rec."Current Value" / Rec."No.Of Units", 0.01);
            "UnitCost (FCY)" := ROUND(Rec."Current Value (FCY)" / Rec."No.Of Units", 0.01);
            // MESSAGE('%1',UnitCost);
        end else begin
            UnitCost := 0;
            "UnitCost (FCY)" := 0;
        end;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin

        Rec."Asset Type" := Rec."asset type"::Equity;
        Rec.Offshore := true;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin

        Rec."Asset Type" := Rec."asset type"::Equity;
        Rec.Offshore := true;
    end;

    var
        GenJnline: Record "Gen. Journal Line";
        DefaultDim: Record "Default Dimension";
        RevaluationTable: Record "Receipts and Payment Types";
        RevaluationGainLoss: Decimal;
        Property: Record "Investment Asset";
        GenJnlLine: Record "Gen. Journal Line";
        UnitCost: Decimal;
        FA: Record "Investment Asset";
        Purchase: Record Payments1;
        Sale: Record Receipts;
        GLsetup: Record "General Ledger Setup";
        "UnitCost (FCY)": Decimal;
}

#pragma implicitwith restore

