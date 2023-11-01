#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69500 "Emergency Drill Finding Lines"
{
    ApplicationArea = Basic;
    PageType = ListPart;
    SourceTable = "Emergency Drill Finding";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Evacuation Event ID"; Rec."Evacuation Event ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evacuation Event ID field.';
                }
                field("Criteria Code"; Rec."Criteria Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Criteria Code field.';
                }
                field("Drill Assessment Criteria"; Rec."Drill Assessment Criteria")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Drill Assessment Criteria field.';
                }
                field("General Rating"; Rec."General Rating")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the General Rating field.';
                }
                field("Additional Comments/Findings"; Rec."Additional Comments/Findings")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Additional Comments/Findings field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

