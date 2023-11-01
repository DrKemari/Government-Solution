#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 65145 "Inter-Project Transfer Lines"
{
    PageType = ListPart;
    SourceTable = "Inter-Project Transfer Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Transfer-From Job No"; Rec."Transfer-From Job No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transfer-From Job No field.';
                }
                field("Transfer-From Task No"; Rec."Transfer-From Task No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transfer-From Task No field.';
                }
                field("Job Task Name"; Rec."Job Task Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Task Name field.';
                }
                field("Transfer-From Expense G/L A/C"; Rec."Transfer-From Expense G/L A/C")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transfer-From Expense G/L A/C field.';
                }
                field("Expensing Description"; Rec."Expensing Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expensing Description field.';
                }
                field("Transfer Line Amount"; Rec."Transfer Line Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transfer Line Amount field.';
                }
                field("Transfer Line Amount LCY"; Rec."Transfer Line Amount LCY")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transfer Line Amount LCY field.';
                }
                field("Responsible Employee No"; Rec."Responsible Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsible Employee No field.';
                }
                field("Responsible Employee Name"; Rec."Responsible Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Responsible Employee Name field.';
                }
                field("Project Manager"; Rec."Project Manager")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Manager field.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field("Job Available Budget (LCY)"; Rec."Job Available Budget (LCY)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Job Available Budget (LCY) field.';
                }
                field(Commitments; Rec.Commitments)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Commitments field.';
                }
                field("Job Task Remaining Amount"; Rec."Job Task Remaining Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Job Task Remaining Amount field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

