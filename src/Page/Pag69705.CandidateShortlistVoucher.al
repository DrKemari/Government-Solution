#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69705 "Candidate Shortlist Voucher"
{
    Caption = 'Candidate Shortlist Voucher';
    PageType = Card;
    SourceTable = "Candidate Selection Header";
    SourceTableView = where("Document Type" = filter("Candidate Shortlisting"));

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
                field("Vacancy ID"; Rec."Vacancy ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vacancy ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Appointed Selection Comm ID"; Rec."Appointed Selection Comm ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appointed Selection Comm ID field.';
                }
                field("Selection Committee Chair"; Rec."Selection Committee Chair")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Selection Committee Chair field.';
                }
                field("Lead HR Officer"; Rec."Lead HR Officer")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Lead HR Officer field.';
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Document Status field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
                group("Shortlisting Fields")
                {
                    field("Minimum Academic Qualification"; Rec."Minimum Academic Qualification")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Minimum Academic Qualification field.';
                    }
                    field("Min Academic Hierarchy Pointer"; Rec."Min Academic Hierarchy Pointer")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Min Academic Hierarchy Pointer field.';
                    }
                    field("Minimum Work Experience"; Rec."Minimum Work Experience")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Minimum Work Experience field.';
                    }
                    field("Minimum Mngmnt Experience"; Rec."Minimum Mngmnt Experience")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Minimum Management Experience field.';
                    }
                }
                group(Statistics)
                {
                    field("No. of Submitted Applications"; Rec."No. of Submitted Applications")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the No. of Submitted Applications field.';
                    }
                    field("No. of Apptitude Invitees"; Rec."No. of Apptitude Invitees")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the No. of Apptitude Invitees field.';
                    }
                    field("No. of Final Shortlisted Candi"; Rec."No. of Final Shortlisted Candi")
                    {
                        ApplicationArea = Basic;
                        Caption = 'No. of Final Shortlisted Candidates';
                        ToolTip = 'Specifies the value of the No. of Final Shortlisted Candidates field.';
                    }
                    field("Missed Academic Total"; Rec."Missed Academic Total")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Missed Academic Total field.';
                    }
                    field("Missed Management Total"; Rec."Missed Management Total")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Missed Management Total field.';
                    }
                    field("Missed General Total"; Rec."Missed General Total")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Missed General Total field.';
                    }
                }
            }
            part(Control3; "Candidate Shortlist Lines")
            {
                SubPageLink = "Document Type" = field("Document Type"),
                              "Document No" = field("Document No."),
                              "Vacancy ID" = field("Vacancy ID");
                ApplicationArea = Basic;
            }
            group("Vacancy Details")
            {
                field("Position ID"; Rec."Position ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Position ID field.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Title field.';
                }
                field("No. of openings"; Rec."No. of openings")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of openings field.';
                }
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directorate field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field(Region; Rec.Region)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region field.';
                }
                field("Seniority Level"; Rec."Seniority Level")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Seniority Level field.';
                }
                field("Default Terms of Service Code"; Rec."Default Terms of Service Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Terms of Service Code field.';
                }
                field("Employment Type"; Rec."Employment Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employment Type field.';
                }
                field("Application Closing Date"; Rec."Application Closing Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Closing Date field.';
                }
                field("Application Closing Time"; Rec."Application Closing Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Closing Time field.';
                }
                field("Planned Start Date"; Rec."Planned Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned Start Date field.';
                }
                field("Planned end Date"; Rec."Planned end Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned end Date field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control37; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control38; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control39; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control40; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Generate Longlist")
            {
                ApplicationArea = Basic;
                Image = LiFo;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Generate Longlist action.';
                trigger OnAction()
                var
                    TXT001: label 'Are you sure you want to generate the longlist for the vacancy %1?';
                    TXT002: label 'The longlist has been succesfully generated';
                begin
                    if Confirm(TXT001, true, Rec."Job Title") = true then begin
                        Recruitment.FnShortlistBasedOnDefinedParameters2(Rec);
                        Message(TXT002);
                    end;
                end;
            }
            action("Default Shortlisting Score Codes")
            {
                ApplicationArea = Basic;
                Image = DefaultFault;
                Promoted = true;
                PromotedCategory = Category6;
                PromotedIsBig = true;
                RunObject = Page "Shortlisting Score Code";
                RunPageMode = View;
                ToolTip = 'Executes the Default Shortlisting Score Codes action.';
            }
            action("Suggest Shortlisting Criteria")
            {
                ApplicationArea = Basic;
                Image = SuggestCapacity;
                Promoted = true;
                PromotedIsBig = true;
                ToolTip = 'Executes the Suggest Shortlisting Criteria action.';
                trigger OnAction()
                var
                    TXT001: label 'The Requirements have been succesfully suggested';
                    TXT002: label 'Are you sure you want to suggest the shortlisting criteria';
                begin
                    if Confirm(TXT002) = true then begin
                        Recruitment.SuggestShortlistCriteria(Rec);
                        Message(TXT001);
                    end
                end;
            }
            action("Suggest Job Applications")
            {
                ApplicationArea = Basic;
                Image = SuggestCustomerPayments;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;
                ToolTip = 'Executes the Suggest Job Applications action.';
                trigger OnAction()
                var
                    TXT001: label 'Are you sure you want to suggest job applicants';
                begin
                    if Confirm(TXT001) = true then begin
                        Recruitment.FnSuggestapplicants(Rec);
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
                    TXT001: label 'The document has been posted succesfully';
                    TXT002: label 'Are you sure you want to post the shortlisting Voucher';
                begin
                    Rec.TestField(Posted, false);
                    if Confirm(TXT002, true, Rec."Job Title") = true then begin
                        Recruitment.CreateInterviewInvitation(Rec);
                        Message(TXT001);
                    end;
                end;
            }
        }
        area(navigation)
        {
            group(Shortlisting)
            {
                action("Shortlisting Criteria")
                {
                    ApplicationArea = Basic;
                    Caption = 'Shortlisting Criteria';
                    Image = GainLossEntries;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    RunObject = Page "Shortlist Score Guide";
                    RunPageLink = "Document No." = field("Document No.");
                    RunPageMode = Edit;
                    ToolTip = 'Executes the Shortlisting Criteria action.';
                }
                action("Candidate Shortlist Committee")
                {
                    ApplicationArea = Basic;
                    Caption = 'Candidate Shortlist Committee';
                    Image = Components;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    RunObject = Page "Candidate Shortlist Committee";
                    RunPageLink = "Document No." = field("Document No."),
                                  "Appointed Committee ID" = field("Appointed Selection Comm ID");
                    ToolTip = 'Executes the Candidate Shortlist Committee action.';
                }
            }
            group("Long Listing")
            {
                action("Failed Education")
                {
                    ApplicationArea = Basic;
                    Image = FaultDefault;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Failed Academic Applicants";
                    RunPageLink = "Document No." = field("Document No.");
                    ToolTip = 'Executes the Failed Education action.';
                }
                action("Failed Management Experience")
                {
                    ApplicationArea = Basic;
                    Image = MakeAgreement;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Failed Management Yrs Applican";
                    RunPageLink = "Document No." = field("Document No.");
                    ToolTip = 'Executes the Failed Management Experience action.';
                }
                action("Failed Work Experience")
                {
                    ApplicationArea = Basic;
                    Image = EditForecast;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Failed General Exp Applicants";
                    RunPageLink = "Document No." = field("Document No.");
                    ToolTip = 'Executes the Failed Work Experience action.';
                }
                action("All Applications")
                {
                    ApplicationArea = Basic;
                    Image = Accounts;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Job Applications";
                    RunPageLink = "Vacancy Id" = field("Vacancy ID");
                    ToolTip = 'Executes the All Applications action.';
                }
            }
        }
        area(reporting)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    Rec.SetRange("Document No.", Rec."Document No.");
                    Report.Run(69622, true, false, Rec);
                end;
            }
        }
    }

    var
        Recruitment: Codeunit Recruitment;
}

#pragma implicitwith restore

