#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72028 "Roads Management Setup Card"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "Roads Management Setup";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Primary Key"; Rec."Primary Key")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
            }
            group("No. Series")
            {
                field("Feasibility Nos."; Rec."Feasibility Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Section Nos"; Rec."Section Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Project  Nos"; Rec."Project  Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Construction Projects Nos"; Rec."Construction Projects Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Maintenance Projects Nos"; Rec."Maintenance Projects Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Surveys_Studies_Designs Nos"; Rec."Surveys_Studies_Designs Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Project Contract Nos"; Rec."Project Contract Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Project Funding Voucher Nos"; Rec."Project Funding Voucher Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Project Funding WorkSheet  Nos"; Rec."Project Funding WorkSheet  Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Road Asset Survey Sheet Nos"; Rec."Road Asset Survey Sheet Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Service Level Selection Nos"; Rec."Service Level Selection Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Daily Work Record Nos"; Rec."Daily Work Record Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Daily Patrol Record Nos"; Rec."Daily Patrol Record Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Incident Condition Nos"; Rec."Incident Condition Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Defect Detection Nos"; Rec."Defect Detection Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Self Inspection Result Nos"; Rec."Self Inspection Result Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Payment Reducion Nos"; Rec."Payment Reducion Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Works Progress Nos"; Rec."Works Progress Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Road Structure Nos"; Rec."Road Structure Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Road Furniture Nos"; Rec."Road Furniture Nos")
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

