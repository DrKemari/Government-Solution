#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80043 "Performance Plan Tasks"
{
    CardPageID = "Performance Plan Task";
    PageType = ListPart;
    SourceTable = "Performance Plan Task";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Performance Mgt Plan ID"; Rec."Performance Mgt Plan ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Task Code"; Rec."Task Code")
                {
                    ApplicationArea = Basic;
                }
                field("Task Category"; Rec."Task Category")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Review Periods"; Rec."Review Periods")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        if ReviewPeriod.Get(Rec."Review Periods") then begin
                            Rec."Performance Cycle Start Date" := ReviewPeriod."Starting Date";
                            Rec."Performance Cycle End Date" := ReviewPeriod."End Date";
                            Rec."Processing Start Date" := ReviewPeriod."Starting Date";
                            Rec."Processing Due Date" := ReviewPeriod."End Date";
                          end;
                    end;
                }
                field("Performance Cycle Start Date"; Rec."Performance Cycle Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Performance Cycle End Date"; Rec."Performance Cycle End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Processing Start Date"; Rec."Processing Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Processing Due Date"; Rec."Processing Due Date")
                {
                    ApplicationArea = Basic;
                }
                field("Published?"; Rec."Published?")
                {
                    ApplicationArea = Basic;
                }
                field("Closed?"; Rec."Closed?")
                {
                    ApplicationArea = Basic;
                }
                field("Published By"; Rec."Published By")
                {
                    ApplicationArea = Basic;
                }
                field("Closed By"; Rec."Closed By")
                {
                    ApplicationArea = Basic;
                }
                field("No of Evaluations/Appeals"; Rec."No of Evaluations/Appeals")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Line Functions")
            {
                action("Publish Task")
                {
                    ApplicationArea = Basic;

                    trigger OnAction()
                    begin
                        Rec."Published?" := true;
                        Rec."Published By" := UserId;
                        Message('Task Published Successfully');
                    end;
                }
                action("Generate Appraisals")
                {
                    ApplicationArea = Basic;
                    Image = CreateDocument;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        if Rec."Task Category" = Rec."task category"::"Performance Review" then begin
                          PerformanceManagementPlan.Reset;
                          PerformanceManagementPlan.SetRange(No, Rec."Performance Mgt Plan ID");
                          if PerformanceManagementPlan.FindFirst then begin
                           // StrategicPlanning.CreateLPOFromLines(Rec,PerformanceManagementPlan."Strategy Plan ID");
                          end;
                        end;
                    end;
                }
                action("Close Task")
                {
                    ApplicationArea = Basic;

                    trigger OnAction()
                    begin
                        Rec.TestField("Published?",true);
                        Rec."Closed?" := true;
                        Rec."Closed By" := UserId;
                        Message('Task Closed Successfully');
                    end;
                }
            }
        }
    }

    var
        ReviewPeriod: Record "Review Periods";
        StrategicPlanning: Codeunit KasnebFunctions;
        PerformanceManagementPlan: Record "Performance Management Plan";
}

#pragma implicitwith restore

