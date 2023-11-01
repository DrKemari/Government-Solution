#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85329 "Exam Comm Approval Application"
{
    Caption = 'Exam Committee Approval Application';
    InsertAllowed = false;
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
                    ToolTip = 'Specifies the value of the Application No. field.';
                }
                field("Syllabus Type Name"; Rec."Syllabus Type Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Syllabus Type Name field.';
                }
                field("Syllabus No."; Rec."Syllabus No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Syllabus No. field.';
                }
                field("Syllabus Name"; Rec."Syllabus Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Syllabus Name field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Date of Last Review"; Rec."Date of Last Review")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Last Review field.';
                }
                field("Domain Name"; Rec."Domain Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Domain Name field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field("Responsible Person"; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Termination Reason"; Rec."Termination Reason")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Termination Reason field.';
                }
                field("Board Verdict"; Rec."Board Verdict")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Board Verdict field.';
                }
                field("Ordinal Number"; Rec."Ordinal Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ordinal Number field.';
                }
                field("Verdict Date"; Rec."Verdict Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Verdict Date field.';
                }
                field("Board Comments"; Rec."Board Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Board Comments field.';
                }
                field("Letter of Termination"; Rec."Letter of Termination")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Letter of Termination field.';
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
                    ToolTip = 'Executes the Send A&pproval Request action.';
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
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';
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
                action("Close the Review Process")
                {
                    ApplicationArea = Basic;
                    Image = Close;
                    Promoted = true;
                    PromotedCategory = Process;
                    Visible = false;
                    ToolTip = 'Executes the Close the Review Process action.';
                    trigger OnAction()
                    var
                        TXT001: label 'Close the review process?';
                    begin
                        if Rec."Termination Reason" = Rec."termination reason"::"Complete Review" then
                            Rec.TestField("Board Verdict");
                        if Confirm(TXT001) = true then begin
                            Examination.CloseSyllabusJob(Rec);
                        end
                    end;
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
                Visible = false;
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    Rec.SetRange("Application No.", Rec."Application No.");
                    Report.Run(85300, true, false, Rec);
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

