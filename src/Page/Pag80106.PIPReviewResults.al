#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80106 "PIP Review Results"
{
    PageType = List;
    SourceTable = "PIP Review Result";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("PIP Review ID"; Rec."PIP Review ID")
                {
                    ApplicationArea = Basic;
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                }
                field("PIP ID"; Rec."PIP ID")
                {
                    ApplicationArea = Basic;
                }
                field("PIP Objective  ID"; Rec."PIP Objective  ID")
                {
                    ApplicationArea = Basic;
                }
                field("Performance Deficiency ID"; Rec."Performance Deficiency ID")
                {
                    ApplicationArea = Basic;
                }
                field("Expectation to be met"; Rec."Expectation to be met")
                {
                    ApplicationArea = Basic;
                }
                field("Performance Notes"; Rec."Performance Notes")
                {
                    ApplicationArea = Basic;
                }
                field("Actual Date"; Rec."Actual Date")
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
                field("Desired Perfomance Direction"; Rec."Desired Perfomance Direction")
                {
                    ApplicationArea = Basic;
                }
                field("Target Qty"; Rec."Target Qty")
                {
                    ApplicationArea = Basic;
                }
                field("Achievement Qty"; Rec."Achievement Qty")
                {
                    ApplicationArea = Basic;
                }
                field("Final Performance Rating"; Rec."Final Performance Rating")
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

