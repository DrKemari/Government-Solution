#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80075 "Appraisal Questionnaire Temp"
{
    ApplicationArea = Basic;
    CardPageID = "Appraisal Questionnaire Temp C";
    PageType = List;
    SourceTable = "Appraisal Questionnaire Temp";
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
                field("Template Category"; Rec."Template Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Template Category field.';
                }
                field("General Instructions"; Rec."General Instructions")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the General Instructions field.';
                }
                field("Global?"; Rec."Global?")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global? field.';
                }
                field("Primary Responsibility Center"; Rec."Primary Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Responsibility Center field.';
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Effective Date field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

