#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 70018 "Commitment Entries"
{
    PageType = List;
    SourceTable = "Commitment Entries1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field("Commitment Date"; Rec."Commitment Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Commitment Date field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field(GLAccount; Rec.GLAccount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the GLAccount field.';
                }
                field("Budget Line"; Rec."Budget Line")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget Line field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("Commitment Type"; Rec."Commitment Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Commitment Type field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("Budget Year"; Rec."Budget Year")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget Year field.';
                }
                field("Uncommittment Date"; Rec."Uncommittment Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Uncommittment Date field.';
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
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account Type field.';
                }
                field("Vote Item"; Rec."Vote Item")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vote Item field.';
                }
                field("PE Admin Code"; Rec."PE Admin Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PE Admin Code field.';
                }
                field("Procurement Plan"; Rec."Procurement Plan")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Plan field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit Cost field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field("Remaining Quanity"; Rec."Remaining Quanity")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Remaining Quanity field.';
                }
                field("Remaining in Batch"; Rec."Remaining in Batch")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Remaining in Batch field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

