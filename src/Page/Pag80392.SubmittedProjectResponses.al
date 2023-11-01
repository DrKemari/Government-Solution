#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80392 "Submitted Project Responses"
{
    ApplicationArea = Basic;
    CardPageID = "Submitted Project Response";
    Editable = false;
    PageType = List;
    SourceTable = "Business Research Response";
    SourceTableView = where("Target Respondent Type" = const(Contacts),
                            Status = const(Submitted));
    UsageCategory = Documents;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Business Research Category"; Rec."Business Research Category")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Survey ID"; Rec."Survey ID")
                {
                    ApplicationArea = Basic;
                }
                field("Survey Type"; Rec."Survey Type")
                {
                    ApplicationArea = Basic;
                }
                field("Target Respondent Type"; Rec."Target Respondent Type")
                {
                    ApplicationArea = Basic;
                }
                field("Participant ID"; Rec."Participant ID")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Department ID"; Rec."Primary Department ID")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Directorate ID"; Rec."Primary Directorate ID")
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

