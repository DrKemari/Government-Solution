#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85060 "Exam Booking Entries"
{
    ApplicationArea = Basic;
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Exam Booking Entries";
    SourceTableView = where(Cancelled = filter(false),
                            Blocked = filter(false));
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Cancel; Rec.Cancel)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel/Block';
                    ToolTip = 'Select to cancel or to block';
                }
                field("Student Reg No."; Rec."Student Reg No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Student Reg No. field.';
                }
                field("Student Name"; Rec."Student Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Student Name field.';
                }
                field(Examination; Rec.Examination)
                {
                    ApplicationArea = Basic;
                    Caption = 'Examination ';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Examination  field.';
                }
                field("Part"; Rec.Part)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Level field.';
                }
                field(Paper; Rec.Paper)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Paper field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field("Exam Center"; Rec."Exam Center")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Exam Center field.';
                }
                field("Center Name"; Rec."Center Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Center Name field.';
                }
                field("Exam Sitting"; Rec."Exam Sitting")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Exam Sitting field.';
                }
                field(Year; Rec.Year)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Year field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = ChangeResults;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Cancel Paper")
            {
                ApplicationArea = Basic;
                Image = CancelLine;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Cancel Paper action.';
                trigger OnAction()
                var
                    TXT001: label 'Cancel paper %1  from the student booking';
                    ExamBookingEntries: Record "Exam Booking Entries";
                    TXT002: label 'There is no paper to cancel';
                begin
                    if Confirm(TXT001, true, Rec.Paper) = true then begin
                        if Rec.Cancel = true then begin
                            ExaminationCode.BookingCancel(Rec);
                        end else
                            Error(TXT002);
                    end
                end;
            }
            action("Block Paper")
            {
                ApplicationArea = Basic;
                Image = Reject;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Block Paper action.';
                trigger OnAction()
                var
                    TXT001: label 'Are you sure you want to block this entry';
                    TXT002: label 'No paper selected to block';
                begin
                    if Confirm(TXT001, true, Rec.Paper) = true then begin
                        if Rec.Cancel = true then begin
                            ExaminationCode.BookingEntryBlock(Rec);
                        end else
                            Error(TXT002);
                    end
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        UserSetup.Get(UserId);
        if UserSetup."Examination Results Admin" = true then
            ChangeResults := true
        else
            ChangeResults := false;
    end;

    var
        ExaminationCode: Codeunit Examination;
        ExemptionEntries: Record "Exemption Entries";
        TXT001: label 'There is no paper to cancel';
        UserSetup: Record "User Setup";
        ChangeResults: Boolean;
}

#pragma implicitwith restore

