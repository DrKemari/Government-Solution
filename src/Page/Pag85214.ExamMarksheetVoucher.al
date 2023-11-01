#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85214 "Exam Marksheet Voucher"
{
    Caption = 'Exam Marksheet Voucher';
    PageType = Card;
    SourceTable = "Marksheet Header";

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
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Examination Sitting ID"; Rec."Examination Sitting ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Examination Sitting ID field.';
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
            part(Control24; "Student Marks Lines")
            {
                SubPageLink = "Document No." = field("Document No."),
                              "Examination Sitting ID" = field("Examination Sitting ID");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control20; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control21; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control22; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control23; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Import Marksheet")
            {
                ApplicationArea = Basic;
                Image = ImportDatabase;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Import Marksheet action.';
                trigger OnAction()
                begin
                    Rec.SetRange("Document No.", Rec."Document No.");
                    WorksheetImport.GetVariables(Rec);
                    WorksheetImport.Run;
                end;
            }
            action("Suggest Students")
            {
                ApplicationArea = Basic;
                Image = SuggestNumber;
                Promoted = true;
                PromotedIsBig = true;
                ToolTip = 'Executes the Suggest Students action.';
                trigger OnAction()
                var
                    TXT001: label 'Are you sure you want to suggest all students?';
                begin
                    if Confirm(TXT001) = true then begin
                        Examination.SuggestStudentsBooked(Rec);
                    end
                end;
            }
            action("Suggest Envelope Serial")
            {
                ApplicationArea = Basic;
                Image = SuggestNumber;
                Promoted = true;
                PromotedIsBig = true;
                Visible = false;
                ToolTip = 'Executes the Suggest Envelope Serial action.';
                trigger OnAction()
                var
                    TXT001: label 'Are you sure you want to suggest all students?';
                begin
                    if Confirm(TXT001) = true then begin
                        Examination.SuggestEnvelopeSerial(Rec);
                    end
                end;
            }
            action("Generate Results")
            {
                ApplicationArea = Basic;
                Image = GetBinContent;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;
                ToolTip = 'Executes the Generate Results action.';
                trigger OnAction()
                var
                    TXT001: label 'Are you sure you want to process the results?';
                begin
                    if Confirm(TXT001) = true then begin
                        Examination.GenerateResults(Rec);
                    end
                end;
            }
            action("Detailed Marksheet")
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                ToolTip = 'Executes the Detailed Marksheet action.';
                trigger OnAction()
                begin
                    Rec.SetRange("Document No.", Rec."Document No.");
                    Report.Run(85013, true, false, Rec)
                end;
            }
            action("Summary Marksheet")
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                ToolTip = 'Executes the Summary Marksheet action.';
                trigger OnAction()
                begin
                    Rec.SetRange("Document No.", Rec."Document No.");
                    Report.Run(85014, true, false, Rec)
                end;
            }
            action("Results Report")
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                Visible = false;
                ToolTip = 'Executes the Results Report action.';
                trigger OnAction()
                var
                    ExaminationResults: Record "Examination Results";
                begin
                    ExaminationResults.Reset;
                    ExaminationResults.SetRange("Examination Sitting ID", Rec."Examination Sitting ID");
                    if ExaminationResults.FindSet then begin
                        Report.Run(85015, true, false, ExaminationResults);
                    end
                end;
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                action("&Approvals")
                {
                    ApplicationArea = Basic;
                    Caption = '&Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the &Approvals action.';
                    trigger OnAction()
                    begin

                        ApprovalEntries.Setfilters(Database::"HR Leave Application", 15, Rec."Document No.");
                        ApprovalEntries.Run;
                    end;
                }
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Send A&pproval Request action.';
                    trigger OnAction()
                    begin
                        Rec.TestField(Description);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';
                    trigger OnAction()
                    begin
                        Rec.TestField("Approval Status", Rec."approval status"::"Pending Approval");
                    end;
                }
                action("Release Examination Results")
                {
                    ApplicationArea = Basic;
                    Image = ReleaseShipment;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = false;
                    ToolTip = 'Executes the Release Examination Results action.';
                    trigger OnAction()
                    var
                        TXT001: label 'Release examination results to students?';
                    begin
                        if Confirm(TXT001) = true then begin
                            Examination.ExaminationSendResults(Rec);
                        end
                    end;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::Marksheet;
    end;

    var
        WorksheetImport: XmlPort "Examination Worksheet Import";
        Examination: Codeunit Examination;
        ApprovalEntries: Page "Approval Entries";
}

#pragma implicitwith restore

