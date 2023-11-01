#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69093 "Director Payroll Periods"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Directors Payroll PeriodX";
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Starting Date field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("New Fiscal Year"; Rec."New Fiscal Year")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Fiscal Year field.';
                }
                field(Closed; Rec.Closed)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Closed field.';
                }
                field("Close Pay"; Rec."Close Pay")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Close Pay field.';
                }
                field("Date Locked"; Rec."Date Locked")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Locked field.';
                }
                field("Pay Date"; Rec."Pay Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pay Date field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("&Create Period")
            {
                ApplicationArea = Basic;
                Caption = '&Create Period';
                Ellipsis = true;
                Image = CreateYear;
                Promoted = true;
                PromotedCategory = Process;
                //  RunObject = Report "Assign Default Earning/Deducti";
                ToolTip = 'Executes the &Create Period action.';
            }
            action("C&lose Period")
            {
                ApplicationArea = Basic;
                Caption = 'C&lose Period';
                Image = CloseYear;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the C&lose Period action.';
                trigger OnAction()
                begin
                    //IF Rec.Status<>Status::Released THEN
                    // ERROR('Payroll period must be APPROVED before closing. Please check!!');
                    if Rec.Closed = true then
                        Error('Payroll period has already been closed.Please Check!!');

                    if not Confirm('You are about to close the current Pay period are you sure you want to do this?' + //
                    ' Make sure all reports are correct before closing the current pay period, Go ahead?', false) then
                        exit;



                    //  ClosingFunction.GetCurrentPeriod(Rec);
                    //   ClosingFunction.Run;
                end;
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = New;
                    Visible = true;
                    ToolTip = 'Executes the Send A&pproval Request action.';
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = New;
                    Visible = false;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';
                    trigger OnAction()
                    begin
                        ////ApprovalsMgmt.OnCancelPayPeriodApprovalRequest(Rec);
                    end;
                }
                separator(Action10)
                {
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

                        ApprovalEntries.Setfilters(Database::"Payroll PeriodX", 8, Format(Rec."Starting Date"));
                        ApprovalEntries.Run;
                    end;
                }
            }
        }
    }

    var
    // ClosingFunction: Report "Close Directors Pay period";
}

#pragma implicitwith restore

