#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 54006 "Dividend Payment"
{
    Editable = false;
    PageType = List;
    SourceTable = "Dividend Payment";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Transaction Type"; Rec."Transaction Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transaction Type field.';
                }
                field("Dividend Rate"; Rec."Dividend Rate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dividend Rate field.';
                }
                field("Books Closure Date"; Rec."Books Closure Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Books Closure Date field.';
                }
                field("Payment Date"; Rec."Payment Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment Date field.';
                }
                field("No. of Shares"; Rec."No. of Shares")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Shares field.';
                }
                field("Dividend Amount"; Rec."Dividend Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dividend Amount field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Payment posted"; Rec."Payment posted")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment posted field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(POST)
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the POST action.';
                trigger OnAction()
                begin

                    if Property.Get(Rec."Investment No.") then begin
                        Property.SetRange("Date Filter", 0D, Rec."Books Closure Date");
                        Property.CalcFields("Current Value", "No.Of Units", "Acquisition Cost");
                        GenJnlLine.Init;
                        GenJnlLine."Journal Template Name" := 'GENERAL';
                        GenJnlLine."Journal Batch Name" := 'JVS';
                        GenJnlLine."Account Type" := GenJnlLine."account type"::"G/L Account";

                        if InvestmentPostingGrp.Get(Property."Investment Posting Group") then
                            GenJnlLine."Account No." := InvestmentPostingGrp."Dividend Receivable AC"
                        else
                            Error('You must specify Investment Posting Group for Property %1', Rec."Investment No.");

                        //GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                        GenJnlLine."Line No." := 70000;
                        //GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                        GenJnlLine."Posting Date" := Rec."Books Closure Date";
                        GenJnlLine."Document No." := CopyStr('JV-' + Rec."Investment No." + '-' + Format(GenJnlLine."Posting Date"), 1, 20);
                        //GenJnlLine."External Document No.":="Cheque No";
                        GenJnlLine.Amount := -DivAmt;
                        GenJnlLine.Validate(GenJnlLine.Amount);
                        GenJnlLine.Description := Property.Description + ' ' + 'Dividend';
                        GenJnlLine."Investment Code" := Rec."Investment No.";
                        GenJnlLine."Investment Transcation Type" := GenJnlLine."investment transcation type"::Dividend;
                        GenJnlLine."No. Of Units" := Property."No.Of Units";
                        //GenJnlLine."Expected Receipt date":="Schedule Date";
                        /*GenJnlLine."Shortcut Dimension 1 Code":=Property."Global Dimension 1 Code";
                        GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                        GenJnlLine."Shortcut Dimension 2 Code":=Property."Global Dimension 2 Code";
                        GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/

                        GenJnline."Fund Code" := Property."Fund Code";
                        GenJnline."Custodian Code" := Property."Custodian Code";
                        GenJnline.Validate(GenJnline."Fund Code");
                        GenJnline.Validate(GenJnline."Custodian Code");


                        if GenJnlLine.Amount <> 0 then
                            GenJnlLine.Insert(true);

                        GenJnlLine.Init;
                        GenJnlLine."Journal Template Name" := 'GENERAL';
                        GenJnlLine."Journal Batch Name" := 'JVS';
                        GenJnlLine."Account Type" := GenJnlLine."account type"::"G/L Account";

                        if InvestmentPostingGrp.Get(Property."Investment Posting Group") then
                            GenJnlLine."Account No." := InvestmentPostingGrp."Investment Cost Account"
                        else
                            Error('You must specify Investment Posting Group for Property %1', Rec."Investment No.");

                        //GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                        GenJnlLine."Line No." := 80000;
                        //GenJnlLine.VALIDATE(GenJnlLine."Account No.");
                        GenJnlLine."Posting Date" := Rec."Books Closure Date";
                        GenJnlLine."Document No." := CopyStr('JV-' + Rec."Investment No." + '-' + Format(GenJnlLine."Posting Date"), 1, 20);
                        //GenJnlLine."External Document No.":="Cheque No";
                        GenJnlLine.Amount := DivAmt;
                        GenJnlLine.Validate(GenJnlLine.Amount);
                        GenJnlLine.Description := Property.Description + ' ' + 'Dividend';
                        GenJnlLine."Investment Code" := Rec."Investment No.";
                        GenJnlLine."Investment Transcation Type" := GenJnlLine."investment transcation type"::Dividend;
                        //GenJnlLine."No. Of Units":="New No. of Units";
                        GenJnlLine."Expected Receipt date" := Rec."Payment Date";
                        /*GenJnlLine."Shortcut Dimension 1 Code":=Property."Global Dimension 1 Code";
                        GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                        GenJnlLine."Shortcut Dimension 2 Code":=Property."Global Dimension 2 Code";
                        GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/

                        GenJnline."Fund Code" := Property."Fund Code";
                        GenJnline."Custodian Code" := Property."Custodian Code";
                        GenJnline.Validate(GenJnline."Fund Code");
                        GenJnline.Validate(GenJnline."Custodian Code");

                        if GenJnlLine.Amount <> 0 then
                            GenJnlLine.Insert(true);






                    end
                    else
                        Error('The Property has not been defined');
                    GenJnlLine.Reset;
                    GenJnlLine.SetRange(GenJnlLine."Journal Template Name", 'GENERAL');
                    GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", 'JVS');
                    /*
                    GenJnlLine.RESET;
                    GenJnlLine.SETRANGE(GenJnlLine."Journal Template Name",'GENERAL');
                    GenJnlLine.SETRANGE(GenJnlLine."Journal Batch Name",'JVS');
                    IF GenJnline.FIND('-') THEN
                    REPEAT
                    GenJnlLine."Shortcut Dimension 1 Code":=Property."Global Dimension 1 Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                    GenJnlLine."Shortcut Dimension 2 Code":=Property."Global Dimension 2 Code";
                    GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");
                    GenJnlLine.MODIFY;
                    UNTIL GenJnline.NEXT=0;
                    */




                    Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnlLine);

                    GenJnlLine.Reset;
                    GenJnlLine.SetRange(GenJnlLine."Journal Template Name", 'GENERAL');
                    GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", 'JVS');
                    if GenJnlLine.Find('-') then
                        exit;
                    //Posted:=TRUE;

                end;
            }
        }
    }

    var
        DivAmt: Decimal;
        FixAssets: Record "Investment Asset";
        "Div Units": Decimal;
        GenJnline: Record "Gen. Journal Line";
        DefaultDim: Record "Default Dimension";
        RevaluationTable: Record "Investment History";
        RevaluationGainLoss: Decimal;
        Property: Record "Investment Asset";
        GenJnlLine: Record "Gen. Journal Line";
        InvestmentPostingGrp: Record "Investment Posting Group";
}

#pragma implicitwith restore

