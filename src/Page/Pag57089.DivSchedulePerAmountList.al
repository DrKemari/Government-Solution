#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57089 "Div Schedule  Per Amount List"
{
    ApplicationArea = Basic;
    Caption = 'Div Schedule  Per Amount List';
    CardPageID = "Div Schedule Per Amount";
    Editable = false;
    PageType = List;
    SourceTable = "Budget Commitment";
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No. field.';
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account No. field.';
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account Name field.';
                }
                field("Budgeted Amount"; Rec."Budgeted Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budgeted Amount field.';
                }
                field("Commited Amount PRN"; Rec."Commited Amount PRN")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Commited Amount PRN field.';
                }
                field("Budget Start Date"; Rec."Budget Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget Start Date field.';
                }
                field("Commited Amount Orders"; Rec."Commited Amount Orders")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Commited Amount Orders field.';
                }
                field("Budget Name"; Rec."Budget Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget Name field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

