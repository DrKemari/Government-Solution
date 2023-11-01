#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 56010 "CRM Vacancy"
{
    ApplicationArea = Basic;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "CRM Vacancies";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Vacancy No"; Rec."Vacancy No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vacancy No field.';
                }
                field("No of Openings"; Rec."No of Openings")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No of Openings field.';
                }
                field(Position; Rec.Position)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Position field.';
                }
                field(Employer; Rec.Employer)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employer field.';
                }
                field(Region; Rec.Region)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region field.';
                }
                field("Estimate Annual Salary"; Rec."Estimate Annual Salary")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Estimate Annual Salary field.';
                }
                field("Job Grade ID"; Rec."Job Grade ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Grade ID field.';
                }
                field("Seniority Level"; Rec."Seniority Level")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Seniority Level field.';
                }
                field("Employment Type"; Rec."Employment Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employment Type field.';
                }
                field("Application End Date"; Rec."Application End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application End Date field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
                field(Published; Rec.Published)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Published field.';
                }
                field("Published By"; Rec."Published By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Published By field.';
                }
                field("Published On"; Rec."Published On")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Published On field.';
                }
            }
            part(Control16; "CRM Vacancy Responsibilities")
            {
                SubPageLink = "Vacancy ID" = field("Vacancy No");
                ApplicationArea = Basic;
            }
            part(Control17; "CRM Vacancy Requirements")
            {
                SubPageLink = "Vacancy ID" = field("Vacancy No");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control12; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control13; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control14; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control15; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Publish)
            {
                ApplicationArea = Basic;
                Image = PostMail;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Publish action.';
                trigger OnAction()
                begin
                    Rec.TestField("Application End Date");
                    Rec.Published := true;
                    Rec."Published By" := UserId;
                    Rec."Published On" := Today;
                    Rec.Modify(true);
                end;
            }
            action("Job Applicants")
            {
                ApplicationArea = Basic;
                Image = AllLines;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Vacancy Applicants";
                RunPageLink = "Document ID" = field("Vacancy No");
                ToolTip = 'Executes the Job Applicants action.';
            }
            action(Close)
            {
                ApplicationArea = Basic;
                Image = Close;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Close action.';
                trigger OnAction()
                begin
                    Rec.Published := false;
                    Rec.Modify(true);
                end;
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Send A&pproval Request action.';
                    trigger OnAction()
                    var
                    // //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        Message('Approval sent');
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = true;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';
                    trigger OnAction()
                    var
                    ////ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        Message('Approval cancelled');
                    end;
                }
            }
        }
    }
}

#pragma implicitwith restore

