#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69782 "Benefit Programs"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Benefit Program";
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
                field("Benefit Category"; Rec."Benefit Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Benefit Category field.';
                }
                field("No. of Benefit Packages"; Rec."No. of Benefit Packages")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Benefit Packages field.';
                }
                field("No. of Benefit Plans"; Rec."No. of Benefit Plans")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Benefit Plans field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control9; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control10; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control11; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control12; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Eligibility Criteria")
            {
                ApplicationArea = Basic;
                Promoted = true;
                RunObject = Page "Eligibility Criteria";
                RunPageLink = "Benefit ID" = field(Code);
                ToolTip = 'Executes the Eligibility Criteria action.';
            }
        }
    }
}

#pragma implicitwith restore

