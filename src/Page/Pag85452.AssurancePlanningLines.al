#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85452 "Assurance Planning Lines"
{
    PageType = ListPart;
    SourceTable = "Exam Audit Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Exam Sitting"; Rec."Exam Sitting")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Exam Sitting field.';
                }
                field("Engagement Category"; Rec."Engagement Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Engagement Category field.';
                }
                field("Lead Officer ID"; Rec."Lead Officer ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Lead Resource';
                    ToolTip = 'Specifies the value of the Lead Resource field.';
                }
                field("Lead Officer Name"; Rec."Lead Officer Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Lead Resource Email';
                    ToolTip = 'Specifies the value of the Lead Resource Email field.';
                }
                field("Planned Start Date"; Rec."Planned Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned Start Date field.';
                }
                field("Planned End Date"; Rec."Planned End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned End Date field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

