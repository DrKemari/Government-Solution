#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80119 "Proficiency Evalulation-AS"
{
    PageType = ListPart;
    SourceTable = "Proficiency Evaluation Result";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Performance Evaluation ID"; Rec."Performance Evaluation ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Competency Template ID"; Rec."Competency Template ID")
                {
                    ApplicationArea = Basic;
                }
                field("Competency Code"; Rec."Competency Code")
                {
                    ApplicationArea = Basic;
                }
                field("Competency Description"; Rec."Competency Description")
                {
                    ApplicationArea = Basic;
                }
                field("Competency Category"; Rec."Competency Category")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Outcome Perfomance Indicator"; Rec."Outcome Perfomance Indicator")
                {
                    ApplicationArea = Basic;
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                }
                field("Desired Proficiency Direction"; Rec."Desired Proficiency Direction")
                {
                    ApplicationArea = Basic;
                }
                field("Profiency Rating Scale"; Rec."Profiency Rating Scale")
                {
                    ApplicationArea = Basic;
                }
                field("Scale Type"; Rec."Scale Type")
                {
                    ApplicationArea = Basic;
                }
                field("Target Qty"; Rec."Target Qty")
                {
                    ApplicationArea = Basic;
                }
                field("Self-Review Qty"; Rec."Self-Review Qty")
                {
                    ApplicationArea = Basic;
                }
                field("AppraiserReview Qty"; Rec."AppraiserReview Qty")
                {
                    ApplicationArea = Basic;
                }
                field("Final/Actual Qty"; Rec."Final/Actual Qty")
                {
                    ApplicationArea = Basic;
                }
                field("Raw Profiency Score"; Rec."Raw Profiency Score")
                {
                    ApplicationArea = Basic;
                }
                field("Weight %"; Rec."Weight %")
                {
                    ApplicationArea = Basic;
                }
                field("Final Weighted Line Score"; Rec."Final Weighted Line Score")
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

