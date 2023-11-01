#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85065 "Posted Center Re-Allocation"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
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
                }
                field("Initial Center Code"; Rec."Initial Center Code")
                {
                    ApplicationArea = Basic;
                }
                field("Initial Center Name"; Rec."Initial Center Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Exam Center Code"; Rec."Exam Center Code")
                {
                    ApplicationArea = Basic;
                }
                field("Center Name"; Rec."Center Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Examination Sitting"; Rec."Examination Sitting")
                {
                    ApplicationArea = Basic;
                }
                field("Total Students"; Rec."Total Students")
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

                trigger OnAction()
                var
                    TXT001: label 'Suggest booked students from the center %1?';
                begin
                    if Confirm(TXT001, true, Rec."Initial Center Name") = true then begin
                        Rec.TestField("Exam Center Code");
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
            }
            action("Post Re-Allocation Voucher")
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    TXT001: label 'Re-allocate students from %1 to %2';
                begin
                    if Confirm(TXT001, true, Rec."Initial Center Name", Rec."Center Name") = true then begin

                        Examination.PostCenterReAllocation(Rec);
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

