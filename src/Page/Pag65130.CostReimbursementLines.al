#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 65130 "Cost Reimbursement Lines"
{
    PageType = ListPart;
    SourceTable = "Billable Project Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job No. field.';
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Task No. field.';
                }
                field("Original Line Type"; Rec."Original Line Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Original Line Type field.';
                }
                field("Billing Line Type"; Rec."Billing Line Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Billing Line Type field.';
                }
                field("Original Type"; Rec."Original Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Original Type field.';
                }
                field("Billing Type"; Rec."Billing Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Billing Type field.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Original Description"; Rec."Original Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Original Description field.';
                }
                field("Billing Description"; Rec."Billing Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Billing Description field.';
                }
                field(Qty; Rec.Qty)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qty field.';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Unit Price field.';
                }
                field("Unit Price (LCY)"; Rec."Unit Price (LCY)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Unit Price (LCY) field.';
                }
                field("Billing Price"; Rec."Billing Price")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Billing Price field.';
                }
                field("Billing Price(LCY)"; Rec."Billing Price(LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Billing Price(LCY) field.';
                }
                field("Job Budget Templates"; Rec."Job Budget Templates")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Budget Templates field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Line)
            {
                Caption = 'Line';
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
}

#pragma implicitwith restore

