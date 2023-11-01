#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69816 "Medical History Setup"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Medical History Setup";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Record Type"; Rec."Record Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Record Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Vaccine-Preventable Condition"; Rec."Vaccine-Preventable Condition")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vaccine-Preventable Condition field.';
                }
                field("Examination Type"; Rec."Examination Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Examination Type field.';
                }
                field("Applicable Gender"; Rec."Applicable Gender")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Applicable Gender field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
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

