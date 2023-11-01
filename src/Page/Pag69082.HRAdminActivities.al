#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69082 "HR Admin Activities"
{
    Caption = 'Activities';
    PageType = CardPart;
    SourceTable = "Job Cue";

    layout
    {
        area(content)
        {
            cuegroup("Active Employees By Category")
            {
                Caption = 'Active Employees By Category';
                field("Active Employees"; Rec."Active Employees")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Active Employees field.';
                }
                field("Inactive Employees"; Rec."Inactive Employees")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inactive Employees field.';
                }
                field("Terminated Employees"; Rec."Terminated Employees")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Terminated Employees field.';
                }

                actions
                {
                    action("New Employee")
                    {
                        ApplicationArea = Basic;
                        Caption = 'New Employee';
                        RunObject = Page "Closed Welfare Benefits";
                        RunPageMode = Create;
                        ToolTip = 'Executes the New Employee action.';
                    }
                }
            }
            cuegroup("Employee Leave Applications")
            {
                Caption = 'Employee Leave Applications';
                field("Posted Approved Leave"; Rec."Posted Approved Leave")
                {
                    ApplicationArea = Basic;
                    DrillDownPageID = "Documents E-mailed Log1";
                    ToolTip = 'Specifies the value of the Posted Approved Leave field.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        Rec.Reset;
        if not Rec.Get then begin
            Rec.Init;
            Rec.Insert;
        end;

        Rec.SetFilter("Date Filter", '>=%1', WorkDate);
    end;
}

#pragma implicitwith restore

