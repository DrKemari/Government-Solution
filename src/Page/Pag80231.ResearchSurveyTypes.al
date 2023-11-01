#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80231 "Research Survey Types"
{
    ApplicationArea = Basic;
    CardPageID = "Research Survey Type Card";
    Editable = false;
    PageType = List;
    SourceTable = "Research Survey Type";
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
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Business Research Category"; Rec."Business Research Category")
                {
                    ApplicationArea = Basic;
                }
                field("Target Respondent Type"; Rec."Target Respondent Type")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Directorate"; Rec."Primary Directorate")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Department"; Rec."Primary Department")
                {
                    ApplicationArea = Basic;
                }
                field("No. of BR Templates"; Rec."No. of BR Templates")
                {
                    ApplicationArea = Basic;
                }
                field("No. of BR Surveys"; Rec."No. of BR Surveys")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Survey Responses"; Rec."No. of Survey Responses")
                {
                    ApplicationArea = Basic;
                }
                field("No. of BR Final Reports"; Rec."No. of BR Final Reports")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

