#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69403 "Hazard Control Measures"
{
    CardPageID = "Hazard Control Measure";
    PageType = List;
    SourceTable = "Hazard Control Measure";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Hazard Type"; Rec."Hazard Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Hazard Type field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Recommended Preventive Action"; Rec."Recommended Preventive Action")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recommended Preventive Action field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

