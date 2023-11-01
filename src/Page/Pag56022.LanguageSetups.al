#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 56022 "Language Set-ups"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = Language;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the code for a language.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the name of the language.';
                }
                field("Windows Language Name"; Rec."Windows Language Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies if you enter an ID in the Windows Language ID field.';
                }
                field("Windows Language ID"; Rec."Windows Language ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the ID of the Windows language associated with the language code you have set up in this line.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

