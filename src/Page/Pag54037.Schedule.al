#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 54037 "Schedule"
{
    PageType = List;
    SourceTable = "Institutional Actions";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Institution Code"; Rec."Institution Code")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                }
                field("Payment Date"; Rec."Payment Date")
                {
                    ApplicationArea = Basic;
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                }
                field("Books Closure Date"; Rec."Books Closure Date")
                {
                    ApplicationArea = Basic;
                }
                field("Amount Per Share"; Rec."Amount Per Share")
                {
                    ApplicationArea = Basic;
                }
                field("New Ratio"; Rec."New Ratio")
                {
                    ApplicationArea = Basic;
                }
                field("Old Ratio"; Rec."Old Ratio")
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(post)
            {
                ApplicationArea = Basic;
                Image = post;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin

                    Equities.Reset;
                    Equities.SetRange(Equities.Institution, Rec."Institution Code");
                    if Equities.Find('-') then
                    repeat
                    Equities.SetRange(Equities."Date Filter",0D, Rec.Date);
                    Equities.CalcFields(Equities."No.Of Units");
                    //MESSAGE('%1',Equities."No.");

                    GenJnline.Reset;
                    GenJnline.SetRange(GenJnline."Journal Template Name",'GENERAL');
                    GenJnline.SetRange(GenJnline."Journal Batch Name",'DIVIDEND');
                    GenJnline.DeleteAll;


                    GenJnline.Init;
                    GenJnline."Journal Template Name":='GENERAL';
                    if Rec.Type = Rec.Type::Dividend then
                    GenJnline."Journal Batch Name":='DIVIDEND';

                    if Rec.Type = Rec.Type::"Share Split" then
                    GenJnline."Journal Batch Name":='SPLIT';

                    GenJnline."Line No.":=GenJnline."Line No."+10000;
                    GenJnline."Account Type":=GenJnline."account type"::"G/L Account";
                    if InvestmentPostingGrp.Get(Equities."Investment Posting Group") then
                    GenJnline."Account No.":=InvestmentPostingGrp."Dividend Receivable AC"
                    else
                    Error('You must specify Investment Posting Group for Equity %1',Equities."No.");
                    GenJnline.Validate(GenJnline."Account No.");
                    GenJnline."Posting Date":= Rec.Date;
                    GenJnline."Document No.":=CopyStr('JV-'+Equities."No."+'-'+Format(GenJnline."Posting Date"),1,20);
                    if Rec.Type = Rec.Type::Dividend then
                    GenJnline.Amount:=Equities."No.Of Units"* Rec."Amount Per Share";
                    if Rec.Type = Rec.Type::"Share Split" then
                    GenJnline.Amount:=Equities."No.Of Units"*(Rec."New Ratio" / Rec."Old Ratio");
                    GenJnline.Validate(GenJnline.Amount);
                    GenJnline.Description:=Equities.Description + ' ' + 'Dividend Receivable' ;
                    GenJnline."Investment Code":=Equities."No.";
                    GenJnline."Investment Transcation Type":=GenJnline."investment transcation type"::Dividend;
                    GenJnline."Shortcut Dimension 1 Code":=Equities."Fund Code";
                    GenJnline.Validate(GenJnline."Shortcut Dimension 1 Code");
                    GenJnline."Shortcut Dimension 2 Code":=Equities."Custodian Code";
                    GenJnline.Validate(GenJnline."Shortcut Dimension 2 Code");
                    GenJnline."Books Closure Date":= Rec."Books Closure Date";
                    GenJnline."Payment Date":= Rec."Payment Date";
                    if GenJnline.Amount<>0 then
                    GenJnline.Insert(true);

                    GenJnline.Init;
                    GenJnline."Journal Template Name":='GENERAL';
                    GenJnline."Journal Batch Name":='DIVIDEND';
                    GenJnline."Account Type":=GenJnline."account type"::"G/L Account";
                    if InvestmentPostingGrp.Get(Equities."Investment Posting Group") then
                    GenJnline."Account No.":=InvestmentPostingGrp."Dividend Income AC"
                    else
                    Error('You must specify Investment Posting Group for Equity %1',Equities."No.");

                    GenJnline.Validate(GenJnline."Account No.");
                    GenJnline."Line No.":=GenJnline."Line No."+10000;
                    GenJnline.Validate(GenJnline."Account No.");
                    GenJnline."Posting Date":= Rec.Date;
                    GenJnline."Document No.":=CopyStr('JV-'+Equities."No."+'-'+Format(GenJnline."Posting Date"),1,20);
                    //GenJnline."External Document No.":="Cheque No";
                    if Rec.Type = Rec.Type::Dividend then
                    GenJnline.Amount:=-Equities."No.Of Units"* Rec."Amount Per Share";
                    GenJnline.Validate(GenJnline.Amount);
                    GenJnline.Description:=Equities.Description + ' ' + 'Dividend Recievable';
                    GenJnline."Investment Code":=Equities."No.";
                    GenJnline."Investment Transcation Type":=GenJnline."investment transcation type"::Dividend;
                    GenJnline."Shortcut Dimension 1 Code":=Equities."Fund Code";
                    GenJnline.Validate(GenJnline."Shortcut Dimension 1 Code");
                    GenJnline."Shortcut Dimension 2 Code":=Equities."Custodian Code";
                    GenJnline.Validate(GenJnline."Shortcut Dimension 2 Code");

                    if GenJnline.Amount<>0 then
                    GenJnline.Insert(true);
                    until Equities.Next=0;






                    GenJnline.Reset;
                    GenJnline.SetRange(GenJnline."Journal Template Name",'GENERAL');
                    GenJnline.SetRange(GenJnline."Journal Batch Name",'DIVIDEND');
                    if GenJnline.Find('-') then
                    repeat
                    GenJnline."Shortcut Dimension 1 Code":=Equities."Fund Code";
                    GenJnline.Validate(GenJnline."Shortcut Dimension 1 Code");
                    GenJnline."Shortcut Dimension 2 Code":=Equities."Custodian Code";
                    GenJnline.Validate(GenJnline."Shortcut Dimension 2 Code");
                    GenJnline.Modify;
                    until GenJnline.Next=0;





                    Codeunit.Run(Codeunit::"Gen. Jnl.-Post",GenJnline);

                    GenJnline.Reset;
                    GenJnline.SetRange(GenJnline."Journal Template Name",'GENERAL');
                    GenJnline.SetRange(GenJnline."Journal Batch Name",'DIVIDEND');
                    if GenJnline.Find('-') then
                    exit;
                    Rec.Posted := true;
                end;
            }
        }
    }

    var
        GenJnline: Record "Gen. Journal Line";
        Equities: Record "Investment Asset";
        InvestmentPostingGrp: Record "Investment Posting Group";
}

#pragma implicitwith restore

