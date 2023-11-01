#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85055 "Center Allocation"
{
    PageType = Card;
    SourceTable = "Center Booking Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Header No."; Rec."Header No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Header No. field.';
                }
                field(Region; Rec.Region)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region field.';
                }
                field(Zone; Rec.Zone)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Zone field.';
                }
                field("Exam Center Code"; Rec."Exam Center Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Exam Center Code field.';
                }
                field("Center Name"; Rec."Center Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Center Name field.';
                }
                field("Examination Sitting"; Rec."Examination Sitting")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Examination Sitting field.';
                }
                field("Sitting Description"; Rec."Sitting Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sitting Description field.';
                }
                field(Year; Rec.Year)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Year field.';
                }
                field("Maximum Capacity"; Rec."Maximum Capacity")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maximum Capacity field.';
                }
                field("Available Capacity"; Rec."Available Capacity")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Available Capacity field.';
                }
                field("Occupied Capacity"; Rec."Occupied Capacity")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Occupied Capacity field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
            }
            part(Control20; "Center Allocation Lines")
            {
                SubPageLink = "Header No." = field("Header No."),
                              Type = field(Type);
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Suggest Students")
            {
                ApplicationArea = Basic;
                Image = SuggestCapacity;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Suggest Students action.';
                trigger OnAction()
                var
                    TXT001: label 'Proceed to suggest booked students in center %1';
                begin
                    if Confirm(TXT001, true, Rec."Center Name") = true then begin
                        Rec.TestField("Exam Center Code");
                        Examination.SuggestCenterAllocation(Rec);
                    end
                end;
            }
            action("Post Voucher")
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Post Voucher action.';
                trigger OnAction()
                var
                    TXT001: label 'Allocate students to the center %1?';
                    TXT002: label 'The maximum allowable capacity for this center is %1,The occupied %2 is greater';
                begin
                    if Confirm(TXT001, true, Rec."Center Name") = true then begin
                        Rec.CalcFields("Occupied Capacity");
                        if Rec."Maximum Capacity" < Rec."Occupied Capacity" then
                            Error(TXT002, Rec."Maximum Capacity", Rec."Occupied Capacity");
                        Examination.PostCenterAllocation(Rec);
                    end
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Report2;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    Rec.SetRange("Header No.", Rec."Header No.");
                    Report.Run(85002, true, false, Rec);
                end;
            }
            group("Student Application")
            {
                Caption = 'Student Application';
                Image = "Order";
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'Executes the Dimensions action.';
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
                    PromotedCategory = Category4;
                    PromotedIsBig = false;
                    ToolTip = 'Executes the Approvals action.';
                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                    begin
                        ApprovalEntries.Setfilters(Database::"Purchase Header", 14, Rec."Header No.");
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
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Send A&pproval Request action.';
                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
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
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';
                    trigger OnAction()
                    var
                    //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        Message('Approval cancelled');
                    end;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Type := Rec.Type::Allocation;
    end;

    var
        BookingLines: Record "Exam Booking Entries";
        CenterBookingHeader: Record "Center Booking Header";
        CenterBookingLines: Record "Center Booking Lines";
        LineNo: Integer;
        Examination: Codeunit Examination;

    local procedure PostVoucher(CenterBookingHeader: Record "Center Booking Header")
    var
        BookingLines: Record "Center Booking Lines";
        BookingEntries: Record "Center Booking Entries";
        EntryNo: Integer;
    begin
    end;
}

#pragma implicitwith restore

