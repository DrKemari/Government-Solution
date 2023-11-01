#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85002 "Examination Sitting Cycle"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Exam Sitting Cycle";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Exam Sitting Cycle"; Rec."Exam Sitting Cycle")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Exam Sitting Cycle field.';
                }
                field("Examination Project ID"; Rec."Examination Project ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Examination Project ID field.';
                }
                field("Project Description"; Rec."Project Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Description field.';
                }
                field("Exam Start Date"; Rec."Exam Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Exam Start Date field.';
                }
                field("Exam End Date"; Rec."Exam End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Exam End Date field.';
                }
                field(Closed; Rec.Closed)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Closed field.';
                }
                field("Sitting Status"; Rec."Sitting Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sitting Status field.';
                }
                field("Sitting Sequence"; Rec."Sitting Sequence")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sitting Sequence field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("&Create Year")
            {
                ApplicationArea = Basic, Suite;
                Caption = '&Create Year';
                Ellipsis = true;
                Image = CreateYear;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Report "Create Fiscal Year";
                ToolTip = 'Open a new fiscal year and define its accounting periods so you can start posting documents.';
            }
            action("C&lose Cycle")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'C&lose Cycle';
                Image = CloseYear;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Codeunit "Fiscal Year-Close";
                ToolTip = 'Close the current examination cycle. A confirmation message will display that tells you which year will be closed. You cannot reopen the cycle after it has been closed.';
            }
        }
    }
}

#pragma implicitwith restore

