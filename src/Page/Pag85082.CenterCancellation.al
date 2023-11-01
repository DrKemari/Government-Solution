#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85082 "Center Cancellation"
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
                field("Course Id"; Rec."Course Id")
                {
                    ApplicationArea = Basic;
                    Caption = 'Examination  Id';
                    ToolTip = 'Specifies the value of the Examination  Id field.';
                }
                field("Course Description"; Rec."Course Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Examination ';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Examination  field.';
                }
                field("Subject Code"; Rec."Subject Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Subject Code field.';
                }
                field("Subject Name"; Rec."Subject Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Subject Name field.';
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
            part(Control20; "Center Cancellation Lines")
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
            action("Suggest Students")
            {
                ApplicationArea = Basic;
                Image = SuggestCapacity;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Suggest Students action.';
                trigger OnAction()
                begin
                    Rec.TestField("Course Id");
                    BookingLines.Reset;
                    //BookingLines.SETRANGE("Exam Center","Exam Center Code");
                    BookingLines.SetRange("Exam Sitting", Rec."Examination Sitting");
                    if BookingLines.FindSet then begin
                        repeat
                            CenterBookingLines.Reset;
                            if CenterBookingLines.FindLast then begin
                                LineNo := CenterBookingLines."Line No.";
                            end;
                            CenterBookingLines.Init;
                            CenterBookingLines."Line No." := LineNo + 1;
                            CenterBookingLines."Header No." := Rec."Header No.";
                            CenterBookingLines."Student Reg No." := BookingLines."Student Reg No.";
                            CenterBookingLines."Student Name" := BookingLines."Student Name";
                            CenterBookingLines."Course Id" := BookingLines.Examination;
                            CenterBookingLines."Course Description" := Rec."Course Description";
                            CenterBookingLines."Subject Code" := BookingLines.Paper;
                            CenterBookingLines.Validate("Subject Code");
                            CenterBookingLines.Zone := Rec.Zone;
                            CenterBookingLines.Region := Rec.Region;
                            CenterBookingLines."Exam Center Code" := Rec."Exam Center Code";
                            CenterBookingLines."Center Name" := Rec."Center Name";
                            CenterBookingLines.Year := Rec.Year;
                            CenterBookingLines."Maximum Capacity" := Rec."Maximum Capacity";
                            CenterBookingLines."Sitting Cycle" := Rec."Examination Sitting";
                            CenterBookingLines.Insert;
                        until BookingLines.Next = 0;
                    end;
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
                begin
                    Rec.CalcFields("Occupied Capacity");
                    if Rec."Maximum Capacity" < Rec."Occupied Capacity" then
                        Error('The maximum allowable capacity for this course is %1,The occupied %2 is greater', Rec."Maximum Capacity", Rec."Occupied Capacity");
                    PostVoucher(Rec);
                    Rec.Posted := true;
                    Rec.Modify();
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
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
                    Promoted = true;
                    PromotedIsBig = true;
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
                    PromotedCategory = Category9;
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
                    PromotedCategory = Category9;
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
        Rec.Type := Rec.Type::Cancellation;
    end;

    var
        BookingLines: Record "Exam Booking Entries";
        CenterBookingHeader: Record "Center Booking Header";
        CenterBookingLines: Record "Center Booking Lines";
        LineNo: Integer;

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

