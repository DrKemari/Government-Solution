#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69295 "Training Need Request"
{
    PageType = Card;
    SourceTable = "Training Needs Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                }
                field(Disabled; Rec.Disabled)
                {
                    ApplicationArea = Basic;
                }
                field("Date of First Appointment"; Rec."Date of First Appointment")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Training Plan No"; Rec."Training Plan No")
                {
                    ApplicationArea = Basic;
                    Enabled = Rec.Status = Rec.Status::Released;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control9; "Need Requests")
            {
                SubPageLink = "Training Header No." = field(Code);
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control27; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control26; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control25; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control21; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Need Application")
            {
                Caption = 'Need Application';
                Image = "Order";
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    Promoted = true;
                    PromotedIsBig = true;
                    ShortCutKey = 'Shift+Ctrl+D';

                    trigger OnAction()
                    begin
                        CurrPage.SaveRecord;
                    end;
                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedIsBig = false;

                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                    begin
                        //ApprovalEntries.Setfilters(DATABASE::"Purchase Header","Document Type","No.");
                        ApprovalEntries.Setfilters(Database::"Purchase Header", 14, Rec.Code);
                        ApprovalEntries.Run;
                    end;
                }
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
                    PromotedCategory = Category9;

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        Rec.TestField(Status, Rec.Status::Open);
                        Rec.Status := Rec.Status::Released;
                        Message('Approved Successfully');
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
                        Rec.TestField(Status, Rec.Status::Released);
                        Rec.Status := Rec.Status::Open;
                        Message('Cancelled Successfully');
                    end;
                }
                action(Post)
                {
                    ApplicationArea = Basic;
                    Image = PostApplication;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    Visible = Rec.Status = Rec.Status::Released;

                    trigger OnAction()
                    begin
                        Rec.TestField(Posted, false);
                        Rec.TestField("Training Plan No");
                        TrainingNeedsRequests.Reset;
                        TrainingNeedsRequests.SetRange("Training Header No.", Rec.Code);
                        if TrainingNeedsRequests.FindSet then begin
                            repeat
                                TrainingPlanLines.Reset;
                                TrainingPlanLines.SetRange("Training Plan Code", Rec."Training Plan No");
                                TrainingPlanLines.SetRange("Course Title", TrainingNeedsRequests."Course ID");
                                if not TrainingPlanLines.FindSet then begin
                                    TrainingPlanLines2.Init;
                                    TrainingPlanLines3.Reset;
                                    if TrainingPlanLines3.FindLast then
                                        TrainingPlanLines2."Task No" := TrainingPlanLines3."Task No" + 1;
                                    TrainingPlanLines2."Training Plan Code" := Rec."Training Plan No";
                                    TrainingPlanLines2."Course Title" := TrainingNeedsRequests."Course ID";
                                    TrainingPlanLines2."Course Description" := TrainingNeedsRequests.Description;
                                    TrainingPlanLines2.Insert(true);
                                end;
                                TrainingNeedsRegister.Init;
                                TrainingNeedsReg.Reset;
                                if TrainingNeedsReg.FindLast then
                                    TrainingNeedsRegister."Entry No." := TrainingNeedsReg."Entry No." + 1;
                                TrainingNeedsRegister."Training Plan No" := Rec."Training Plan No";
                                TrainingNeedsRegister."Course ID" := TrainingNeedsRequests."Course ID";
                                TrainingNeedsRegister.Description := TrainingNeedsRequests.Description;
                                TrainingNeedsRegister.Source := TrainingNeedsRequests.Source;
                                TrainingNeedsRegister.Comments := TrainingNeedsRequests.Comments;
                                TrainingNeedsRegister."Training Header No." := Rec.Code;
                                TrainingNeedsRegister."Employee No" := Rec."Employee No";
                                TrainingNeedsRegister."Employee Name" := Rec."Employee Name";
                                TrainingNeedsRegister.Insert(true);
                            until TrainingNeedsRequests.Next = 0;
                        end;
                        Rec.Posted := true;
                        Rec."Posted By" := UserId;
                        Rec."Posted On" := CurrentDatetime;
                        Message('Posted Successfully');
                    end;
                }
            }
        }
    }

    var
        TrainingNeedsRegister: Record "Training Needs Register";
        TrainingNeedsRequests: Record "Training Needs Requests";
        TrainingNeedsReg: Record "Training Needs Register";
        TrainingPlanLines: Record "Training Plan Lines";
        TrainingNeedsReq: Record "Training Needs Requests";
        TrainingPlanLines2: Record "Training Plan Lines";
        TrainingPlanLines3: Record "Training Plan Lines";
}

#pragma implicitwith restore

