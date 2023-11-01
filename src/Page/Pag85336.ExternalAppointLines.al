#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85336 "External Appoint Lines"
{
    PageType = ListPart;
    SourceTable = "Resource Accreditation Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Job Task Code"; Rec."Job Task Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Task Code field.';
                }
                field("Job Task Description"; Rec."Job Task Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Task Description field.';
                }
                field("Member Type"; Rec."Member Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Member Type field.';
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account Type field.';
                }
                field("Account No"; Rec."Account No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Member No.';
                    ToolTip = 'Specifies the value of the Member No. field.';
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Member Name';
                    ToolTip = 'Specifies the value of the Member Name field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                    Caption = 'No. of Days';
                    ToolTip = 'Specifies the value of the No. of Days field.';
                }
                field("Total Cost"; Rec."Total Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Cost field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

