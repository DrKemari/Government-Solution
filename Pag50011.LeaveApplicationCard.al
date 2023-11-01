page 50011 "Leave Application Card"
{
    Caption = 'Leave Application Card';
    PageType = Card;
    SourceTable = "HR Leave Application";
    
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                
                field("Application Code"; Rec."Application Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Application No field.';
                }
                field("Application Date"; Rec."Application Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Application Date field.';
                }
                field("Annual Leave Type"; Rec."Annual Leave Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Annual Leave Type field.';
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Department Code field.';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Department Name field.';
                }
                field("Directorate Code"; Rec."Directorate Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Directorate Code field.';
                }
                field(Division; Rec.Division)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Division field.';
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("Days Applied"; Rec."Days Applied")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Days Applied field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field("Return Date"; Rec."Return Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Return Date field.';
                }
                field(Reliever; Rec.Reliever)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Reliever Code field.';
                }
                field("Reliever Name"; Rec."Reliever Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Reliever Name field.';
                }
                field(Reason; Rec.Reason)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Reason field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }
}
