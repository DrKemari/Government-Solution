page 50015 "HR Leave Requests"
{
    // ApplicationArea = All;
    Caption = 'HR Leave Requests';
    PageType = Card;
    SourceTable = "HR Leave Allocation Request";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field("No."; Rec."No.")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Date"; Rec."Date")
                {
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Application Type"; Rec."Application Type")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Application Type field.';
                }
                field("Adjustment Type"; Rec."Adjustment Type")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Adjustment Type field.';
                }
                field("Leave Type"; Rec."Leave Type")
                {
                    Editable = false;

                }
                field("Applied Days"; Rec."Applied Days")
                {
                    ToolTip = 'Specifies the value of the Applied Days field.';
                }
                field("Time Off Start";Rec."Time Off Start")
                {

                }
                field("Time Off End";Rec."Time Off End")
                {
                    
                }
                field("Days Approved"; Rec."Days Approved")
                {
                    Editable = false;
                    ToolTip = 'Specifies the value of the Days Approved field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Leave Number"; Rec."Leave Number")
                {
                    ToolTip = 'Specifies the value of the Leave Number field.';
                }
                field(Status; Rec.Status)
                {
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Purpose; Rec.Purpose)
                {
                    Caption = 'Comment';
                    ToolTip = 'Specifies the value of the Purpose field.';
                }
                field("Approvers Comments"; Rec."Approvers Comments")
                {
                    ToolTip = 'Specifies the value of the Approvers Comments field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
            }
        }
    }
}
