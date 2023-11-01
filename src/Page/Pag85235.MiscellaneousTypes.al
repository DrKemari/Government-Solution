#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85235 "Miscellaneous Types"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Miscellaneous Transaction Type";
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
                field(Resource; Rec.Resource)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Resource field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control7; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control8; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control9; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control10; Links)
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
