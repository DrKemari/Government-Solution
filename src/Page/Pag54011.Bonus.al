#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 54011 "Bonus"
{
    PageType = List;
    SourceTable = "Expected Interest1";
    SourceTableView = where(Type = const(Bonus));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Expected Bonus Date"; Rec."Expected Interest Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expected Interest Date field.';
                }
                field("Old Ratio"; Rec."Old Ratio")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Old Ratio field.';
                }
                field("New Ratio"; Rec."New Ratio")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Ratio field.';
                }
                field("Bonus Units"; Rec."Bonus Units")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bonus Units field.';
                }
                field("New No. of Units"; Rec."New No. of Units")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New No. of Units field.';
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Post Bonus")
            {
                ApplicationArea = Basic;
                Image = post;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Post Bonus action.';
                trigger OnAction()
                begin

                    GenJnlLine.Reset;
                    GenJnlLine.SetRange(GenJnlLine."Journal Template Name", 'GENERAL');
                    GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", 'JVS');
                    GenJnlLine.DeleteAll;



                    if Property.Get(Rec."Investment No") then begin
                        Property.SetRange("Date Filter", 0D, Rec."Expected Interest Date");
                        Property.CalcFields("Current Value", "No.Of Units", "Acquisition Cost");
                        GenJnlLine.Init;
                        GenJnlLine."Journal Template Name" := 'GENERAL';
                        GenJnlLine."Journal Batch Name" := 'JVS';
                        GenJnlLine."Account Type" := GenJnlLine."account type"::"G/L Account";

                        if InvestmentPostingGrp.Get(Property."Investment Posting Group") then
                            GenJnlLine."Account No." := InvestmentPostingGrp."Investment Cost Account"
                        else
                            Error('You must specify Investment Posting Group for Equity %1', Rec."Investment No");

                        GenJnlLine.Validate(GenJnlLine."Account No.");
                        GenJnlLine."Line No." := 10000;
                        GenJnlLine.Validate(GenJnlLine."Account No.");
                        GenJnlLine."Posting Date" := Rec."Expected Interest Date";
                        GenJnlLine."Document No." := CopyStr('JV-' + Rec."Investment No" + '-' + Format(GenJnlLine."Posting Date"), 1, 20);
                        //GenJnlLine."External Document No.":="Cheque No";
                        GenJnlLine.Amount := -Property."Acquisition Cost";

                        GenJnlLine.Validate(GenJnlLine.Amount);
                        GenJnlLine.Description := Property.Description + ' ' + 'Share Split';
                        GenJnlLine."Investment Code" := Rec."Investment No";
                        GenJnlLine."Investment Transcation Type" := GenJnlLine."investment transcation type"::Bonus;
                        GenJnlLine."No. Of Units" := Property."No.Of Units";
                        /*GenJnlLine."Shortcut Dimension 1 Code":=Property."Fund Code";
                        GenJnlLine."Shortcut Dimension 2 Code":=Property."Custodian Code";
                        GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                        GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/

                        GenJnlLine."Fund Code" := Property."Fund Code";
                        GenJnlLine."Custodian Code" := Property."Custodian Code";
                        GenJnlLine.Validate(GenJnlLine."Fund Code");
                        GenJnlLine.Validate(GenJnlLine."Custodian Code");


                        //GenJnlLine."Expected Receipt date":="Schedule Date";
                        //MESSAGE('%1 %2',GenJnlLine."Shortcut Dimension 2 Code",Property."Global Dimension 2 Code");


                        if GenJnlLine.Amount <> 0 then
                            GenJnlLine.Insert(true);

                        GenJnlLine.Init;
                        GenJnlLine."Journal Template Name" := 'GENERAL';
                        GenJnlLine."Journal Batch Name" := 'JVS';
                        GenJnlLine."Account Type" := GenJnlLine."account type"::"G/L Account";

                        if InvestmentPostingGrp.Get(Property."Investment Posting Group") then
                            GenJnlLine."Account No." := InvestmentPostingGrp."Investment Cost Account"
                        else
                            Error('You must specify Investment Posting Group for Property %1', Rec."Investment No");

                        GenJnlLine.Validate(GenJnlLine."Account No.");
                        GenJnlLine."Line No." := 20000;
                        GenJnlLine.Validate(GenJnlLine."Account No.");
                        /*GenJnlLine."Shortcut Dimension 1 Code":=Property."Fund Code";
                        GenJnlLine."Shortcut Dimension 2 Code":=Property."Custodian Code";
                        GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 1 Code");
                        GenJnlLine.VALIDATE(GenJnlLine."Shortcut Dimension 2 Code");*/

                        GenJnlLine."Fund Code" := Property."Fund Code";
                        GenJnlLine."Custodian Code" := Property."Custodian Code";
                        GenJnlLine.Validate(GenJnlLine."Fund Code");
                        GenJnlLine.Validate(GenJnlLine."Custodian Code");

                        GenJnlLine."Posting Date" := Rec."Expected Interest Date";
                        GenJnlLine."Document No." := CopyStr('JV-' + Rec."Investment No" + '-' + Format(GenJnlLine."Posting Date"), 1, 20);
                        //GenJnlLine."External Document No.":="Cheque No";
                        GenJnlLine.Amount := Property."Acquisition Cost";
                        GenJnlLine.Validate(GenJnlLine.Amount);
                        GenJnlLine.Description := Property.Description + ' ' + 'Share Split';
                        GenJnlLine."Investment Code" := Rec."Investment No";
                        GenJnlLine."Investment Transcation Type" := GenJnlLine."investment transcation type"::Bonus;
                        GenJnlLine."No. Of Units" := Rec."New No. of Units";




                        if GenJnlLine.Amount <> 0 then
                            GenJnlLine.Insert(true);






                    end
                    else
                        Error('The Equity has not been defined');

                    GenJnlLine.Reset;
                    GenJnlLine.SetRange(GenJnlLine."Journal Template Name", 'GENERAL');
                    GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", 'JVS');
                    if GenJnlLine.Find('-') then
                        repeat

                            GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 1 Code");
                            GenJnlLine.Validate(GenJnlLine."Shortcut Dimension 2 Code");
                            GenJnlLine.Modify;

                        until GenJnlLine.Next = 0;





                    GenJnlLine.Reset;
                    GenJnlLine.SetRange(GenJnlLine."Journal Template Name", 'GENERAL');
                    GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", 'JVS');
                    Codeunit.Run(Codeunit::"Gen. Jnl.-Post", GenJnlLine);

                    GenJnlLine.Reset;
                    GenJnlLine.SetRange(GenJnlLine."Journal Template Name", 'GENERAL');
                    GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", 'JVS');
                    if GenJnlLine.Find('-') then
                        exit;
                    Rec.Posted := true;
                    Rec.Modify;

                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Type := Rec.Type::Bonus;
    end;

    var
        DefaultDim: Record "Default Dimension";
        RevaluationTable: Record "Receipts and Payment Types";
        RevaluationGainLoss: Decimal;
        Property: Record "Investment Asset";
        GenJnlLine: Record "Gen. Journal Line";
        InvestmentPostingGrp: Record "Investment Posting Group";
}

#pragma implicitwith restore

