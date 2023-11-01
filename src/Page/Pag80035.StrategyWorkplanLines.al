#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80035 "Strategy Workplan Lines"
{
    PageType = ListPart;
    SourceTable = "Strategy Workplan Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Strategy Plan ID"; Rec."Strategy Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Activity ID"; Rec."Activity ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Perfomance Indicator"; Rec."Perfomance Indicator")
                {
                    ApplicationArea = Basic;
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                    TableRelation = "Unit of Measure";
                }
                field("Desired Perfomance Direction"; Rec."Desired Perfomance Direction")
                {
                    ApplicationArea = Basic;
                }
                field("Imported Annual Target Qty"; Rec."Imported Annual Target Qty")
                {
                    ApplicationArea = Basic;
                }
                field("Imported Annual Budget Est."; Rec."Imported Annual Budget Est.")
                {
                    ApplicationArea = Basic;
                }
                field("Source Of Fund"; Rec."Source Of Fund")
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
                    Visible = true;
                }
                field(Weight; Rec.Weight)
                {
                    ApplicationArea = Basic;
                    Caption = 'Weight%';
                }
                field("Q1 Target"; Rec."Q1 Target")
                {
                    ApplicationArea = Basic;
                }
                field("Q1 Budget"; Rec."Q1 Budget")
                {
                    ApplicationArea = Basic;
                }
                field("Q2 Target"; Rec."Q2 Target")
                {
                    ApplicationArea = Basic;
                }
                field("Q2 Budget"; Rec."Q2 Budget")
                {
                    ApplicationArea = Basic;
                }
                field("Q3 Target"; Rec."Q3 Target")
                {
                    ApplicationArea = Basic;
                }
                field("Q3 Budget"; Rec."Q3 Budget")
                {
                    ApplicationArea = Basic;
                }
                field("Q4 Target"; Rec."Q4 Target")
                {
                    ApplicationArea = Basic;
                }
                field("Q4 Budget"; Rec."Q4 Budget")
                {
                    ApplicationArea = Basic;
                }
                field("Entry Type"; Rec."Entry Type")
                {
                    ApplicationArea = Basic;
                }
                field("Total Achieved Target"; Rec."Total Achieved Target")
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
                action("Sub-Activities ")
                {
                    ApplicationArea = Basic;
                    Image = Notes;
                    RunObject = Page "Sub Workplan Activity";
                    RunPageLink = "Workplan No."=field(No),
                                  "Activity Id"=field("Activity ID");
                }
            }
        }
    }
}

#pragma implicitwith restore

