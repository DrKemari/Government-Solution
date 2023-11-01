#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85415 "Disclosure Other"
{
    PageType = ListPart;
    SourceTable = "Disclosure Relative";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Institution Code"; Rec."Institution Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution Code field.';
                }
                field("Name of Institution"; Rec."Institution Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution Name field.';
                }
                field("Nature of Interest"; Rec."Nature of Interest")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Nature of Interest field.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Interest Type" := Rec."interest type"::Other;
    end;
}

#pragma implicitwith restore

