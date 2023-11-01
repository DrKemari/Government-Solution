#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85166 "Center Material Voucher"
{
    PageType = Card;
    SourceTable = "Center  Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Project No."; Rec."Project No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project No. field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field("Sitting Cycle"; Rec."Sitting Cycle")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sitting Cycle field.';
                }
                field("Examination Start Date"; Rec."Examination Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Examination Start Date field.';
                }
                field("Examination End Date"; Rec."Examination End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Examination End Date field.';
                }
                field("Center Code"; Rec."Center Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Center Code field.';
                }
                field("Center Name"; Rec."Center Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Center Name field.';
                }
                field("Total Candidature"; Rec."Total Candidature")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Candidature field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Status field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
            }
            part(Control26; "Center Marking Materials Lines")
            {
                SubPageLink = "Document No." = field("Document No.");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control22; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control23; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control24; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control25; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Dispatch Details")
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                ToolTip = 'Executes the Dispatch Details action.';
                trigger OnAction()
                begin
                    Report.Run(85017, true, false, Rec);
                end;
            }
            action("Booking Summary")
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                ToolTip = 'Executes the Booking Summary action.';
                trigger OnAction()
                begin
                    ExamBookingEntries.Reset;
                    ExamBookingEntries.SetRange("Exam Center", Rec."Center Code");
                    if ExamBookingEntries.FindSet then begin
                        Report.Run(85018, true, false, ExamBookingEntries);
                    end else
                        Error('No students booked for this center');
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Marking Material";
    end;

    var
        ExamBookingEntries: Record "Exam Booking Entries";
}

#pragma implicitwith restore

