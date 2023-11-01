#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69218 "HR Employees Factbox"
{
    PageType = CardPart;
    SourceTable = Employee;

    layout
    {
        area(content)
        {
            field(PersonalDetails; PersonalDetails)
            {
                ApplicationArea = Basic;
                Style = StrongAccent;
                StyleExpr = true;
                ToolTip = 'Specifies the value of the PersonalDetails field.';
            }
            field("No."; Rec."No.")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
            }
            field("First Name"; Rec."First Name")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the employee''s first name.';
            }
            field("Middle Name"; Rec."Middle Name")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the employee''s middle name.';
            }
            field("Last Name"; Rec."Last Name")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the employee''s last name.';
            }
            field("E-Mail"; Rec."E-Mail")
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the employee''s private email address.';
            }
            field("Company E-Mail"; Rec."Company E-Mail")
            {
                ApplicationArea = Basic;
                Caption = 'Organization Email';
                ToolTip = 'Specifies the employee''s email address at the company.';
            }
            field(Status; Rec.Status)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the employment status of the employee.';
            }
            group("Leave Balances")
            {
                field("Total Leave Days"; Rec."Total Leave Days")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Leave Days field.';
                }
                field("Annual Leave Days"; Rec."Annual Leave Days")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Annual Leave Days field.';
                }
                field("Compassionate Leave Days"; Rec."Compassionate Leave Days")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Compassionate Leave Days field.';
                }
                field("Maternity Leave Days"; Rec."Maternity Leave Days")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maternity Leave Days field.';
                }
                field("Paternity Leave Days"; Rec."Paternity Leave Days")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Paternity Leave Days field.';
                }
                field("Study Leave Days"; Rec."Study Leave Days")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Study Leave Days field.';
                }
                field("Unpaid Leave"; Rec."Unpaid Leave")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unpaid Leave field.';
                }
                field("Sick Leave"; Rec."Sick Leave")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sick Leave field.';
                }
                field("Non-Fluctuating Allowance"; Rec."Non-Fluctuating Allowance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Non-Fluctuating Allowance field.';
                }
                field("Leave Status"; Rec."Leave Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Leave Status field.';
                }
                field("Terminal Leave"; Rec."Terminal Leave")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Terminal Leave field.';
                }
                field("Sports Leave Acc"; Rec."Sports Leave Acc")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sports Leave Acc field.';
                }
                field("Off Days Acc."; Rec."Off Days Acc.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Off Days Acc. field.';
                }
            }
        }
    }

    actions
    {
    }

    var
        PersonalDetails: label 'Personal Details';
        BankDetails: label 'Bank Details';
        JobDetails: label 'Job Details';
        LeaveDetails: label 'Leave Details';
        LoanDetails: label 'LoanDetails';
}

#pragma implicitwith restore

