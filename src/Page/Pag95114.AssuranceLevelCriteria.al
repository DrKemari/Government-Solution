#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 95114 "Assurance Level Criteria"
{
    CardPageID = "Assurance Level Criterion";
    PageType = List;
    SourceTable = "Assurance Level Criteria";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Assurance Level ID"; Rec."Assurance Level ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assurance Level ID field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

