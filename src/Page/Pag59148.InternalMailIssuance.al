#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 59148 "Internal Mail Issuance"
{
    ApplicationArea = Basic;
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Internal Mail Issuance";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Issued To"; Rec."Issued To")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issued To field.';
                }
                field("Issued To Employee No"; Rec."Issued To Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issued To Employee No field.';
                }
                field("Issued to Employee Name"; Rec."Issued to Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issued to Employee Name field.';
                }
                field("Issued By"; Rec."Issued By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issued By field.';
                }
                field("Issued On"; Rec."Issued On")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issued On field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control11; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control12; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control13; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control14; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

