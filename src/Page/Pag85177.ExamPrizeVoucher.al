#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 85177 "Exam Prize Voucher"
{
    Caption = 'Exam Prize Voucher';
    PageType = Card;
    SourceTable = "Marksheet Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(DocumentNo;Rec."Document No.")
                {
                    ApplicationArea = Basic;
                }
                field(DocumentDate;Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field(Description;Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(ExaminationProjectID;Rec."Examination Project ID")
                {
                    ApplicationArea = Basic;
                }
                field(ExaminationSittingID;Rec."Examination Sitting ID")
                {
                    ApplicationArea = Basic;
                }
                field(ExaminationStartDate;Rec."Examination Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(ExaminationEndDate;Rec."Examination End Date")
                {
                    ApplicationArea = Basic;
                }
                field(FinancialYearCode;Rec."Financial Year Code")
                {
                    ApplicationArea = Basic;
                }
                field(CorporateStrategicPlanID;Rec."Corporate Strategic Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field(FinancialBudgetID;Rec."Financial Budget ID")
                {
                    ApplicationArea = Basic;
                }
                field(ApprovalStatus;Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field(CreatedBy;Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field(CreatedOn;Rec."Created On")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control24;"Prize Details")
            {
                SubPageLink = "Document No."=field("Document No.");
            }
        }
        area(factboxes)
        {
            systempart(Control20;Outlook)
            {
            }
            systempart(Control21;Notes)
            {
            }
            systempart(Control22;MyNotes)
            {
            }
            systempart(Control23;Links)
            {
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Suggest Top Student Per Paper")
            {
                ApplicationArea = Basic;
                Image = SuggestNumber;
                Promoted = true;
                PromotedIsBig = true;
                Visible = true;

                trigger OnAction()
                var
                    TXT001: label 'Are you sure you want to suggest all students?';
                begin
                    if Confirm(TXT001)=true then begin
                      Examination.SuggestHighestScorers(Rec);
                    end
                end;
            }
            action("Top Student Per Level")
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    TXT001: label 'Are you sure you want to suggest all students?';
                begin
                    ExaminationResults.Reset;
                    ExaminationResults.SetRange("Examination Sitting ID",Rec."Examination Sitting ID");
                    if ExaminationResults.FindSet then begin
                    Report.Run(85220,true,true,ExaminationResults);
                        end;
                end;
            }
            action("Top 2 Students")
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    TXT001: label 'Are you sure you want to suggest all students?';
                begin
                    ExaminationResults.Reset;
                    ExaminationResults.SetRange("Examination Sitting ID",Rec."Examination Sitting ID");
                    if ExaminationResults.FindSet then begin
                    Report.Run(85218,true,true,ExaminationResults);
                        end;
                end;
            }
            action("Top 10 Students")
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    TXT001: label 'Are you sure you want to suggest all students?';
                begin
                    ExaminationResults.Reset;
                    ExaminationResults.SetRange("Examination Sitting ID",Rec."Examination Sitting ID");
                    if ExaminationResults.FindSet then begin
                    Report.Run(85217,true,true,ExaminationResults);
                      end;
                end;
            }
            action("Top Student Per Paper")
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    TXT001: label 'Are you sure you want to suggest all students?';
                begin
                    ExaminationResults.Reset;
                    ExaminationResults.SetRange("Examination Sitting ID",Rec."Examination Sitting ID");
                    if ExaminationResults.FindSet then begin
                    Report.Run(85219,true,true,ExaminationResults);
                        end;
                end;
            }
            action("Print Voucher")
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    TXT001: label 'Are you sure you want to suggest all students?';
                begin
                    Rec.Reset;
                    Rec.SetRange(Rec."Document No.",Rec."Document No.");
                    Report.Run(85216,true,true,Rec);
                end;
            }
            action("Sponsorship Details")
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    TXT001: label 'Are you sure you want to suggest all students?';
                begin
                    Rec.Reset;
                    Rec.SetRange(Rec."Document No.",Rec."Document No.");
                    Report.Run(85230,true,true,Rec);
                end;
            }
            group(Functions)
            {
                Caption = 'F&unctions';
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = '&Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin

                        ApprovalEntries.Setfilters(Database::"HR Leave Application",15,Rec."Document No.");
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

                    trigger OnAction()
                    begin
                        Rec.TestField(Rec.Description);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;

                    trigger OnAction()
                    begin
                        Rec.TestField(Rec."Approval Status",Rec."approval status"::"Pending Approval");
                    end;
                }
            }
            action("Post Results")
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;

                trigger OnAction()
                var
                    TXT001: label 'Post the Prize voucher %1';
                begin
                    if Confirm(TXT001,true,Rec."Document No.")=true then begin

                    Rec.Posted:=true;
                    Rec."Posted By":=UserId;
                    Rec."Posted On":=CurrentDatetime;
                    Rec.Modify(true);
                    end
                end;
            }
            action("Notify Students")
            {
                ApplicationArea = Basic;
                Image = Email;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    TXT001: label 'Notify Winning Students?';
                begin
                    if Confirm(TXT001,true,Rec."Document No.")=true then begin
                  //    Examination.FnNotifyStudents(Rec);
                    end
                end;
            }
            action("Notify Donors")
            {
                ApplicationArea = Basic;
                Image = Email;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    TXT001: label 'Notify the Donors?';
                begin
                    if Confirm(TXT001,true,Rec."Document No.")=true then begin
                     // Examination.FnNotifyDonors(Rec);
                    end
                end;
            }
            action("Import Marksheet")
            {
                ApplicationArea = Basic;
                Image = ImportDatabase;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.SetRange(Rec."Document No.",Rec."Document No.");
                    WorksheetImport.GetVariables(Rec);
                    WorksheetImport.Run;
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type":=Rec."document type"::"Prize Award";
    end;

    var
        WorksheetImport: XmlPort "Examination Worksheet Import";
        Examination: Codeunit Examination;
        ApprovalEntries: Page "Approval Entries";
        ExaminationResults: Record "Examination Results";
}
