#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80419 "Sub Workplan Activity"
{
    Caption = 'Sub Workplan Activities';
    PageType = List;
    SourceTable = "Sub Workplan Activity";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Sub-Indicator"; Rec."Sub Initiative No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Sub-Initiative"; Rec."Objective/Initiative")
                {
                    ApplicationArea = Basic;
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field(Target; Rec."Imported Annual Target Qty")
                {
                    ApplicationArea = Basic;
                    Caption = 'Target';
                }
                field("Total Budget"; Rec."Total Budget")
                {
                    ApplicationArea = Basic;
                }
                field("Completion Date"; Rec."Due Date")
                {
                    ApplicationArea = Basic;
                }
                field(Weight; Rec.Weight)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Line Functions ")
            {
                Caption = 'Annual Workplan Sub-Activities';
                Image = AnalysisView;
            }
        }
    }
}

#pragma implicitwith restore

