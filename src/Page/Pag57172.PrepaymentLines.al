#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57172 "Prepayment Lines"
{
    PageType = ListPart;
    SourceTable = "Prepayment Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Editable = false;
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                }
                field("Employee Contribution"; Rec."Employee Contribution")
                {
                    ApplicationArea = Basic;
                }
                field("Employer Contribution"; Rec."Employer Contribution")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

