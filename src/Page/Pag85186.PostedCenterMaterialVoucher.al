#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85186 "Posted Center Material Voucher"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
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
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Project No."; Rec."Project No.")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Sitting Cycle"; Rec."Sitting Cycle")
                {
                    ApplicationArea = Basic;
                }
                field("Examination Start Date"; Rec."Examination Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Examination End Date"; Rec."Examination End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Center Code"; Rec."Center Code")
                {
                    ApplicationArea = Basic;
                }
                field("Center Name"; Rec."Center Name")
                {
                    ApplicationArea = Basic;
                }
                field("Total Candidature"; Rec."Total Candidature")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
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
        area(processing)
        {
            action("Dispatch Details")
            {
                ApplicationArea = Basic;

                trigger OnAction()
                begin
                    Report.Run(85017, true, false, Rec);
                end;
            }
            action("Booking Summary")
            {
                ApplicationArea = Basic;

                trigger OnAction()
                begin
                    ExamBookingEntries.Reset;
                    ExamBookingEntries.SetRange("Exam Center", Rec."Center Code");
                    if ExamBookingEntries.FindSet then begin
                        Report.Run(85018, true, false, ExamBookingEntries);
                    end
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

