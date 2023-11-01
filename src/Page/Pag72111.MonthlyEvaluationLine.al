#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72111 "Monthly Evaluation Line"
{
    PageType = ListPart;
    SourceTable = "Monthly Evaluation Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Project No"; Rec."Project No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project No field.';
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field("Contractor No"; Rec."Contractor No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor No field.';
                }
                field("Contractor Name"; Rec."Contractor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor Name field.';
                }
                field(Scope; Rec.Scope)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Scope field.';
                }
                field(Requirement; Rec.Requirement)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requirement field.';
                }
                field(Pass; Rec.Pass)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pass field.';
                }
                field(Fail; Rec.Fail)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Fail field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

