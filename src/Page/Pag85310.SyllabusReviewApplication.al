#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85310 "Syllabus Review Application"
{
    PageType = Card;
    SourceTable = "Syllabus Review";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = Basic;
                }
                field("Plan No."; Rec."Plan No.")
                {
                    ApplicationArea = Basic;
                }
                field("Plan Item"; Rec."Plan Item")
                {
                    ApplicationArea = Basic;
                }
                field("Syllabus No."; Rec."Syllabus No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Syllabus Name"; Rec."Syllabus Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Syllabus Type Name"; Rec."Syllabus Type Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field("Date of Last Review"; Rec."Date of Last Review")
                {
                    ApplicationArea = Basic;
                }
                field("Domain Code"; Rec."Domain Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Domain Name"; Rec."Domain Name")
                {
                    ApplicationArea = Basic;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Person Responsible"; Rec."Person Responsible")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control18; "Stakeholders Comments")
            {
                SubPageLink = "Application No." = field("Application No.");
                Visible = false;
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control14; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control15; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control16; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control17; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        Message('');
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = true;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category9;

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        Message('');
                    end;
                }
            }
            group(Functions)
            {
                action("Initiate Review & Copy Syllabus")
                {
                    ApplicationArea = Basic;
                    Image = InsertBalanceAccount;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Creates a project in relation to the type of review and creates a draft sylabus copying from the syllabus register guided by the syllabus no.';

                    trigger OnAction()
                    var
                        TXT001: label 'Create a project for this review?';
                    begin
                        Rec.TestField("Approval Status", Rec."approval status"::Released);
                        if Confirm(TXT001) = true then begin
                            Examination.CreateSyllabusJob(Rec);
                            //create a draft syllabus from the existing one
                            Examination.CreateSyllabusDraft(Rec);
                        end
                    end;
                }
                action("Source Types")
                {
                    ApplicationArea = Basic;
                    Image = SourceDocLine;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Application Source Types";
                    RunPageLink = "Application No." = field("Application No.");
                    ToolTip = 'Sources to be used to collect views from the stakeholders';
                }
            }
        }
        area(navigation)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                ToolTip = 'Print-out,Preview of the application with approvers';

                trigger OnAction()
                begin
                    Rec.SetRange("Application No.", Rec."Application No.");
                    Report.Run(85305, true, false, Rec);
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.New := false;
    end;

    var
        Examination: Codeunit Examination;
}

#pragma implicitwith restore

