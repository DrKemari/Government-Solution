#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50119 "pageextension50119" extends "Administrator Role Center"
{
    layout
    {
        addafter(Control1904484608)
        {
            part(Control80; "Team Member Activities")
            {
                ApplicationArea = Basic;
            }
        }
    }
    actions
    {
        addafter("Extended Text")
        {
            action("Employee List")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Employee List';
                RunObject = Page "Employee List-HR";
            }
            action("Student Accounts")
            {
                ApplicationArea = Basic;
                Caption = 'Student Accounts';
                RunObject = Page "Student Accounts";
            }
        }
        addafter(PurchaseAnalysisColumnTmpl)
        {
            action("Signature RegisterV1")
            {
                ApplicationArea = Basic;
                Caption = 'Signature Register';
                Image = "Report";
              //  RunObject = Report "Signature RegisterV1";
            }
            action("Attendance RegisterV1")
            {
                ApplicationArea = Basic;
                Caption = 'Attendance Register';
                Image = "Report";
               // RunObject = Report "Attendance RegisterV1";
            }
            action("Unaplied Bank Amounts Report")
            {
                ApplicationArea = Basic;
                Caption = 'Unaplied Bank Amounts Report';
                Image = "Report";
               // RunObject = Report "Bank Unutilized Amounts Report";
            }
            action("Unutilized Mpesa Amounts")
            {
                ApplicationArea = Basic, Suite;
                Image = "Report";
                //RunObject = Report "MPESAUnutilized Amounts Report";
            }
        }
    }
}

