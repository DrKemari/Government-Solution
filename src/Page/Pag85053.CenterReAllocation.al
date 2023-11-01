#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85053 "Center Re-Allocation"
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
                field(Multiple; Rec.Multiple)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Multiple field.';
                }
                field("Initial Center Code"; Rec."Initial Center Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Initial Center Code field.';
                }
                field("Initial Center Name"; Rec."Initial Center Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Initial Center Name field.';
                }
                field("Exam Center Code"; Rec."Exam Center Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Exam Center Code field.';
                }
                field("Center Name"; Rec."Center Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Center Name field.';
                }
                field("Examination Sitting"; Rec."Examination Sitting")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Examination Sitting field.';
                }
                field("Rejection Reason"; Rec."Rejection Reason")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rejection Reason field.';
                }
                field("Total Students"; Rec."Total Students")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Students field.';
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
            part(Control20; "Center Re-Allocation Lines")
            {
                SubPageLink = "Header No." = field("Header No.");
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Copy Entries")
            {
                ApplicationArea = Basic;
                Image = SuggestCapacity;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Copy Entries action.';
                trigger OnAction()
                var
                    TXT001: label 'Suggest booked students from the center %1?';
                begin
                    if Confirm(TXT001, true, Rec."Initial Center Name") = true then begin
                        Rec.TestField("Exam Center Code");
                        Rec.TestField("Examination Sitting");
                        Examination.SuggestCenterEntries(Rec);
                    end
                end;
            }
            action("Center Re-Allocation Entries")
            {
                ApplicationArea = Basic;
                Caption = 'Center Re-Allocation Entries';
                Image = EntriesList;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;
                RunObject = Page "Center Re-Allocation Entries";
                RunPageLink = "Re-Allocation Voucher No." = field("Header No.");
                ToolTip = 'Executes the Center Re-Allocation Entries action.';
            }
            action("Post Re-Allocation Voucher")
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Post Re-Allocation Voucher action.';
                trigger OnAction()
                var
                    TXT001: label 'Re-allocate students from %1 to %2';
                begin
                    if Confirm(TXT001, true, Rec."Initial Center Name", Rec."Center Name") = true then begin
                        Rec.TestField("Examination Sitting");
                        Examination.PostCenterReAllocation(Rec);
                    end
                end;
            }
            action("Reject Request")
            {
                ApplicationArea = Basic;
                Image = Reject;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Reject Request action.';
                trigger OnAction()
                var
                    TXT001: label 'Reject the request?';
                begin
                    if Confirm(TXT001, true, Rec."Initial Center Name", Rec."Center Name") = true then begin
                        Rec.TestField("Rejection Reason");
                        Examination.RejectCenterReAllocation(Rec);
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
        Rec.Type := Rec.Type::"Re-Allocation";
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
        CenterBookingLines.Reset;
        CenterBookingLines.SetRange("Header No.", CenterBookingHeader."Header No.");
        if CenterBookingLines.FindSet then begin
            repeat
                BookingEntries.Reset;
                if BookingEntries.FindLast then begin
                    EntryNo := BookingEntries."Line No.";
                end;
                BookingEntries.Init;
                BookingEntries."Line No." := EntryNo + 1;
                BookingEntries."Header No." := CenterBookingHeader."Header No.";
                BookingEntries."Exam Center Code" := CenterBookingHeader."Exam Center Code";
                BookingEntries."Center Name" := CenterBookingHeader."Center Name";
                BookingEntries."Student Reg No." := CenterBookingLines."Student Reg No.";
                BookingEntries."Student Name" := CenterBookingLines."Student Name";
                BookingEntries."Examination Id" := CenterBookingLines."Course Id";
                BookingEntries.Year := CenterBookingLines.Year;
                BookingEntries."Examination Description" := CenterBookingLines."Course Description";
                BookingEntries."Examination Sitting" := CenterBookingLines."Sitting Cycle";
                BookingEntries.Insert;
            until
          CenterBookingLines.Next = 0;
        end;
        Message('Booking Voucher %1,posted succesfully', CenterBookingHeader."Header No.");
    end;
}

#pragma implicitwith restore

