#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 59012 "Fleet Requisition Card"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Transport Requisition";

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = NotEditable;
                field("Transport Requisition No"; Rec."Transport Requisition No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Transport Requisition No field.';
                }
                field("Requested By"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Requested By Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field(Position; Rec.Position)
                {
                    ApplicationArea = Basic;
                    Caption = 'Designation';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Designation field.';
                }
                field("Approved Imprest Memo"; Rec."Approved Imprest Memo")
                {
                    ApplicationArea = Basic;
                    Caption = 'Imprest Memo';
                    ToolTip = 'Specifies the value of the Imprest Memo field.';
                    trigger OnValidate()
                    begin
                        Rec.Destination := UpperCase(Rec.Destination);
                        Rec.Commencement := UpperCase(Rec.Commencement);
                        Rec.Modify;
                    end;
                }
                field(From; Rec.Commencement)
                {
                    ApplicationArea = Basic;
                    Editable = CommencementEditable;
                    ToolTip = 'Specifies the value of the Commencement field.';
                }
                field(Destination; Rec.Destination)
                {
                    ApplicationArea = Basic;
                    Editable = DensitationEditable;
                    Enabled = true;
                    ToolTip = 'Specifies the value of the Destination field.';
                }
                field("Date of Trip"; Rec."Date of Trip")
                {
                    ApplicationArea = Basic;
                    Editable = DateofTripEditable;
                    ToolTip = 'Specifies the value of the Date of Trip field.';
                }
                field("Time Requested"; Rec."Time Requested")
                {
                    ApplicationArea = Basic;
                    Caption = 'Time of Trip';
                    Editable = TimeRequestedEditable;
                    ToolTip = 'Specifies the value of the Time of Trip field.';
                }
                field("Time out"; Rec."Time out")
                {
                    ApplicationArea = Basic;
                    Editable = TimeoutEditable;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Time out field.';
                }
                field("Time In"; Rec."Time In")
                {
                    ApplicationArea = Basic;
                    Editable = TimeInEditable;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Time In field.';
                }
                field("Journey Route"; Rec."Journey Route")
                {
                    ApplicationArea = Basic;
                    Editable = JourneyEditable;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Journey Route field.';
                }
                field("Opening Odometer Reading"; Rec."Opening Odometer Reading")
                {
                    ApplicationArea = Basic;
                    Editable = openingMileageEditable;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Opening Odometer Reading field.';
                }
                field("Closing Odometer Reading"; Rec."Closing Odometer Reading")
                {
                    ApplicationArea = Basic;
                    Editable = closingMileageEditable;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Closing Odometer Reading field.';
                }
                field("No of Days Requested"; Rec."No of Days Requested")
                {
                    ApplicationArea = Basic;
                    Editable = NoofDaysEditable;
                    ToolTip = 'Specifies the value of the No of Days Requested field.';
                }
                field("Number of Hours Requested"; Rec."Number of Hours Requested")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Number of Hours Requested field.';
                }
                field("Trip End Date"; Rec."Trip End Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Trip End Date field.';
                }
                field("Trip End Time"; Rec."Trip End Time")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Trip End Time field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department Code field.';
                }
                field("Loaded to WorkTicket"; Rec."Loaded to WorkTicket")
                {
                    ApplicationArea = Basic;
                    Editable = loadedEditable;
                    ToolTip = 'Specifies the value of the Loaded to WorkTicket field.';
                }
                field("Work Ticket No"; Rec."Work Ticket No")
                {
                    ApplicationArea = Basic;
                    Editable = workticketEditable;
                    LookupPageID = "Daily Work Ticket List";
                    ToolTip = 'Specifies the value of the Work Ticket No field.';
                }
                field("User Id"; Rec."User Id")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the User Id field.';
                }
                field(HOD; Rec.HOD)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the HOD field.';
                }
                field("Added On"; Rec."Added On")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Added On field.';
                }
                field("Date of Request"; Rec."Date of Request")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Date of Request field.';
                }
            }
            group(Purpose)
            {
                Editable = NotEditable;
                field(Subject; Rec.Subject)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Subject field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    Editable = commentsEditable;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
                field("Reason for Reopening"; Rec."Reason for Reopening")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Reason for Reopening field.';
                }
            }
            part("Transport Requisition Staff"; "Travel Requisition Staff")
            {
                Caption = 'Travelling Staff';
                Editable = NotEditable;
                SubPageLink = "Req No" = field("Transport Requisition No");
                ApplicationArea = Basic;
            }
            part(Control17; "Non Staff Tavel Request")
            {
                Caption = 'Non Staff Travelers';
                Editable = NotEditable;
                SubPageLink = "Req No" = field("Transport Requisition No");
                ApplicationArea = Basic;
            }
            part(Control18; "Fleet Vehicle Allocation")
            {
                Caption = 'Vehicle Allocation';
                SubPageLink = "Transport Requisition No" = field("Transport Requisition No");
                Visible = Approved;
                ApplicationArea = Basic;
            }
            part(Control14; "Driver Vehicle Allocation")
            {
                SubPageLink = "Requisition Number" = field("Transport Requisition No");
                Visible = Approved;
                ApplicationArea = Basic;
            }
            part(Control22; "Non KeRRA Driver Allocations")
            {
                Caption = 'Non Kasneb Driver Allocations';
                SubPageLink = "Req No" = field("Transport Requisition No");
                Visible = Approved;
                ApplicationArea = Basic;
            }
            part(Control25; "Fleet Requisition Items")
            {
                Caption = 'Load Details (Movement of Goods)';
                Editable = NotEditable;
                SubPageLink = "Requisition Number" = field("Transport Requisition No");
                ApplicationArea = Basic;
            }
            part(Control32; "Fleet Fuel Requisition")
            {
                Editable = NotEditable;
                SubPageLink = "Req No" = field("Transport Requisition No");
                ApplicationArea = Basic;
            }
            systempart(Control10; Notes)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(creation)
        {
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
                    VarVariant: Variant;
                    CustomApprovals: Codeunit "Custom Approvals Codeunit";

                    ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                begin
                    Rec.TestField(Status, Rec.Status::Open);
                    Rec.TestField(Commencement);
                    Rec.TestField(Destination);
                    Rec.TestField("Date of Trip");

                    VarVariant := Rec;
                    IF ApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant) THEN
                        ApprovalsMgmt.OnSendDocForApproval(VarVariant);
                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                Image = Cancel;
                Promoted = true;
                PromotedCategory = Category9;
                ToolTip = 'Executes the Cancel Approval Re&quest action.';
                trigger OnAction()
                var
                    VarVariant: Variant;
                    CustomApprovals: Codeunit "Custom Approvals Codeunit";
                    ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
                begin
                    Rec.TestField(Status, Rec.Status::"Pending Approval");//status must be open.
                    VarVariant := Rec;
                    CustomApprovals.OnCancelDocApprovalRequest(VarVariant);

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

                trigger OnAction()
                var
                    ApprovalsMgt: Codeunit "Approvals Mgmt.";
                begin

                    ApprovalsMgt.OpenApprovalEntriesPage(Rec.RecordId);
                end;
            }
            group("&Customer")
            {
                Caption = '&Customer';
                Image = Customer;
            }
            action("Close Fleet Requsition")
            {
                ApplicationArea = Basic;
                Image = Change;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = FullyApproved;
                ToolTip = 'Executes the Close Fleet Requsition action.';
                trigger OnAction()
                begin
                    if Rec.Status <> Rec.Status::Approved then
                        Error('Only Approved requisitions can be closed');
                    if Confirm('Are you sure you want to close this Fleet Request?', true) = false then begin
                        exit
                    end else
                        Rec.Status := Rec.Status::Closed;
                    Rec."Closed By" := UserId;
                    Rec."Date Closed" := Today;
                    Rec.Modify;
                end;
            }
            action("Open Fleet Requsition")
            {
                ApplicationArea = Basic;
                Image = Change;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = FullyApproved;
                ToolTip = 'Executes the Open Fleet Requsition action.';
                trigger OnAction()
                begin
                    if Rec.Status <> Rec.Status::Closed then
                        Error('Only Closed requisitions can be opened');
                    if Rec."Reason for Reopening" = '' then
                        Error('Make sure you state the reason for reopening this requisition under purpose fast tab');
                    if Confirm('Are you sure you want to open this Fleet Request?', true) = false then begin
                        exit
                    end else
                        Rec.Status := Rec.Status::Open;
                    Rec."Closed By" := UserId;
                    Rec."Date Closed" := Today;
                    Rec.Modify;
                end;
            }
            action("Cancel Fleet Requsition")
            {
                ApplicationArea = Basic;
                Caption = 'Reopen Fleet Requisition';
                Image = Cancel;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = FullyApproved;
                ToolTip = 'Executes the Reopen Fleet Requisition action.';
                trigger OnAction()
                begin
                    if Rec.Status = Rec.Status::Closed then
                        Error('Closed Requisitions cannot be canceled');
                    if Rec."Reason for Reopening" = '' then
                        Error('Make sure you state the reason for caceling this requisition under purpose fast tab');
                    if Confirm('Are you sure you want to cancel this Fleet Request?', true) = false then begin
                        exit
                    end else
                        Rec.Status := Rec.Status::Cancelled;
                    Rec."Closed By" := UserId;
                    Rec."Date Closed" := Today;
                    Rec.Modify;
                end;
            }
            action(Attachments)
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Category9;
                ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                trigger OnAction()
                var
                    DocumentAttachmentDetails: Page "Document Attachment Details";
                    RecRef: RecordRef;
                begin
                    RecRef.GetTable(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.RunModal;
                end;
            }
            action("Create Gate Pass for Request")
            {
                ApplicationArea = Basic;
                Caption = 'Generate Gate Pass';
                Image = Certificate;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                Visible = FullyApproved;
                ToolTip = 'Executes the Generate Gate Pass action.';
                trigger OnAction()
                begin
                    if Confirm('You are about to generate a gate pass document for this request\Would you like to proceed?', true) then begin
                        FleetItems.Reset;
                        FleetItems.SetRange(FleetItems."Requisition Number", Rec."Transport Requisition No");
                        NoOfItems := FleetItems.Count;
                        if NoOfItems > 0 then begin
                        end else
                            Error('No Items have been listed in this requisition, please check and try again');

                        GatePass.Reset;
                        GatePass.SetRange(GatePass."Transport Requisition No", Rec."Transport Requisition No");
                        if GatePass.FindFirst then begin
                            if Confirm('Gate pass ' + GatePass."Transport Requisition No" + ' for this request already exists, would you like to open it?', true) then
                                Page.Run(59137, GatePass);
                        end else begin
                            GatePass.Init;
                            GatePass.TransferFields(Rec);
                            GatePass.Status := GatePass.Status::Open;
                            if GatePass.Insert(true) then begin
                                if Confirm('Gate pass created, would you like to open it?', true) then begin
                                    GatePass.Reset;
                                    GatePass.SetRange(GatePass."Transport Requisition No", Rec."Transport Requisition No");
                                    Page.Run(59137, GatePass);
                                end;
                            end;
                        end;
                    end;
                end;
            }
            group(Approval)
            {
                Caption = 'Approval';
                action(Approve)
                {
                    ApplicationArea = Suite;
                    Caption = 'Approve';
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ToolTip = 'Approve the requested changes.';
                    Visible = PendingApp;

                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        CheckAllocationDetails;
                        //ApprovalsMgmt.ApproveRecordApprovalRequest(RecordId);
                        //MESSAGE('Requision approved...');
                        CurrPage.Close;
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = Suite;
                    Caption = 'Reject';
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    Visible = PendingApp;
                    ToolTip = 'Executes the Reject action.';
                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //ApprovalsMgmt.RejectRecordApprovalRequest(RecordId);
                    end;
                }
                action(Delegate)
                {
                    ApplicationArea = Suite;
                    Caption = 'Delegate';
                    Image = Delegate;
                    Promoted = true;
                    PromotedCategory = Category4;
                    Visible = PendingApp;
                    ToolTip = 'Executes the Delegate action.';
                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        CheckAllocationDetails;
                        //ApprovalsMgmt.DelegateRecordApprovalRequest(RecordId);
                    end;
                }
            }
            action(Testing)
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Executes the Testing action.';
                trigger OnAction()
                begin
                    if Confirm('You are about to generate a gate pass document for this request\Would you like to proceed?', true) then begin
                        VehicleDriverAllocation.Reset;
                        VehicleDriverAllocation.SetRange(VehicleDriverAllocation."Requisition Number", Rec."Transport Requisition No");
                        if VehicleDriverAllocation.Find('-') then begin
                            repeat
                                Trips.Init;
                                Trips.TransferFields(Rec);
                                Trips."Driver Allocated" := VehicleDriverAllocation."Driver Code";
                                Trips."Driver Name" := VehicleDriverAllocation."Driver Name";
                                Trips."Vehicle Allocated" := VehicleDriverAllocation."Vehicle Registration No";
                                Trips.Status := Trips.Status::Open;
                                if not Trips.Insert(true) then
                                    Trips.Modify(true);
                            until VehicleDriverAllocation.Next = 0;
                        end;
                    end;
                end;
            }
            action(TestRec)
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Executes the TestRec action.';
                trigger OnAction()
                begin
                    CreateFuelReq;
                end;
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        updatecontrols();
    end;

    trigger OnAfterGetRecord()
    begin
        // "Purpose of Trip".CREATEINSTREAM(ObjInstr);
        // Obj.READ(ObjInstr);
        // ObjText:=FORMAT(Obj);
    end;

    trigger OnOpenPage()
    begin
        Approved := false;
        NotEditable := true;
        ViewApprovalButton := false;
        if (Rec.Status = Rec.Status::Approved) or (Rec.Status = Rec.Status::"Pending Approval") then
            Approved := true;
        PendingApp := false;
        if Rec.Status = Rec.Status::"Pending Approval" then
            PendingApp := true;
        FullyApproved := false;
        if Rec.Status = Rec.Status::Approved then
            FullyApproved := true;
        // OpenApprovalEntriesExistForCurrUser := false;
        if Rec.Status <> Rec.Status::Open then
            NotEditable := false;
    end;

    var
        TransportReqEditable: Boolean;
        CommencementEditable: Boolean;
        DensitationEditable: Boolean;
        VehicleEditable: Boolean;
        DriverEditable: Boolean;
        DriverNameEditable: Boolean;
        allocatedbyEditable: Boolean;
        DepartmentEditable: Boolean;
        DaterequestedEditable: Boolean;
        TimeRequestedEditable: Boolean;
        DateofTripEditable: Boolean;
        TimeoutEditable: Boolean;
        TimeInEditable: Boolean;
        JourneyEditable: Boolean;
        openingMileageEditable: Boolean;
        closingMileageEditable: Boolean;
        NoofDaysEditable: Boolean;
        loadedEditable: Boolean;
        workticketEditable: Boolean;
        purposeEditable: Boolean;
        authorisedEditable: Boolean;
        lines: Record "Travel Requisition Staff";
        line: Boolean;
        Requestedby: Boolean;
        PositionEditable: Boolean;
        commentsEditable: Boolean;
        RespEditable: Boolean;
        //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        SMSMessages: Record "Committment Entries";
        iEntryNo: Integer;
        HR: Record Employee;
        Fleetmgmtsetup: Record "Fleet Management Setup";
        Emp: Record Employee;
        Email2: Code[100];
        Body: Code[100];
        SMTP: Codeunit "Email Message";
        TOR: BigText;
        Instr: InStream;
        OutStr: OutStream;
        TORText: Text;
        Obj: BigText;
        ObjInstr: InStream;
        ObjOutStr: OutStream;
        ObjText: Text;
        VehicleDriverAllocation: Record "Vehicle Driver Allocation";
        ProgressWindow: Dialog;
        Filename: Text;
        SMTPSetup: Record "Email Account";
        SMTPMail: Codeunit "Email Message";
        ObjCompany: Record "Company Information";
        Header: Text;
        SenderEmail: Text;
        SenderName: Text;
        Approved: Boolean;
        VehicleDrivers: Record "Vehicle Drivers";
        ImprestMemo: Record "Imprest Memo";
        ImprestMemo1: Record "Imprest Memo";
        ProjectMembers: Record "Project Members";
        ProjectMember1: Record "Project Members";
        VehicleDriversAll: Record "Vehicle Driver Allocation";
        NoOfDriv: Integer;
        FleetItems: Record "Fleet Requisition Items";
        NoOfItems: Integer;
        GatePass: Record "Transport Req Gate Pass";
        PendingApp: Boolean;
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        FullyApproved: Boolean;
        CanCancelApprovalForRecord: Boolean;
        OPen: Boolean;
        VehicleAllocation: Record "Fleet Vehicle Allocation";
        NoSeries: Record "Nonstock Item";
        NonStaff: Record "Travel Requisition Non Staff";
        NonDriverAllocation: Record "Non-KeRRA Driver Allocation";
        NoOfNonD: Integer;
        Trips: Record "Transport Requisition Trips";
        NotEditable: Boolean;
        ViewApprovalButton: Boolean;
        FleetSetup: Record "Fleet Management Setup";


    procedure updatecontrols()
    begin

        if Rec.Status = Rec.Status::Open then begin
            TransportReqEditable := false;
            CommencementEditable := true;
            DensitationEditable := true;
            VehicleEditable := false;
            DriverEditable := false;
            allocatedbyEditable := false;
            closingMileageEditable := false;
            DriverNameEditable := false;
            DepartmentEditable := false;
            loadedEditable := false;
            workticketEditable := false;
            DaterequestedEditable := true;
            TimeRequestedEditable := true;
            DateofTripEditable := true;
            TimeoutEditable := true;
            JourneyEditable := true;
            openingMileageEditable := true;
            NoofDaysEditable := true;
            purposeEditable := true;
            NoofDaysEditable := true;
            purposeEditable := true;
            Requestedby := true;
            PositionEditable := true;
            authorisedEditable := false;
            line := true;
            commentsEditable := true;
            RespEditable := true;
        end else
            if Rec.Status = Rec.Status::"Pending Approval" then begin
                TransportReqEditable := false;
                CommencementEditable := false;
                DensitationEditable := false;
                VehicleEditable := true;
                DriverEditable := true;
                allocatedbyEditable := true;
                closingMileageEditable := false;
                DriverNameEditable := true;
                DepartmentEditable := false;
                loadedEditable := false;
                workticketEditable := false;
                DaterequestedEditable := false;
                TimeRequestedEditable := false;
                DateofTripEditable := false;
                TimeoutEditable := false;
                JourneyEditable := false;
                openingMileageEditable := false;
                NoofDaysEditable := false;
                purposeEditable := false;
                NoofDaysEditable := false;
                purposeEditable := false;
                authorisedEditable := false;
                Requestedby := false;
                PositionEditable := false;
                commentsEditable := false;
                RespEditable := false;
                line := false;
            end else
                if Rec.Status = Rec.Status::Approved then begin
                    TransportReqEditable := false;
                    CommencementEditable := false;
                    DensitationEditable := false;
                    VehicleEditable := true;
                    DriverEditable := true;
                    allocatedbyEditable := false;
                    closingMileageEditable := true;
                    DriverNameEditable := false;
                    DepartmentEditable := false;
                    loadedEditable := false;
                    workticketEditable := false;
                    DaterequestedEditable := false;
                    TimeRequestedEditable := false;
                    DateofTripEditable := false;
                    TimeoutEditable := false;
                    TimeInEditable := true;
                    JourneyEditable := false;
                    openingMileageEditable := false;
                    NoofDaysEditable := false;
                    purposeEditable := false;
                    NoofDaysEditable := false;
                    purposeEditable := false;
                    authorisedEditable := false;
                    Requestedby := false;
                    PositionEditable := false;
                    commentsEditable := false;
                    RespEditable := false;

                    line := false;
                end else

                    if Rec.Status = Rec.Status::Rejected then begin
                        TransportReqEditable := false;
                        CommencementEditable := false;
                        DensitationEditable := false;
                        VehicleEditable := false;
                        DriverEditable := false;
                        allocatedbyEditable := false;
                        closingMileageEditable := false;
                        DriverNameEditable := false;
                        DepartmentEditable := false;
                        loadedEditable := false;
                        workticketEditable := false;
                        DaterequestedEditable := false;
                        TimeRequestedEditable := false;
                        DateofTripEditable := false;
                        TimeoutEditable := false;
                        TimeInEditable := false;
                        JourneyEditable := false;
                        openingMileageEditable := false;
                        NoofDaysEditable := false;
                        purposeEditable := false;
                        NoofDaysEditable := false;
                        purposeEditable := false;
                        authorisedEditable := false;
                        line := false;
                        Requestedby := false;
                        PositionEditable := false;
                        commentsEditable := false;
                        RespEditable := false;
                    end
    end;

    local procedure SetControlAppearance()
    var
    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        // OpenApprovalEntriesExistForCurrUser := //ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RecordId);
        // OpenApprovalEntriesExist := //ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
        // CanCancelApprovalForRecord :=  //ApprovalsMgmt.CanCancelApprovalForRecord(RecordId);
    end;

    local procedure CheckAllocationDetails()
    var
        NoOfDrivers: Integer;
        NoOfVehicles: Integer;
        NoOfStaff: Integer;
        NoOfNonStaff: Integer;
        TotalCarryingCap: Integer;
    begin
        VehicleDriverAllocation.Reset;
        VehicleDriverAllocation.SetRange(VehicleDriverAllocation."Requisition Number", Rec."Transport Requisition No");
        NoOfDrivers := VehicleDriverAllocation.Count;

        NonDriverAllocation.Reset;
        NonDriverAllocation.SetRange(NonDriverAllocation."Req No", Rec."Transport Requisition No");
        NoOfNonD := NonDriverAllocation.Count;


        VehicleAllocation.Reset;
        VehicleAllocation.SetRange(VehicleAllocation."Transport Requisition No", Rec."Transport Requisition No");
        VehicleAllocation.CalcSums(VehicleAllocation.Capacity);
        NoOfVehicles := VehicleAllocation.Count;
        TotalCarryingCap := VehicleAllocation.Capacity;

        if NoOfVehicles = 0 then
            Error('Please assign vehicles to this requisition before proceeding');
        if (NoOfDrivers = 0) and (NoOfNonD = 0) then
            Error('Please assign drivers to this requisition before proceeding');
        lines.Reset;
        lines.SetRange(lines."Req No", Rec."Transport Requisition No");
        NoOfStaff := lines.Count;

        NonStaff.Reset;
        NonStaff.SetRange(NonStaff."Req No", Rec."Transport Requisition No");
        NoOfNonStaff := NonStaff.Count;



        if (NoOfStaff + NoOfNonStaff) > TotalCarryingCap then
            Error('The total carrying Capacity of this requisition %1 is less than the traveling persons %2\Please change the vehicle or add another vehicle', TotalCarryingCap, (NoOfStaff + NoOfNonStaff));
        if (NoOfDrivers + NoOfNonD) < NoOfVehicles then
            Error('The total number of drivers allocated must be equial or more than the allocated vehicles');
    end;

    local procedure CreateFuelReq()
    var
        SaveFuelTravel: Record "Fuel & Maintenance Requisition";
        FuelTravel: Record "Fuel Travel Requisition";
        TransportReq: Record "Transport Requisition";
    begin
        FuelTravel.Reset;
        FuelTravel.SetRange(FuelTravel."Req No", Rec."Transport Requisition No");
        if FuelTravel.Find('-') then begin
            repeat
                SaveFuelTravel.Init;
                SaveFuelTravel."Project Name" := FuelTravel."Job Name";
                case FuelTravel."Expense Type" of
                    FuelTravel."expense type"::Fuel:
                        SaveFuelTravel.Type := SaveFuelTravel.Type::Fuel;
                    FuelTravel."expense type"::Maintenance:
                        SaveFuelTravel.Type := SaveFuelTravel.Type::Maintenance;
                end;
                SaveFuelTravel."Project Number" := FuelTravel."Job No";
                SaveFuelTravel."Job Name" := FuelTravel."Job Name";
                SaveFuelTravel."Job No" := FuelTravel."Job No";
                SaveFuelTravel."Job Task" := FuelTravel."Job Task";
                SaveFuelTravel."Job Task Name" := FuelTravel."Job Task Name";
                SaveFuelTravel."Request Date" := Today;
                SaveFuelTravel."Vehicle Reg No" := FuelTravel."Allocated Vehicle Reg No";
                SaveFuelTravel."Prepared By" := UserId;
                SaveFuelTravel."Total Price of Fuel" := FuelTravel."Requested Amount";
                if FuelTravel."Requested Amount" <> 0 then begin
                    if SaveFuelTravel.Insert(true) then;
                end;

            until SaveFuelTravel.Next = 0;
            SendFuelMail(FuelTravel."Requested Amount", FuelTravel."Job No");
        end;
    end;

    local procedure SendFuelMail(var Amount: Decimal; var ProjectCode: Code[30])
    begin

        FleetSetup.Get();
        FleetSetup.TestField(FleetSetup."Project Accountant Email");
        // IF Emp.GET(VehicleDriverAllocation."Driver Code") THEN BEGIN
        Header := 'FUEL REIMBURSEMENT REQUEST' + Rec."Transport Requisition No" + ' ON ' + Format(VehicleDriverAllocation."Date of Trip") + ' TO ' + Format(VehicleDriverAllocation."Trip End Date");

        if SMTPSetup.Get() then begin
            // SenderEmail := SMTPSetup."Email Sender Address";
            // SenderName := SMTPSetup."Email Sender Name";
        end;
        if FleetSetup."Project Accountant Email" <> '' then begin
            // SMTPMail.Create(SenderName, SenderEmail, FleetSetup."Project Accountant Email", Header, '', true);
            // SMTPMail.AppendToBody('<br><br>');
            // SMTPMail.AppendToBody('Dear Sir/Madam');
            // SMTPMail.AppendToBody('<br><br>');
            // SMTPMail.AppendToBody('Kindly prepare a fuel reimbursement of ' + Format(Amount) + ' from Project ' + ProjectCode + ' to Exchequer Transport vote.');// for the month of January 2014');
            // SMTPMail.AppendToBody('<br><br>');
            // SMTPMail.AppendToBody('<h1>Trip Details</h1>');
            // SMTPMail.AppendToBody('<br>');
            // SMTPMail.AppendToBody('Trip requested by : ' + Rec."Employee Name");
            // SMTPMail.AppendToBody('<br>');
            // SMTPMail.AppendToBody('Trip From: ' + Rec.Commencement + ' To ' + Rec.Destination + ' on ' + Format(Rec."Date of Trip") + ' return date will be on ' + Format(Rec."Trip End Date"));
            // SMTPMail.AppendToBody('<br>');
            // //SMTPMail.AppendToBody('Vehicle allocated is : '+"Vehicle Allocated"+' ' +"Non kemri Vehicle Alloc.");
            // SMTPMail.AppendToBody('<br>');
            // SMTPMail.AppendToBody('Kindly prepare adequately');
            // SMTPMail.AppendToBody('<br><br>');
            // SMTPMail.AppendToBody('Thanks & Regards');
            // SMTPMail.AppendToBody('<br><br>');
            // SMTPMail.AppendToBody(SenderName);
            // SMTPMail.AppendToBody('<br><br>');
            // SMTPMail.AppendToBody('<HR>');
            // SMTPMail.AppendToBody('This is a system generated mail.');
            // SMTPMail.AppendToBody('<br><br>');
            // SMTPMail.AppendToBody('All Enquires regarding wages should be sent to HR@kemri.go.ke');
            // SMTPMail.AppendToBody('<br><br>');
            //  SMTPMail.Send;
            Message('Mail sent to %1', FleetSetup."Project Accountant Email");
        end;
        //End email
        // END;
    end;
}

#pragma implicitwith restore

