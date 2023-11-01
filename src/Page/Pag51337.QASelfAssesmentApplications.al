#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51337 "QA Self Assesment Applications"
{
    CardPageID = "QA Self Assesment Card";
    PageType = List;
    SourceTable = "Quality Audit Setup";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Primary Key"; Rec."Primary Key")
                {
                    ApplicationArea = Basic;
                }
                field("Programme Audit Nos."; Rec."Programme Audit Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Institution Audit Nos."; Rec."Institution Audit Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Engagement Nos."; Rec."Engagement Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Engagement Response Nos."; Rec."Engagement Response Nos.")
                {
                    ApplicationArea = Basic;
                }
                field(FilePath; Rec.FilePath)
                {
                    ApplicationArea = Basic;
                }
                field("Audit Plan Nos."; Rec."Audit Plan Nos.")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Organization Name"; Rec."Organization Name")
                {
                    ApplicationArea = Basic;
                }
                field("Default Chief Audit Executive"; Rec."Default Chief Audit Executive")
                {
                    ApplicationArea = Basic;
                }
                field("SAR Feedback Nos."; Rec."SAR Feedback Nos.")
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

