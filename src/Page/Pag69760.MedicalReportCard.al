#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69760 "Medical Report Card"
{
    PageType = Card;
    SourceTable = "PreHire Medical Report";

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = Editable;
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Background Checks Inv No."; Rec."Background Checks Inv No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Background Checks Inv No. field.';
                }
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Medical Checks Template"; Rec."Medical Checks Template")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Medical Checks Template field.';
                }
                field("Vacancy ID"; Rec."Vacancy ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vacancy ID field.';
                }
                field("Lead HR Officer"; Rec."Lead HR Officer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Lead HR Officer field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Candidate No."; Rec."Candidate No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Candidate No. field.';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Middle Name field.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Name field.';
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document Status field.';
                }
            }
            part(Control23; "Medical Lines")
            {
                Editable = Editable;
                SubPageLink = "Document No." = field("Document No.");
                ApplicationArea = Basic;
            }
            group("Results/Outcome")
            {
                Caption = 'Results/Outcome';
                field("Overall Medical Fitness"; Rec."Overall Medical Fitness")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Overall Medical Fitness field.';
                }
                field("Doctor Name"; Rec."Doctor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Doctor Name field.';
                }
                field(Institution; Rec.Institution)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution field.';
                }
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
            action("Suggest Questions")
            {
                ApplicationArea = Basic;
                Image = SuggestLines;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Suggest Questions action.';
                trigger OnAction()
                var
                    TXT001: label 'Suggest the questions based on the template';
                begin
                    Rec.TestField("Document Status", Rec."document status"::Open);
                    if Confirm(TXT001) = true then begin
                        Recruitment.SuggestMedicalQuestions(Rec);
                    end
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Post action.';
                trigger OnAction()
                var
                    TXT001: label 'Post the overall medical report?';
                begin
                    Rec.TestField("Document Status", Rec."document status"::Open);
                    if Confirm(TXT001) = true then begin
                        Rec.TestField("Overall Medical Fitness");
                        JobApplications.Reset;
                        JobApplications.SetRange("Application No.", Rec."Application No.");
                        if JobApplications.FindFirst then begin
                            if Rec."Overall Medical Fitness" = Rec."overall medical fitness"::"FIT FOR DUTY" then begin
                                JobApplications."Medical Checks Pass" := true;
                                JobApplications.Modify(true);
                            end else begin
                                JobApplications."Medical Checks Pass" := false;
                                JobApplications.Modify(true);
                            end;
                        end;
                        Rec."Document Status" := Rec."document status"::Closed;
                        Rec.Modify(true);
                    end
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    Rec.SetRange("Document No.", Rec."Document No.");
                    Report.Run(69627, true, false, Rec);
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        Editable := true;
        if Rec."Document Status" = Rec."document status"::Closed then
            Editable := false;
    end;

    var
        Recruitment: Codeunit Recruitment;
        JobApplications: Record "Job Applications";
        Editable: Boolean;
}

#pragma implicitwith restore

