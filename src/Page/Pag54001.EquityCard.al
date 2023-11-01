#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 54001 "Equity Card"
{
    PageType = Card;
    SourceTable = "Investment Asset";
    SourceTableView = where("Asset Type" = const(Equity),
                            UnitTrust = const(false),
                            Offshore = const(false));

    layout
    {
        area(content)
        {
            group(General)
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
                    Caption = 'Institution Name';
                    ToolTip = 'Specifies the value of the Institution Name field.';
                }
                field("Investment Type"; Rec."Investment Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investment Type field.';
                }
                field("Investment Type Name"; Rec."Investment Type Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Investment Type Name field.';
                }
                field("Investment Posting Group"; Rec."Investment Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investment Posting Group field.';
                }
                field("Fund Code"; Rec."Fund Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Fund Code field.';
                }
                field("Custodian Code"; Rec."Custodian Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Custodian Code field.';
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
            }
            group("Equity Evaluation Details")
            {
                field("No.Of Units"; Rec."No.Of Units")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No.Of Units field.';
                }
                field("Unit value"; Rec."Unit value")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Unit value field.';
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
                field(Revaluations; Rec.Revaluations)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Revaluations field.';
                }
                field("Gain/(Loss) on Disposal"; Rec."Gain/(Loss) on Disposal")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gain/(Loss) on Disposal field.';
                }
                field("Acquisition Cost"; Rec."Acquisition Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Acquisition Cost field.';
                }
                field(Cost; Rec.Cost)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cost field.';
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
            action(Buy)
            {
                ApplicationArea = Basic;
                Image = Apply;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Buy action.';
                trigger OnAction()
                begin

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
                        Purchase."Dimension Set ID" := Rec."Dimension Set ID";

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
                ToolTip = 'Executes the Sale action.';
                trigger OnAction()
                begin

                    //GLsetup.GET;
                    if Confirm('Are you sure you would like to SALE this share?', false) = true then begin


                        Sale.Init;
                        Sale.No := '';
                        Sale.Validate(Sale.No);
                        //Sale.Date:=TODAY;
                        Sale."Receipt Type" := Rec."Sale Link";
                        Sale.Validate(Sale."Receipt Type");
                        Sale.Institution := Rec.Institution;
                        //Sale.VALIDATE(Sale.Institution);
                        Sale."Investment No" := Rec."No.";
                        Sale.Validate(Sale."Investment No");
                        Sale.Broker := Rec.Broker;
                        Sale."Dimension Set ID" := Rec."Dimension Set ID";
                        //Sale."Receipt No":='';
                        //Sale.VALIDATE(Sale."Receipt No");

                        //Sale."Receipt No":=INCSTR(GLsetup."Receipts No");

                        Sale."Pay Mode" := 'EFT';
                        Sale.Validate(Sale.Broker);
                        if Rec."No.Of Units" > 0 then
                            Sale."Price Per Share" := Rec."Current Value" / Rec."No.Of Units";
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
                Image = Skills;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Dividend Payment";
                RunPageLink = "Investment No." = field("No.");
                ToolTip = 'Executes the Dividend Schedule action.';
            }
            action("Shares Price")
            {
                ApplicationArea = Basic;
                Image = Change;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Interest Rates";
                RunPageLink = No = field("No.");
                ToolTip = 'Executes the Shares Price action.';
            }
            action("Shares Split")
            {
                ApplicationArea = Basic;
                Image = Document;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Shares Split";
                RunPageLink = "Investment No" = field("No.");
                ToolTip = 'Executes the Shares Split action.';
            }
            action(Bonus)
            {
                ApplicationArea = Basic;
                Image = Document;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page Bonus;
                RunPageLink = "Investment No" = field("No.");
                ToolTip = 'Executes the Bonus action.';
            }
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
        }
    }

    trigger OnAfterGetCurrRecord()
    begin

        Rec.CalcFields("Current Value");
        Rec.CalcFields("No.Of Units");

        if Rec."No.Of Units" <> 0 then
            UnitCost := ROUND(Rec."Current Value" / Rec."No.Of Units", 0.01)
        // MESSAGE('%1',UnitCost);
        else
            UnitCost := 0;
        Rec."Unit value" := UnitCost;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Rec."Asset Type" := Rec."asset type"::Equity;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Asset Type" := Rec."asset type"::Equity;
    end;

    var
        Purchase: Record Payments1;
        GenJnline: Record "Gen. Journal Line";
        DefaultDim: Record "Default Dimension";
        RevaluationTable: Record "Receipts and Payment Types";
        RevaluationGainLoss: Decimal;
        Property: Record "Investment Asset";
        GenJnlLine: Record "Gen. Journal Line";
        UnitCost: Decimal;
        FA: Record "Investment Asset";
        Sale: Record Receipts;
        GLsetup: Record "General Ledger Setup";
}

#pragma implicitwith restore

