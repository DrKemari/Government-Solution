#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69761 "Medical Lines"
{
    PageType = ListPart;
    SourceTable = "Prehire Medical Report Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Medical History Type"; Rec."Medical History Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Medical History Type field.';
                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Medical History Response"; Rec."Medical History Response")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Medical History Response field.';
                }
                field("Medical Examination Results"; Rec."Medical Examination Results")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Medical Examination Results field.';
                }
                field("Additional Details"; Rec."Additional Details")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Additional Details field.';
                }
                field("Date of Last Vaccination"; Rec."Date of Last Vaccination")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Last Vaccination field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

