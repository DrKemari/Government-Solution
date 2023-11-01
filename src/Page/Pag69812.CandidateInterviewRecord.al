#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69812 "Candidate Interview Record"
{
    PageType = Card;
    SourceTable = "Candidate Interview Record";

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
                field("Interview Invitation No."; Rec."Interview Invitation No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interview Invitation No. field.';
                }
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application No. field.';
                }
                field("Interview Scoresheet Template"; Rec."Interview Scoresheet Template")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Interview Scoresheet Template field.';
                }
                field("Vacancy ID"; Rec."Vacancy ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vacancy ID field.';
                }
                field("Candidate Shortlist Vouch No."; Rec."Candidate Shortlist Vouch No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Candidate Shortlist Vouch No. field.';
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
                field("Interview Date"; Rec."Interview Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interview Date field.';
                }
                field("Interview Start Time"; Rec."Interview Start Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interview Start Time field.';
                }
                field("Interview End Time"; Rec."Interview End Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interview End Time field.';
                }
                field("Interview Venue"; Rec."Interview Venue")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interview Venue field.';
                }
                field("Room No."; Rec."Room No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Room No. field.';
                }
                field("Assigned Panel ID"; Rec."Assigned Panel ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assigned Panel ID field.';
                }
                field("Panel Member No."; Rec."Panel Member No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Panel Member No. field.';
                }
                field(Member; Rec.Member)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Member field.';
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Status field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
            }
            part(Control32; "Interview Questions")
            {
                SubPageLink = "Document No." = field("Document No."),
                              "Interview Scoresheet Template" = field("Interview Scoresheet Template");
                ApplicationArea = Basic;
            }
            group("Interview Outcome/Results")
            {
                Caption = 'Interview Outcome/Results';
                field("Panel Interview Outcome"; Rec."Panel Interview Outcome")
                {
                    ApplicationArea = Basic;
                    NotBlank = true;
                    ToolTip = 'Specifies the value of the Panel Interview Outcome field.';
                }
                field("Panel Interview Score %"; Rec."Panel Interview Score %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Panel Interview Score % field.';
                }
                field("Panelist Interview Remarks"; Rec."Panelist Interview Remarks")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Panelist Interview Remarks field.';
                }
                field("Unsuccesful App Reason Code"; Rec."Unsuccesful App Reason Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unsuccesful App Reason Code field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control28; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control29; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control30; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control31; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Evaluation Sections")
            {
                ApplicationArea = Basic;
                Image = SelectEntries;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Question Categories";
                RunPageLink = "Document No." = field("Document No.");
                ToolTip = 'Executes the Evaluation Sections action.';
            }
            action("Panelist Evaluation Report")
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                ToolTip = 'Executes the Panelist Evaluation Report action.';
                trigger OnAction()
                begin
                    Rec.SetRange("Document No.", Rec."Document No.");
                    Report.Run(69625, true, false, Rec);
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
                    TXT001: label 'Are you sure you want to complete the evaluation?';
                begin
                    if Confirm(TXT001) = true then begin
                        Rec.Posted := true;
                        Rec."Posted By" := UserId;
                        Rec."Posted On" := CurrentDatetime;
                        Rec.Modify(true);
                    end
                end;
            }
        }
    }
}

#pragma implicitwith restore

