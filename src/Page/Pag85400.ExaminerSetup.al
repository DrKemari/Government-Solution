#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85400 "Examiner Setup"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Examiner Setup";
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
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("No. of active examiners"; Rec."No. of active examiners")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of active examiners field.';
                }
                field("No. of inactive examiners"; Rec."No. of inactive examiners")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of inactive examiners field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control8; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control9; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control10; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control11; Links)
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

