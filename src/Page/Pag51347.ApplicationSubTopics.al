#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51347 "Application Sub-Topics"
{
    ApplicationArea = Basic;
    Caption = 'Sub-Topics';
    PageType = List;
    SourceTable = "Application SubTopics";
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
                    Caption = 'Sub-Topic Code';
                    ToolTip = 'Specifies the value of the Sub-Topic Code field.';
                }
                field("Component Code"; Rec."Component Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Topic Code';
                    ToolTip = 'Specifies the value of the Topic Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Maximum Score"; Rec."Maximum Score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maximum Score field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

