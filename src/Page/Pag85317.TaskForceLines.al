#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85317 "TaskForce Lines"
{
    PageType = ListPart;
    SourceTable = "Resource Accreditation Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Confirmed; Rec.Confirmed)
                {
                    ApplicationArea = Basic;
                }
                field("Job Task Code"; Rec."Job Task Code")
                {
                    ApplicationArea = Basic;
                }
                field("Job Task Description"; Rec."Job Task Description")
                {
                    ApplicationArea = Basic;
                }
                field("Member Type"; Rec."Member Type")
                {
                    ApplicationArea = Basic;
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                }
                field("Account No"; Rec."Account No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Member No.';
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Member Name';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                    Caption = 'No. of Days';
                }
                field("Total Cost"; Rec."Total Cost")
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

