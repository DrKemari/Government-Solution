#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57042 "Imprest Memo-p"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Imprest Memo";
    SourceTableView = where(Status = const(Released),
                            Posted = const(false));

    layout
    {
        area(content)
        {
            group("Imprest Request Memo")
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Warrant Voucher Type"; Rec."Warrant Voucher Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Warrant Voucher Type field.';
                }
                field("Warrant No"; Rec."Warrant No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Warrant No field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field(Project; Rec.Project)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Importance = Promoted;
                    ShowMandatory = true;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Project field.';
                }
                field("Project Description"; Rec."Project Description")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Project Description field.';
                }
                field(Subject; Rec.Subject)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Subject field.';
                }
                field(Objective; ObjText)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Importance = Standard;
                    MultiLine = true;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the ObjText field.';
                    trigger OnValidate()
                    begin
                        Rec.CalcFields(Objective);
                        Rec.Objective.CreateInstream(ObjInstr);
                        Obj.Read(ObjInstr);

                        if ObjText <> Format(Obj) then begin
                            Clear(Rec.Objective);
                            Clear(Obj);
                            Obj.AddText(ObjText);
                            Rec.Objective.CreateOutstream(ObjOutStr);
                            Obj.Write(ObjOutStr);
                            //MODIFY;
                        end;
                    end;
                }
                field("Terms of Reference"; TORText)
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    Importance = Standard;
                    MultiLine = true;
                    ShowMandatory = true;
                    Visible = false;
                    ToolTip = 'Specifies the value of the TORText field.';
                    trigger OnValidate()
                    begin

                        Rec.CalcFields("Terms of Reference");
                        Rec."Terms of Reference".CreateInstream(Instr);
                        TOR.Read(Instr);

                        if TORText <> Format(TOR) then begin
                            Clear(Rec."Terms of Reference");
                            Clear(TOR);
                            TOR.AddText(TORText);
                            Rec."Terms of Reference".CreateOutstream(OutStr);
                            TOR.Write(OutStr);
                            //MODIFY;
                        end;
                    end;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Raised By';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Raised By field.';
                }
                field(Requestor; Rec.Requestor)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requestor field.';
                }
                field("Requestor Name"; Rec."Requestor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requestor Name field.';
                }
                field("Shortcut Dimension 5 Code"; Rec."Shortcut Dimension 5 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Destination Code:';
                    Visible = false;
                    ToolTip = 'Specifies the value of the Destination Code: field.';
                }
                field("Destination Name"; Rec."Destination Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Destination Name field.';
                }
                field("Imprest Naration"; Rec."Imprest Naration")
                {
                    ApplicationArea = Basic;
                    Caption = 'Destination Narations';
                    ToolTip = 'Specifies the value of the Destination Narations field.';
                }
                field("Total Subsistence Allowance"; Rec."Total Subsistence Allowance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Subsistence Allowance field.';
                }
                field("Total Fuel Costs"; Rec."Total Fuel Costs")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Fuel Costs field.';
                }
                field("Total Maintenance Costs"; Rec."Total Maintenance Costs")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Maintenance Costs field.';
                }
                field("Total Casuals Cost"; Rec."Total Casuals Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Casuals Cost field.';
                }
                field("Total Other Costs"; Rec."Total Other Costs")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Other Costs field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Job; Rec.Job)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job field.';
                }
                field("Job Name"; Rec."Job Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Job Name field.';
                }
                field("Job  Task"; Rec."Job  Task")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job  Task field.';
                }
                field("Job Task Name"; Rec."Job Task Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Job Task Name field.';
                }
                field("Job Task Budget"; Rec."Job Task Budget")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Job Task Budget field.';
                }
                field("Job Task Remaining Amount"; Rec."Job Task Remaining Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Job Task Remaining Amount field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department Name field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = not OpenApprovalEntriesExist;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 4 Code field.';
                }
                field("Division Name"; Rec."Division Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Division Name field.';
                }
                field("Project Budget"; Rec."Project Budget")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Total Project Budget field.';
                }
                field("Funding Source"; Rec."Funding Source")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funding Source field.';
                }
                field("Actual Project Costs"; Rec."Actual Project Costs")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Actual Project Costs field.';
                }
                field("PO Commitments"; Rec."PO Commitments")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Purchase Order Commitments field.';
                }
                field("Store Requisition Commitments"; Rec."Store Requisition Commitments")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Store Requisition(S11) Commitments field.';
                }
                field("Imprest Application Commitment"; Rec."Imprest Application Commitment")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Imprest Applications Commitments field.';
                }
                field("Total Budget Commitments"; Rec."Total Budget Commitments")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Total Budget Commitments field.';
                }
            }
            group(Reasons)
            {
                Caption = 'Reasons';
                field("Reason to Reopen"; Rec."Reason to Reopen")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reason to Reopen field.';
                }
            }
            group("Travel Details")
            {
                Editable = false;
                field(From; Rec.From)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the From field.';
                }
                field(Destination; Rec.Destination)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Destination field.';
                }
                field("Time Out"; Rec."Time Out")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time Out field.';
                }
                field("Journey Route"; Rec."Journey Route")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Journey Route field.';
                }
            }
            part(Control1000000020; "Safari Team")
            {
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = "Imprest Memo No." = field("No."),
                              Type = const(Person);
                ApplicationArea = Basic;
            }
            part("Fuel/Maintenance"; Fuel)
            {
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = "Imprest Memo No." = field("No."),
                              Type = const(Machine);
                ApplicationArea = Basic;
            }
            part(Control1000000021; "Execution Plan")
            {
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = "Imprest Memo No." = field("No.");
                Visible = false;
                ApplicationArea = Basic;
            }
            part(Control1000000022; Casuals)
            {
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = "Imprest Memo No." = field("No.");
                ApplicationArea = Basic;
            }
            part(Control1000000023; "Other Costs")
            {
                Editable = not OpenApprovalEntriesExist;
                SubPageLink = "Imprest Memo No." = field("No.");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control1000000017; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000018; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000019; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                Enabled = not OpenApprovalEntriesExist;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category9;
                Visible = false;
                ToolTip = 'Executes the Send A&pproval Request action.';
                trigger OnAction()
                begin
                    //Daudi
                    //check if the requester is part of the team
                    ProjectTeam.Reset;
                    ProjectTeam.SetRange(ProjectTeam."No.", Rec.Requestor);
                    if ProjectTeam.FindFirst = false then
                        Error(Text001);

                    //if //ApprovalsMgmt.CheckImpMemoApprovalsWorkflowEnabled(Rec) then
                    //ApprovalsMgmt.OnSendImpMemoForApproval(Rec);
                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                Enabled = OpenApprovalEntriesExist;
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category9;
                Visible = false;
                ToolTip = 'Executes the Cancel Approval Re&quest action.';
                trigger OnAction()
                begin
                    //ApprovalsMgmt.OnCancelImpMemoApprovalRequest(Rec);
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Enabled = Show;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = false;
                ToolTip = 'Executes the Post action.';
                trigger OnAction()
                begin
                    PaymentPost.PostImprestMemo(Rec);
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    //Ushindi changes
                    if Rec.Status <> Rec.Status::Released then
                        Error(Text002);
                    if Rec.Status = Rec.Status::Released then begin
                        Rec.SetRange("No.", Rec."No.");
                        Report.Run(57001, true, true, Rec);
                        Rec.Reset;
                    end;
                end;
            }
            action("Create Imprest")
            {
                ApplicationArea = Basic;
                Enabled = true;
                Image = CreateForm;
                Promoted = true;
                PromotedCategory = Process;
                Visible = true;
                ToolTip = 'Executes the Create Imprest action.';
                trigger OnAction()
                begin
                    //add pv from claims
                    //added on 27/04/2017
                    Usersetup.Get(UserId);
                    Usersetup.TestField(Usersetup."Process Claims", Usersetup."Process Claims" = true);
                    if Confirm(Text004, false, Rec."No.") then begin
                        Memoheaders.Reset;
                        Memoheaders.SetRange(Memoheaders."No.", Rec."No.");
                        if Memoheaders.Find('-') then begin
                            //set current key

                            SafariMembers.Reset;
                            SafariMembers.SetCurrentkey("No.");
                            SafariMembers.SetRange("Imprest Memo No.", Memoheaders."No.");
                            SafariMembers.SetRange(SafariMembers.Type, SafariMembers.Type::Person);
                            if SafariMembers.Find('-') then begin
                                repeat
                                    if (SafariMembers1."No." <> SafariMembers."No.") then begin
                                        //get the no. series
                                        CashMgt.Reset;
                                        if CashMgt.Find('-') then begin
                                            Noseries := CashMgt."Imprest Nos";
                                            Email2 := CashMgt."Imprest Email";
                                        end;
                                        //create header
                                        LineNo := 1000;
                                        Imprestheaders.Init;
                                        Imprestheaders."No." := NoSeriesMgt.GetNextNo(Noseries, Imprestheaders.Date, true);
                                        Imprestheaders.Date := Today;
                                        Imprestheaders."Account Type" := Imprestheaders."account type"::Employee;
                                        Imprestheaders."Account No." := SafariMembers."No.";
                                        Imprestheaders."Account Name" := SafariMembers.Name;
                                        Imprestheaders."Payment Type" := Imprestheaders."payment type"::Imprest;
                                        Imprestheaders.Payee := SafariMembers.Name;
                                        Imprestheaders."Imprest Bank Name" := SafariMembers."Bank Name";
                                        Imprestheaders."Bank Code" := SafariMembers."Bank Branch";
                                        Imprestheaders."Imprest Bank Branch Name" := SafariMembers."Bank Branch Name";
                                        Imprestheaders."Imprest Bank Account Number" := SafariMembers."Bank Account Number";
                                        Imprestheaders.Job := Memoheaders.Job;
                                        Imprestheaders.Status := Imprestheaders.Status::Open;//matara
                                        Imprestheaders."Job Task No" := Memoheaders."Job  Task";
                                        Imprestheaders."Job Task No." := Memoheaders."Job  Task";
                                        Imprestheaders."Currency Code" := SafariMembers."Currency Code";
                                        Imprestheaders."Created By" := UserId;
                                        //Imprestheaders."Reference No.":="No.";

                                        Email1 := '';

                                        EMp.Reset;
                                        EMp.SetRange("No.", Imprestheaders."Account No.");

                                        Imprestheaders."Travel Date" := Memoheaders."Start Date";
                                        Imprestheaders."Payment Narration" := Memoheaders.Subject;
                                        Imprestheaders.Validate(Imprestheaders."Travel Date");
                                        Imprestheaders."Document Type" := Imprestheaders."document type"::Imprest;
                                        Imprestheaders."Imprest Memo No" := Memoheaders."No.";
                                        Imprestheaders."On behalf of" := SafariMembers.Name;
                                        Imprestheaders."Shortcut Dimension 1 Code" := Memoheaders."Shortcut Dimension 1 Code";
                                        Imprestheaders.Validate(Imprestheaders."Shortcut Dimension 1 Code");
                                        Imprestheaders."Shortcut Dimension 2 Code" := Memoheaders."Shortcut Dimension 2 Code";
                                        Imprestheaders.Validate(Imprestheaders."Shortcut Dimension 2 Code");
                                        Imprestheaders."Shortcut Dimension 3 Code" := Memoheaders."Shortcut Dimension 3 Code";
                                        //Imprestheaders.VALIDATE(Imprestheaders."Shortcut Dimension 3 Code");
                                        Imprestheaders."Shortcut Dimension 4 Code" := Memoheaders."Shortcut Dimension 4 Code";
                                        Imprestheaders."Dimension Set ID" := Memoheaders."Dimension Set ID";
                                        //Imprestheaders.VALIDATE(Imprestheaders."Shortcut Dimension 4 Code");
                                        Imprestheaders.Insert;
                                    end;

                                    //Start of Imprest lines
                                    Imprestlines.Init;
                                    Imprestlines."Line No" := LineNo;
                                    Imprestlines.No := Imprestheaders."No.";
                                    Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
                                    SafariMembers.CalcFields("G/L Account");
                                    Imprestlines."Account No." := SafariMembers."G/L Account";
                                    Imprestlines.Validate(Imprestlines."Account No.");
                                    Imprestlines.Purpose := SafariMembers."Work Type";
                                    Imprestlines."Daily Rate" := SafariMembers."Direct Unit Cost";
                                    Imprestlines."Applies- to Doc. No." := Memoheaders."No.";
                                    Imprestlines."No. of Days" := SafariMembers."Time Period";
                                    Imprestlines.Amount := SafariMembers.Entitlement;
                                    Imprestlines."Currency Code" := SafariMembers."Currency Code";
                                    Imprestlines.Insert;
                                    LineNo := LineNo + 10;
                                    if SafariMembers."Transport Costs" <> 0 then begin
                                        Imprestlines.Init;
                                        Imprestlines."Line No" := LineNo;
                                        Imprestlines.No := Imprestheaders."No.";
                                        Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
                                        SafariMembers.CalcFields("G/L Account");
                                        Imprestlines."Account No." := SafariMembers."G/L Account";
                                        Imprestlines.Validate(Imprestlines."Account No.");
                                        Imprestlines.Purpose := 'Transport Allowance';
                                        Imprestlines."Daily Rate" := SafariMembers."Direct Unit Cost";
                                        Imprestlines."No. of Days" := SafariMembers."Time Period";
                                        Imprestlines.Amount := SafariMembers."Transport Costs";
                                        Imprestlines."Applies- to Doc. No." := Memoheaders."No.";
                                        Imprestlines."Currency Code" := SafariMembers."Currency Code";
                                        Imprestlines."Global Dimension 1 Code" := Memoheaders."Shortcut Dimension 1 Code";
                                        Imprestlines.Validate(Imprestlines."Global Dimension 1 Code");
                                        Imprestlines."Global Dimension 2 Code" := Memoheaders."Shortcut Dimension 2 Code";
                                        Imprestlines.Validate(Imprestlines."Global Dimension 2 Code");


                                        Imprestlines.Insert;
                                        LineNo := LineNo + 10;
                                    end;

                                    if SafariMembers."Project Lead" = true then begin
                                        ProjectTeam.Reset;
                                        ProjectTeam.SetRange(ProjectTeam."Imprest Memo No.", Rec."No.");
                                        ProjectTeam.SetRange(ProjectTeam.Type, ProjectTeam.Type::Machine);
                                        if ProjectTeam.Find('-') then
                                        //IF ProjectTeam.Type = ProjectTeam.Type::Machine THEN
                                        begin
                                            repeat
                                                Imprestlines.Init;
                                                Imprestlines."Line No" := LineNo;
                                                Imprestlines.No := Imprestheaders."No.";
                                                Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
                                                SafariMembers.CalcFields("G/L Account");
                                                Imprestlines."Account No." := ProjectTeam."G/L Account";
                                                Imprestlines.Validate(Imprestlines."Account No.");
                                                Imprestlines.Purpose := ProjectTeam."Work Type";
                                                Imprestlines."Applies- to Doc. No." := Memoheaders."No.";
                                                Imprestlines."Daily Rate" := SafariMembers."Direct Unit Cost";
                                                Imprestlines."No. of Days" := SafariMembers."Time Period";
                                                Imprestlines.Amount := ProjectTeam."Expected Maintenance Cost";
                                                Imprestlines."Global Dimension 1 Code" := Memoheaders."Shortcut Dimension 1 Code";
                                                Imprestlines.Validate(Imprestlines."Global Dimension 1 Code");
                                                Imprestlines."Global Dimension 2 Code" := Memoheaders."Shortcut Dimension 2 Code";
                                                Imprestlines.Validate(Imprestlines."Global Dimension 2 Code");
                                                Imprestlines."Currency Code" := SafariMembers."Currency Code";

                                                Imprestlines.Insert;
                                                LineNo := LineNo + 10;

                                            until ProjectTeam.Next = 0;
                                        end;


                                        Othercost.Reset;
                                        Othercost.SetRange(Othercost."Imprest Memo No.", Rec."No.");
                                        if Othercost.Find('-') then begin
                                            repeat
                                                Imprestlines.Init;
                                                Imprestlines."Line No" := LineNo;
                                                Imprestlines.No := Imprestheaders."No.";

                                                Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
                                                Othercost.CalcFields("No.");
                                                Imprestlines."Account No." := Othercost."No.";
                                                Imprestlines.Validate(Imprestlines."Account No.");
                                                Imprestlines.Purpose := Othercost."Required For";
                                                Imprestlines."Daily Rate" := SafariMembers."Direct Unit Cost";
                                                Imprestlines."No. of Days" := SafariMembers."Time Period";
                                                Imprestlines.Amount := Othercost."Line Amount";
                                                Imprestlines."Applies- to Doc. No." := Memoheaders."No.";
                                                Imprestlines."Global Dimension 1 Code" := Memoheaders."Shortcut Dimension 1 Code";
                                                Imprestlines.Validate(Imprestlines."Global Dimension 1 Code");
                                                Imprestlines."Global Dimension 2 Code" := Memoheaders."Shortcut Dimension 2 Code";
                                                Imprestlines.Validate(Imprestlines."Global Dimension 2 Code");
                                                Imprestlines."Currency Code" := SafariMembers."Currency Code";
                                                Imprestlines.Insert;
                                                LineNo := LineNo + 10;

                                            until Othercost.Next = 0;
                                        end;


                                        Casual.Reset;
                                        Casual.SetRange(Casual."Imprest Memo No.", Rec."No.");
                                        if Casual.Find('-') then begin
                                            repeat
                                                Imprestlines.Init;
                                                Imprestlines."Line No" := LineNo;
                                                Imprestlines.No := Imprestheaders."No.";

                                                Imprestlines."Account Type" := Imprestlines."account type"::"G/L Account";
                                                Imprestlines."Account No." := Casual."G/L Account";
                                                Imprestlines.Validate(Imprestlines."Account No.");
                                                Imprestlines.Purpose := Casual.Activity;
                                                Imprestlines."Daily Rate" := Casual.Rate;
                                                Imprestlines."No. of Days" := Casual."No. of Days";
                                                Imprestlines.Amount := Casual.Amount;
                                                Imprestlines."Applies- to Doc. No." := Memoheaders."No.";
                                                Imprestlines."Global Dimension 1 Code" := Memoheaders."Shortcut Dimension 1 Code";
                                                Imprestlines.Validate(Imprestlines."Global Dimension 1 Code");
                                                Imprestlines."Global Dimension 2 Code" := Memoheaders."Shortcut Dimension 2 Code";
                                                Imprestlines.Validate(Imprestlines."Global Dimension 2 Code");
                                                Imprestlines."Currency Code" := SafariMembers."Currency Code";
                                                Imprestlines.Insert;
                                                LineNo := LineNo + 10;

                                            until Casual.Next = 0;
                                        end;
                                    end;

                                    Imprestheaders.Validate(Imprestheaders.Status);
                                    // //send email to participants
                                    // CashMgt.Get;
                                    // if CashMgt."Send Email Notification" = true then begin
                                    //     if Email1 <> '' then begin
                                    //         Body := 'Your imprest application no. ' + Imprestheaders."No." + ' has been created from memo no. ' + Rec."No." +
                                    //         ' Kindly logon to Microsoft Dynamics 365 Business Central to confirm and send it for approval.';

                                    //         //SMTP.Create('KERRA', Email2,
                                    //         // Email1, 'Imprest ' + 'No: ' + Imprestheaders."No.",
                                    //         // 'Dear ' + Imprestheaders.Payee + ',<BR><BR>' +
                                    //         // 'Your imprest application no. ' + Imprestheaders."No." + 'of amount ' + Format(SafariMembers.Entitlement) + ''' has been created from memo no. ' + "No." +
                                    //         // ' and has been fowarded to finance for processing.<BR><BR>', true);

                                    //         //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>Finance Department.<BR>' + '<BR>');
                                    //         //SMTP.Send();

                                    //     end;
                                    // end;
                                    SafariMembers1 := SafariMembers;
                                until SafariMembers.Next = 0;
                            end;

                            Memoheaders."Imprest Created" := true;
                            Memoheaders."Date converted" := Today;
                            Memoheaders."Time converted" := Time;
                            Memoheaders."Converted By" := UserId;
                            Memoheaders.Posted := true;
                            Memoheaders.Modify;

                        end;
                        Message('Imprest (s) for the imprest memo No. %1 has been processed, Kindly send for approval', Rec."No.");
                    end else
                        Error('The payment for claim No. %1 has already been processed.', Memoheaders."No.");
                    //END;
                end;
            }
            action("Create Voucher")
            {
                ApplicationArea = Basic;
                Image = CreateForm;
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;
                ToolTip = 'Executes the Create Voucher action.';
                trigger OnAction()
                var
                    RecordLink: Record "Record Link";
                    IDEntry: RecordID;
                    MemoHeader: Record "Imprest Memo";
                    RecordLink1: Record "Record Link";
                    "EntryNo.": Integer;
                    PaymentHeader: Record Payments;
                begin
                    Usersetup.Get(UserId);
                    Rec.TestField("Job  Task");
                    LineNo := 0;
                    Usersetup.TestField(Usersetup."Process Claims", Usersetup."Process Claims" = true);
                    CashMgt.Get();

                    Rec.TestField("Warrant Voucher Type");
                    if Confirm(Text004, false, Rec."No.") then begin

                        Memoheaders.Reset;
                        Memoheaders.SetRange(Memoheaders."No.", Rec."No.");
                        if Memoheaders.Find('-') then begin
                            if Rec."Warrant Voucher Type" = Rec."warrant voucher type"::"Create New Warrant" then begin
                                Noseries := CashMgt."Imprest Voucher Nos";
                                Imprestheaders.Init;
                                Imprestheaders."No." := NoSeriesMgt.GetNextNo(Noseries, Imprestheaders.Date, true);
                                Imprestheaders.Date := Today;
                                Imprestheaders."Created By" := UserId;
                                Imprestheaders."Payment Type" := Imprestheaders."payment type"::"Warrant Voucher";
                                Imprestheaders."Document Type" := Imprestheaders."document type"::"Warrant Voucher";
                                Imprestheaders."Travel Date" := Imprestheaders."Travel Date";
                                Imprestheaders."Imprest Memo No" := Memoheaders."No.";
                                Imprestheaders."Payment Narration" := Memoheaders.Subject;
                                Imprestheaders.Status := Imprestheaders.Status::Released;
                                //insert documents
                                RecordLink.Reset;
                                RecordLink.SetRange("Record ID", Memoheaders.RecordId);
                                if RecordLink.FindSet then begin
                                    repeat
                                        //copy to the record link table with record id of the PV Machira
                                        RecordLink1.Reset;
                                        if RecordLink1.FindLast then begin
                                            "EntryNo." := RecordLink1."Link ID";
                                        end;
                                        RecordLink1.Init;
                                        RecordLink1."Link ID" := "EntryNo." + 1;
                                        RecordLink1."Record ID" := Imprestheaders.RecordId;
                                        RecordLink1.URL1 := RecordLink.URL1;
                                        RecordLink1.Description := RecordLink.URL1;
                                        RecordLink1.Company := RecordLink.Company;
                                        RecordLink1.Type := RecordLink.Type;
                                        RecordLink1.Created := RecordLink.Created;
                                        RecordLink1."User ID" := RecordLink."User ID";
                                        RecordLink1.Insert;

                                    until RecordLink.Next = 0;

                                end;

                                //end insert document
                                Imprestheaders."Shortcut Dimension 1 Code" := Memoheaders."Global Dimension 1 Code";
                                //Imprestheaders.VALIDATE(Imprestheaders."Shortcut Dimension 1 Code");
                                Imprestheaders."Shortcut Dimension 2 Code" := Memoheaders."Global Dimension 2 Code";
                                //Imprestheaders.VALIDATE(Imprestheaders."Shortcut Dimension 2 Code");
                                Imprestheaders."Shortcut Dimension 3 Code" := Memoheaders."Shortcut Dimension 3 Code";
                                //Imprestheaders.VALIDATE(Imprestheaders."Shortcut Dimension 3 Code");
                                Imprestheaders."Shortcut Dimension 4 Code" := Memoheaders."Shortcut Dimension 4 Code";
                                //Imprestheaders.VALIDATE(Imprestheaders."Shortcut Dimension 4 Code");
                                Imprestheaders.Insert;
                            end;

                            SafariMembers.Reset;
                            SafariMembers.SetRange("Imprest Memo No.", Memoheaders."No.");
                            SafariMembers.SetRange(SafariMembers.Type, SafariMembers.Type::Person);
                            if SafariMembers.FindSet then begin
                                repeat
                                    SafariMembers.TestField("Vote Item");
                                    //get totals per member
                                    SafariMembersTotal.Reset;
                                    SafariMembersTotal.SetRange("Imprest Memo No.", Memoheaders."No.");
                                    SafariMembersTotal.SetRange("No.", SafariMembers."No.");
                                    SafariMembersTotal.SetRange(SafariMembersTotal.Type, SafariMembersTotal.Type::Person);
                                    if SafariMembersTotal.FindSet then begin

                                        TotalEntitlement := 0;
                                        SafariMembersTotal.CalcSums(Entitlement);
                                        TotalEntitlement := SafariMembersTotal.Entitlement;
                                    end;

                                    //Added to create New or Update by Morris
                                    if Rec."Warrant Voucher Type" = Rec."warrant voucher type"::"Create New Warrant" then begin
                                        ImprestHeaderNo := Imprestheaders."No.";
                                    end;

                                    if Rec."Warrant Voucher Type" = Rec."warrant voucher type"::"Append To Exist" then begin
                                        Rec.TestField("Warrant No");
                                        ImprestHeaderNo := Rec."Warrant No";
                                        //insert documents

                                        PaymentHeader.Reset;
                                        PaymentHeader.SetRange("No.", ImprestHeaderNo);
                                        if PaymentHeader.FindFirst then begin
                                            RecordLink.Reset;
                                            RecordLink.SetRange("Record ID", Memoheaders.RecordId);
                                            if RecordLink.FindSet then begin
                                                repeat
                                                    //copy to the record link table with record id of the PV Machira
                                                    RecordLink1.Reset;
                                                    if RecordLink1.FindLast then begin
                                                        "EntryNo." := RecordLink1."Link ID";
                                                    end;
                                                    RecordLink1.Init;
                                                    RecordLink1."Link ID" := "EntryNo." + 1;
                                                    RecordLink1."Record ID" := PaymentHeader.RecordId;
                                                    RecordLink1.URL1 := RecordLink.URL1;
                                                    RecordLink1.Description := RecordLink.URL1;
                                                    RecordLink1.Company := RecordLink.Company;
                                                    RecordLink1.Type := RecordLink.Type;
                                                    RecordLink1.Created := RecordLink.Created;
                                                    RecordLink1."User ID" := RecordLink."User ID";
                                                    RecordLink1.Insert;

                                                until RecordLink.Next = 0;

                                            end;
                                        end;
                                        //end insert document

                                    end;
                                    //End to create New or Update by Morris

                                    ImprestVoucherLines.Reset;
                                    ImprestVoucherLines.SetRange("Account No.", SafariMembers."No.");
                                    ImprestVoucherLines.SetRange(No, ImprestHeaderNo);
                                    //ImprestVoucherLines.SETRANGE(No,Imprestheaders."No.");
                                    if not ImprestVoucherLines.FindSet then begin
                                        //get the last line no
                                        ImprestVoucherLines1.Reset;
                                        ImprestVoucherLines1.SetCurrentkey("Line No");
                                        ImprestVoucherLines1.SetAscending("Line No", true);
                                        if ImprestVoucherLines1.FindLast then begin
                                            LineNo := ImprestVoucherLines1."Line No";
                                        end;

                                        ImprestVoucherLines.Init;
                                        ImprestVoucherLines."Line No" := LineNo + 1;
                                        //ImprestVoucherLines.No := Imprestheaders."No.";
                                        ImprestVoucherLines.No := ImprestHeaderNo;
                                        //Machira--Added to maintain the initial Memo
                                        ImprestVoucherLines."Imprest Memo No." := SafariMembers."Imprest Memo No.";
                                        ImprestVoucherLines."Account Type" := Imprestlines."account type"::Employee;
                                        ImprestVoucherLines."Account No." := SafariMembers."No.";
                                        ImprestVoucherLines.Purpose := Memoheaders.Subject;
                                        ImprestVoucherLines."Imprest Subsistence" := TotalEntitlement;
                                        if SafariMembers."Transport Costs" <> 0 then
                                            ImprestVoucherLines."Imprest Transport" := SafariMembers."Transport Costs";
                                        if SafariMembers."Project Lead" = true then begin
                                            ProjectTeam.Reset;
                                            ProjectTeam.SetRange(ProjectTeam."Imprest Memo No.", Rec."No.");
                                            ProjectTeam.SetRange(ProjectTeam.Type, ProjectTeam.Type::Machine);
                                            if ProjectTeam.FindSet then begin
                                                repeat
                                                    ImprestOther := 0.0;
                                                    ImprestOther := ProjectTeam."Expected Maintenance Cost";
                                                until ProjectTeam.Next = 0;
                                            end;
                                            Othercost.Reset;
                                            Othercost.SetRange(Othercost."Imprest Memo No.", Rec."No.");
                                            Costs := 0.0;
                                            if Othercost.FindSet then begin
                                                repeat
                                                    Costs := Costs + Othercost."Line Amount";
                                                until Othercost.Next = 0;
                                                ImprestVoucherLines."Imprest Other Costs" := Costs + ImprestOther;
                                            end;

                                        end;
                                        ImprestVoucherLines.Validate("Account No.");
                                        ImprestVoucherLines.Validate(Amount);
                                        ImprestVoucherLines.Insert;

                                    end else begin
                                        //modify  incase
                                    end;


                                until SafariMembers.Next = 0;
                            end;
                        end;



                        Memoheaders."Imprest Created" := true;
                        Memoheaders."Date converted" := Today;
                        Memoheaders."Time converted" := Time;
                        Memoheaders."Converted By" := UserId;
                        Memoheaders.Posted := true;
                        Memoheaders.Modify;
                        Message('The Warrant Voucher has been created,kindly fill in the details and post it');
                    end;

                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Caption = 'Approvals';
                Image = Approvals;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = false;
                ToolTip = 'Executes the Approvals action.';
                trigger OnAction()
                var
                    ApprovalEntries: Page "Approval Entries";
                begin

                    // ApprovalEntries.Setfilters(DATABASE::"Imprest Memo",6,"No.");
                    // ApprovalEntries.RUN;

                    ApprovalEntries.Setfilters(Database::"Imprest Memo", 5, Rec."No.");
                    ApprovalEntries.Run;
                end;
            }
        }
        area(navigation)
        {
            action("Re&lease")
            {
                ApplicationArea = Basic;
                Caption = 'Re&lease';
                Image = ReleaseDoc;
                ShortCutKey = 'Ctrl+F9';
                ToolTip = 'Executes the Re&lease action.';
                trigger OnAction()
                var
                //ReleasePurchDoc: Codeunit "Release Purchase Document";
                begin
                    Releasememo.PerformManualRelease(Rec);
                end;
            }
            action("Re&open")
            {
                ApplicationArea = Basic;
                Caption = 'Re&open';
                Image = ReOpen;
                ToolTip = 'Executes the Re&open action.';
                trigger OnAction()
                var
                //ReleasePurchDoc: Codeunit "Release Purchase Document";
                begin
                    //added on 20/04/2016
                    Usersetup.Get(UserId);
                    Usersetup.TestField(Usersetup."Reopen Document", Usersetup."Reopen Document" = true);
                    Rec.TestField("Reason to Reopen");
                    ReopenMemo.PerformManualReopen(Rec);

                    //added on 20/04/2016
                    //increase frequency of reopening to be only once
                    if Rec."Frequency of Reopen" > 0 then begin
                        Error('The memo already reopened you can only reopen once');
                    end else begin
                        Rec."Frequency of Reopen" := 1;
                        Rec."Reopened by" := UserId;
                        Rec."Reopened Date" := CurrentDatetime;
                        Rec.Modify;
                    end;
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Show := ((Rec.Status = Rec.Status::Released));
        SetControlAppearance;
        Rec.CalcFields("Terms of Reference", Objective);
        Rec."Terms of Reference".CreateInstream(Instr);
        TOR.Read(Instr);
        TORText := Format(TOR);


        Rec.Objective.CreateInstream(ObjInstr);
        Obj.Read(ObjInstr);
        ObjText := Format(Obj);
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Imprest Memo";
    end;

    trigger OnOpenPage()
    begin
        Show := ((Rec.Status = Rec.Status::Released));
        SetControlAppearance;
    end;

    var
        OpenApprovalEntriesExist: Boolean;
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        PaymentPost: Codeunit "Payments-Post";
        [InDataSet]
        Show: Boolean;
        TOR: BigText;
        Instr: InStream;
        OutStr: OutStream;
        TORText: Text;
        Obj: BigText;
        ObjInstr: InStream;
        ObjOutStr: OutStream;
        ObjText: Text;
        ProjectTeam: Record "Project Members";
        Text001: label 'The Requestor Must Be Part Of the Project  Team on The Memo';
        Text002: label 'The Imprest Memo must be fully approved before printing';
        ReopenMemo: Codeunit "Imprest Memo";
        memo: Record "Imprest Memo";
        Releasememo: Codeunit "Imprest Memo";
        Usersetup: Record "User Setup";
        Imprestlines: Record "Imprest Lines";
        Imprestheaders: Record Payments;
        Memolines: Record "PV Lines";
        Memoheaders: Record "Imprest Memo";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        CashMgt: Record "Cash Management Setup";
        Noseries: Code[20];
        Text004: label 'Are you sure you want to create imprest for memo No. %1 and notify the team members?';
        SafariMembers: Record "Project Members";
        Othercost: Record "Other Costs";
        LineNo: Integer;
        Text005: label 'Are you sure you want to create imprest for memo No. %1 and notify the team members?';
        SMTP: Codeunit "Email Message";
        Body: Text[1024];
        Email1: Text[250];
        Email2: Text[250];
        CompInfo: Record "Company Information";
        Text006: label 'your imprest No %1 of Amount %2 has been created,and is being processed';
        ImprestMessage: Text[80];
        TransportReq: Record "Transport Requisition";
        TransSetup: Record "Fleet Management Setup";
        TravelStaff: Record "Travel Requisition Staff";
        TravelNo: Code[50];
        EMp: Record Employee;
        Casual: Record Casuals;
        WorkType: Record "Work Type";
        SafariMembers1: Record "Project Members";
        ImprestOther: Decimal;
        Costs: Decimal;
        ImprestVoucherLines: Record "Imprest Voucher Lines";
        TotalEntitlement: Decimal;
        SafariMembersTotal: Record "Project Members";
        ImprestHeaderNo: Code[50];
        ImprestVoucherLines1: Record "Imprest Voucher Lines";

    local procedure SetControlAppearance()
    var
    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        //  OpenApprovalEntriesExist := //ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
    end;


    procedure FnSendimprestEmail(EmpNo: Code[50]; ImprestAmount: Decimal)
    var
        SMTPMail: Codeunit "Email Message";
        SMTPSetup: Record "Email Account";
        FileName: Text[100];
        Attachment: Text[250];
        CompanyInfo: Record "Company Information";
        Email: Text[50];
        EmpRec: Record Employee;
    begin
        SMTPSetup.Get();

        EmpRec.Reset;
        EmpRec.SetRange(EmpRec."No.", EmpNo);
        if EmpRec.Find('-') then begin

            if EmpRec."E-Mail" <> '' then begin
                ImprestMessage := Text006;
                Email := EmpRec."E-Mail";

                // SMTPMail.Create(SMTPSetup."Email Sender Name", SMTPSetup."Email Sender Address", Email, 'Imprest Application', '', true);
                // SMTPMail.AppendToBody(StrSubstNo(ImprestMessage, "No.", ImprestAmount, UserId));
                // SMTPMail.AppendToBody(SMTPSetup."Email Sender Name");
                // SMTPMail.AppendToBody('<br><br>');
                // SMTPMail.AddAttachment(FileName, Attachment);
                // SMTPMail.Send;
            end;
        end;
    end;
}

#pragma implicitwith restore

