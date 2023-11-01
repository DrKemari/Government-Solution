#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80383 "Approved Diary Logs"
{
    ApplicationArea = Basic;
    CardPageID = "Performance Logs Card";
    Editable = false;
    PageType = List;
    SourceTable = "Performance Diary Log";
    SourceTableView = where(Posted = const(false),
                            "Approval Status" = const(Released));
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No. field.';
                }
                field("Incidence Date"; Rec."Incidence Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Incidence Date field.';
                }
                field("Performance Entry Type"; Rec."Performance Entry Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Performance Entry Type field.';
                }
                field("Diary Source"; Rec."Diary Source")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Diary Source field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Personal Scorecard ID"; Rec."Personal Scorecard ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Personal Scorecard ID field.';
                }
                field("Goal ID"; Rec."Goal ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Goal ID field.';
                }
                field("Objective ID"; Rec."Objective ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Objective ID field.';
                }
                field("Disciplinary Case ID"; Rec."Disciplinary Case ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disciplinary Case ID field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

