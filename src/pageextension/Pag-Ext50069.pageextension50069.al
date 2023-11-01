#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50069 "pageextension50069" extends "Job Task Lines Subform" 
{
    layout
    {
        modify(Description)
        {
            Caption = 'Description';
        }
        addafter(Description)
        {
            field("Start Point(Km)"; Rec."Start Point(Km)")
            {
                ApplicationArea = Basic;
                Visible = false;
            }
            field("End Point(Km)"; Rec."End Point(Km)")
            {
                ApplicationArea = Basic;
                Visible = false;
            }
        }
        addafter(Totaling)
        {
            field("Surface Types"; Rec."Surface Types")
            {
                ApplicationArea = Basic;
                Visible = false;
            }
            field("Road Condition"; Rec."Road Condition")
            {
                ApplicationArea = Basic;
                Visible = false;
            }
            field("Funding Source"; Rec."Funding Source")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("End Date")
        {
            field("Procurement Method"; Rec."Procurement Method")
            {
                ApplicationArea = Basic;
                Visible = false;
            }
        }
        addafter("Amt. Rcd. Not Invoiced")
        {
            field("Department Code"; Rec."Department Code")
            {
                ApplicationArea = Basic;
            }
            field("Directorate Code"; Rec."Directorate Code")
            {
                ApplicationArea = Basic;
            }
            field(Division; Rec.Division)
            {
                ApplicationArea = Basic;
            }
            field(Commitments; Rec.Commitments)
            {
                ApplicationArea = Basic;
            }
            field("Completed Length(Km)"; Rec."Completed Length(Km)")
            {
                ApplicationArea = Basic;
            }
        }
    }
    actions
    {
        addafter("F&unctions")
        {
            group(Milestones)
            {
                Image = Setup;
                action(MilestoneLines)
                {
                    ApplicationArea = Jobs;
                    Caption = 'Milestone & Lines';
                    Image = JobLines;
                    Scope = Repeater;
                    ShortCutKey = 'Shift+Ctrl+P';
                    ToolTip = 'View all planning lines for the job. You use this window to plan what items, resources, and general ledger expenses that you expect to use on a job (budget) or you can specify what you actually agreed with your customer that he should pay for the job (billable).';

                    trigger OnAction()
                    var
                        MilestoneLine: Record "Milestones Lines";
                        MilestoneLines: Page "Milestones Lines";
                    begin
                        Rec.TestField("Job No.");
                          MilestoneLine.FilterGroup(2);
                          MilestoneLine.SetRange("Project No", Rec."Job No.");
                          MilestoneLine.SetRange("Task No", Rec."Job Task No.");
                          MilestoneLine.FilterGroup(0);
                          MilestoneLines.SetTableview(MilestoneLine);
                          MilestoneLines.Editable := true;
                         MilestoneLines.Run;
                    end;
                }
            }
        }
    }
}

#pragma implicitwith restore

