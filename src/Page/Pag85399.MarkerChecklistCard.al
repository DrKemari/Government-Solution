#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85399 "Marker Checklist Card"
{
    PageType = Document;
    SourceTable = "Scripts Dispatch Header";

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
                field("Marking Start Date"; Rec."Marking Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Marking Start Date field.';
                }
                field("Marking End Date"; Rec."Marking End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Marking End Date field.';
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
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
            }
            part(Control23; "Marking Center Lines")
            {
                SubPageLink = "Document No." = field("Document No.");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control19; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control20; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control21; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control22; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Marking Center Checklist")
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                ToolTip = 'Executes the Marking Center Checklist action.';
                trigger OnAction()
                var
                    ExamBookingEntries: Record "Exam Booking Entries";
                begin
                    Rec.Reset;
                    Rec.SetRange("Document No.", Rec."Document No.");
                    Report.Run(85205, true, true, Rec);
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Post action.';
                trigger OnAction()
                var
                    TXT002: label 'Do you want to Submit the Details ?';
                begin
                    if Confirm(TXT002) = true then begin
                        Rec.Posted := true;
                        Rec."Posted By" := UserId;
                        Rec."Posted On" := CreateDatetime(Today, Time);
                        Rec.Modify(true);
                        Message('Submitted Successfully');
                    end
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Marking Center Checklist";
    end;

    var
        ExamBookingEntries: Record "Exam Booking Entries";
        Exam: Codeunit Examination;
}

#pragma implicitwith restore

