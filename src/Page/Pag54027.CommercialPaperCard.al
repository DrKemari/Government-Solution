#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 54027 "Commercial Paper Card"
{
    PageType = Card;
    SourceTable = "Investment Asset";
    SourceTableView = where("Asset Type" = const("Money Market"),
                            "Investment Type" = const('07'));

    layout
    {
        area(content)
        {
            group("Treasury Deposit Definition")
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
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
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Investment Type Name"; Rec."Investment Type Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investment Type Name field.';
                }
                field("FDR Number"; Rec."FDR Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the FDR Number field.';
                }
                field("Investment Posting Group"; Rec."Investment Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investment Posting Group field.';
                }
                field("Purchase Type"; Rec."Purchase Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Purchase Type field.';
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
                field("Valuation Method"; Rec."Valuation Method")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Valuation Method field.';
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
                field("Interest Link"; Rec."Interest Link")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interest Link field.';
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
            }
            group("Treasury Deposit Setting")
            {
                field("Issue Date"; Rec."Issue Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issue Date field.';
                }
                field("Investment Date"; Rec."Investment Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investment Date field.';
                }
                field("Maturity Period"; Rec."Maturity Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maturity Period field.';
                }
                field("Maturity Period Days"; Rec."Maturity Period Days")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maturity Period Days field.';
                }
                field("Maturity Date"; Rec."Maturity Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maturity Date field.';
                }
                field("No. Of Interest Periods"; Rec."No. Of Interest Periods")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Of Interest Periods field.';
                }
                field("Interest Frequency Period"; Rec."Interest Frequency Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interest Frequency Period field.';
                }
                field("Interest Rate Type"; Rec."Interest Rate Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interest Rate Type field.';
                }
                field("Rate %"; Rec."Rate %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rate % field.';
                }
                field("Interest Calculation Based"; Rec."Interest Calculation Based")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interest Calculation Based field.';
                }
                field("Date Redeemed"; Rec."Date Redeemed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Redeemed field.';
                }
                field(Redeemed; Rec.Redeemed)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Redeemed field.';
                }
            }
            group("Treasury Deposit Valuation")
            {
                field("Current Value"; Rec."Current Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Value field.';
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
                // field("Accrued Interest"; "Accrued Interest")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Accrued Interest field.';
                // }
                field("Interest at purchase"; Rec."Interest at purchase")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interest at purchase field.';
                }
                field("Interest Received1"; Rec."Interest Received1")
                {
                    ApplicationArea = Basic;
                    Caption = 'Interest Recieved';
                    ToolTip = 'Specifies the value of the Interest Recieved field.';
                }
                field("Gain/(Loss) on Disposal"; Rec."Gain/(Loss) on Disposal")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gain/(Loss) on Disposal field.';
                }
                field("Face Value"; Rec."Face Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Face Value field.';
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(Dimensions)
            {
                ApplicationArea = Suite;
                Caption = 'Dimensions';
                Image = Dimensions;
                RunObject = Page "Default Dimensions";
                RunPageLink = "Table ID" = const(54001),
                              "No." = field("No.");
                ShortCutKey = 'Shift+Ctrl+D';
                ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';
            }
            action(Buy)
            {
                ApplicationArea = Basic;
                Image = Apply;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Buy action.';
                trigger OnAction()
                begin

                    if Confirm('Are you sure you would like to PURCHASE this Money market?', false) = true then begin

                        Rec.TestField("Purchase Link");

                        /* RESET;
                        Purchase.RESET;
                        Purchase.SETRANGE(Purchase."Investment Payment Type",Purchase."Investment Payment Type"::Equity);

                        Purchase.SETRANGE(Purchase."Investment No","No.");
                        Purchase.SETRANGE(Purchase.Posted,FALSE);
                        IF Purchase.FINDFIRST THEN BEGIN

                        FORM.RUN(50123,Purchase);
                        END ELSE BEGIN
                         */


                        Purchase.Init;
                        Purchase.No := '';
                        Purchase.Date := Today;
                        Purchase."Payement Type" := Rec."Purchase Link";
                        Purchase.Validate(Purchase."Payement Type");
                        Purchase.Institution := Rec.Institution;

                        Purchase."Investment No" := Rec."No.";
                        Purchase.Validate(Purchase."Investment No");
                        Purchase.Broker := Rec.Broker;
                        Purchase."Pay Mode" := 'EFT';
                        Purchase.Validate(Purchase.Broker);
                        Purchase."Payment Type" := Purchase."payment type"::Normal;
                        Purchase.Status := Purchase.Status::"Cheque Printing";
                        Purchase."Investment Payment Type" := Purchase."investment payment type"::"Money Market";
                        Purchase."Dimension Set ID" := Rec."Dimension Set ID";
                        Purchase.Insert(true);
                        Purchase.Validate(Purchase.Institution);
                        //Purchase.RESET;
                        //Purchase.SETRANGE(Purchase."Investment No","No.");
                        //FORM.RUN(54046,Purchase);
                        //END;
                        Page.Run(54056, Purchase);
                    end;

                end;
            }
            action(Redeem)
            {
                ApplicationArea = Basic;
                Image = Replan;
                Promoted = true;
                PromotedCategory = "Report";
                ToolTip = 'Executes the Redeem action.';
                trigger OnAction()
                begin

                    //GLsetup.GET;
                    if Confirm('Are you sure you would like to REDEEM this Money market deposit?', false) = true then begin

                        Rec.CalcFields("Acquisition Cost", Revaluations, "Accrued Interest");

                        Sale.Init;
                        Sale.No := '';
                        Sale.Validate(Sale.No);
                        Sale.Date := Today;
                        Sale."Receipt Type" := Rec."Sale Link";
                        Sale.Validate(Sale."Receipt Type");
                        Sale.Institution := Rec.Institution;

                        Sale."Investment No" := Rec."No.";
                        Sale.Validate(Sale."Investment No");
                        Sale.Broker := Rec.Broker;
                        Sale."Receipt No" := '';
                        //Sale.VALIDATE(Sale."Receipt No");

                        //Sale."Receipt No":=INCSTR(GLsetup."Receipts No");

                        Sale.Amount := Rec."Acquisition Cost";
                        Sale."Revaluation Gain/(Loss)" := Rec.Revaluations;
                        Sale."Accrued Interest" := Rec."Accrued Interest";
                        Sale."Cost-Temp" := Rec."Acquisition Cost";
                        Sale."Revaluation-Temp" := Rec.Revaluations;
                        Sale."Accrued Interest-Temp" := Rec."Accrued Interest";
                        Sale."Pay Mode" := 'EFT';
                        Sale.Validate(Sale.Broker);
                        Sale."Receipt Payment Type" := Sale."receipt payment type"::"Money Market";
                        Sale."Dimension Set ID" := Rec."Dimension Set ID";
                        Sale.Insert(true);
                        Sale.Validate(Sale.No);
                        Sale.Validate(Sale.Institution);
                        //Purchase.RESET;
                        //Purchase.SETRANGE(Purchase."Investment No","No.");
                        //FORM.RUN(54059,Sale);
                        Page.Run(54031, Sale);
                    end;
                end;
            }
            action("Accrued Interests")
            {
                ApplicationArea = Basic;
                Image = Revenue;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Accrued Interest action.';
                trigger OnAction()
                begin

                    Investment.Reset;
                    Investment.SetRange(Investment."No.", Rec."No.");
                    Report.Run(54066, true, true, Investment)
                end;
            }
            action(Revaluation)
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Revaluation action.';
            }
            action("View Interest Schedule")
            {
                ApplicationArea = Basic;
                RunObject = Page "Interest Schedule1a";
                RunPageLink = "Investment No" = field("No.");
                ToolTip = 'Executes the View Interest Schedule action.';
            }
            action("Receive Interest")
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Receive Interest action.';
                trigger OnAction()
                begin

                    //GLsetup.GET;
                    if Confirm('Are you sure you would like to RECEIVE this Money market interest?', false) = true then begin


                        Sale.Init;
                        Sale.No := '';
                        Sale.Validate(Sale.No);
                        Sale.Date := Today;
                        Sale."Receipt Type" := Rec."Interest Link";
                        Sale.Validate(Sale."Receipt Type");
                        Sale.Institution := Rec.Institution;

                        Sale."Investment No" := Rec."No.";
                        Sale.Validate(Sale."Investment No");
                        Sale.Broker := Rec.Broker;
                        Sale."Receipt No" := '';
                        //Sale.VALIDATE(Sale."Receipt No");

                        //Sale."Receipt No":=INCSTR(GLsetup."Receipts No");
                        Sale.Amount := Rec."Accrued Interest";
                        Sale."Pay Mode" := 'EFT';
                        Sale.Validate(Sale.Broker);
                        Sale."Receipt Payment Type" := Sale."receipt payment type"::"Money Market";
                        Sale."Dimension Set ID" := Rec."Dimension Set ID";
                        Sale.Insert(true);
                        Sale.Validate(Sale.No);
                        Sale.Validate(Sale.Institution);
                        //Purchase.RESET;
                        //Purchase.SETRANGE(Purchase."Investment No","No.");
                        Page.Run(54031, Sale);

                    end;
                end;
            }
            action("Capitalize Gain/(Loss)")
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Capitalize Gain/(Loss) action.';
            }
            action(Rates)
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Rates action.';
            }
            action(Rollover)
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Rollover action.';
            }
            action("Money market Prices")
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Money market Prices action.';
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin

        Rec."Asset Type" := Rec."asset type"::"Money Market";
        Rec."Investment Type" := '07';
        Rec.Validate("Investment Type");
        // "Deposit Type":="Deposit Type"::Fixed;

        Rec.UnitTrust := true;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin

        Rec."Asset Type" := Rec."asset type"::"Money Market";
        Rec."Investment Type" := '07';
        Rec.Validate("Investment Type");
        // "Deposit Type":="Deposit Type"::Fixed;

        Rec.UnitTrust := true;
    end;

    var
        Schedule: Record "Expected Interest1";
        NextInterestDate: Date;
        i: Integer;
        Investment: Record "Investment Asset";
        InvestSetup: Record "Investment Setup";
        Purchase: Record Payments1;
        Sale: Record Receipts;
        BondCalc: Record "Bond Calculator";
        BondCalc2: Record "Bond Calculator";
}

#pragma implicitwith restore

