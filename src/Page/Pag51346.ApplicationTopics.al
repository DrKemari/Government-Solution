#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51346 "Application Topics"
{
    ApplicationArea = Basic;
    Caption = 'Topics';
    PageType = List;
    SourceTable = "Application Topic";
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
                    Caption = 'Topic Code';
                    ToolTip = 'Specifies the value of the Topic Code field.';
                }
                field("Chapter Code"; Rec."Chapter Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Chapter Code field.';
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

