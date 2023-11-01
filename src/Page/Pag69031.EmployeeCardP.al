#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69031 "Employee Card-P"
{
    Caption = 'Employee Card';
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = Employee;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                    trigger OnAssistEdit()
                    begin
                        /*IF AssistEdit(xRec) THEN
                          CurrPage.UPDATE;*/ //commented by morris during upgrade

                    end;
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employee''s job title.';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employee''s first name.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employee''s last name.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Middle Name/Initials';
                    ToolTip = 'Specifies the employee''s middle name.';
                }
                field(Initials; Rec.Initials)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employee''s initials.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employee''s address.';
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies additional address information.';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the postal code.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the city of the address.';
                }
                field("Employee Job Type"; Rec."Employee Job Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee Job Type field.';
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the country/region of the address.';
                }
                field(County; Rec.County)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the county of the employee.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employee''s telephone number.';
                }
                field("Search Name"; Rec."Search Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies an alternate name that you can use to search for the record in question when you cannot remember the value in the Name field.';
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employee''s gender.';
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies when this record was last modified.';
                }
                field(Rank; Rec.Rank)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rank field.';
                }
                field("Employee Posting Group"; Rec."Employee Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employee''s type to link business transactions made for the employee with the appropriate account in the general ledger.';
                }
                field("Posting Group"; Rec."Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting Group field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Department Name field.';
                }
                field(Balance; Rec.Balance)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Balance field.';
                }
            }
            group("Payroll Details")
            {
                Caption = 'Payroll Details';
                field("Pays tax?"; Rec."Pays tax?")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pays tax? field.';
                }
                field("Payroll Pay Mode"; Rec."Payroll Pay Mode")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payroll Pay Mode field.';
                }
                field("P.I.N"; Rec."P.I.N")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the P.I.N field.';
                }
                field("N.H.I.F No"; Rec."N.H.I.F No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the N.H.I.F No field.';
                }
                field("Social Security No."; Rec."Social Security No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'N.S.S.F No.';
                    ToolTip = 'Specifies the social security number of the employee.';
                }
                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ID Number field.';
                }
                field("Taxable Allowance"; Rec."Taxable Allowance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Taxable Allowance field.';
                }
                field("Total Allowances"; Rec."Total Allowances")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Allowances field.';
                }
                field("Total Deductions"; Rec."Total Deductions")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Deductions field.';
                }
                field("Total Gratuity Amount"; Rec."Total Gratuity Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Gratuity Amount field.';
                }
                field("Salary Scale"; Rec."Salary Scale")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Salary Scale field.';
                }
                field(Present; Rec.Present)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Present field.';
                }
                field(Halt; Rec.Halt)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Halt field.';
                }
                field(Previous; Rec.Previous)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Previous field.';
                }
                field("Job No"; Rec."Job No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Project';
                    ToolTip = 'Specifies the value of the Project field.';
                }
                field("Job Task No"; Rec."Job Task No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Task No field.';
                }
                field(Basic; Rec.Basic)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Basic field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field("Special Pension"; Rec."Special Pension")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Special Pension field.';
                }
                group("Primary Bank Details")
                {
                    Caption = 'Primary Bank Details';
                    field("Primary Bank %"; Rec."Primary Bank %")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Primary Bank % field.';
                    }
                    field("Bank Account Number"; Rec."Bank Account Number")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Bank Account Number field.';
                    }
                    field("Employee's Bank"; Rec."Employee's Bank")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Employee''s Bank field.';
                    }
                    field("Bank Name"; Rec."Bank Name")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Bank Name field.';
                    }
                    field("Bank Branch"; Rec."Bank Branch")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Bank Branch field.';
                    }
                    field("Bank Branch Name"; Rec."Bank Branch Name")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Bank Branch Name field.';
                    }
                }
                group("Bank 2")
                {
                    Caption = 'Bank 2';
                    field("Bank 2 %"; Rec."Bank 2 %")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Bank 2 % field.';
                    }
                    field("Employee's Bank 2"; Rec."Employee's Bank 2")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Employee''s Bank 2 field.';
                    }
                    field("Bank Name 2"; Rec."Bank Name 2")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Bank Name 2 field.';
                    }
                    field("Bank Branch 2"; Rec."Bank Branch 2")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Bank Branch 2 field.';
                    }
                    field("Bank Branch Name 2"; Rec."Bank Branch Name 2")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Bank Branch Name 2 field.';
                    }
                    field("Bank Account No. 2"; Rec."Bank Account No. 2")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Bank Account No. field.';
                    }
                }
            }
            group(Communication)
            {
                Caption = 'Communication';
                field(Extension; Rec.Extension)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employee''s telephone extension.';
                }
                field("Mobile Phone No."; Rec."Mobile Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employee''s private telephone number.';
                }
                field(Pager; Rec.Pager)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employee''s pager number.';
                }
                field("Phone No.2"; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employee''s telephone number.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employee''s private email address.';
                }
                field("Company E-Mail"; Rec."Company E-Mail")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employee''s email address at the company.';
                }
                field("Send Payslip By E-mail?"; Rec."Send Payslip By E-mail?")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Send Payslip By E-mail? field.';
                }
                field("Alt. Address Code"; Rec."Alt. Address Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies a code for an alternate address.';
                }
                field("Alt. Address Start Date"; Rec."Alt. Address Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the starting date when the alternate address is valid.';
                }
                field("Alt. Address End Date"; Rec."Alt. Address End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the last day when the alternate address is valid.';
                }
            }
            group(Administration)
            {
                Caption = 'Administration';
                field("Employment Date"; Rec."Employment Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the date when the employee began to work for the company.';
                }
                field("Employement Terms"; Rec."Employement Terms")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employement Terms field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employment status of the employee.';
                }
                field("Inactive Date"; Rec."Inactive Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the date when the employee became inactive, due to disability or maternity leave, for example.';
                }
                field("Cause of Inactivity Code"; Rec."Cause of Inactivity Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies a code for the cause of inactivity by the employee.';
                }
                field("Termination Date"; Rec."Termination Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Exit Date';
                    ToolTip = 'Specifies the date when the employee was terminated, due to retirement or dismissal, for example.';
                }
                // field("Reason for termination Code"; "Reason for termination Code")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Reason for Exit Code';
                //     ToolTip = 'Specifies the value of the Reason for Exit Code field.';
                // }
                field("Retirement Date"; Rec."Retirement Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Retirement Date field.';
                }
                field("Emplymt. Contract Code"; Rec."Emplymt. Contract Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employment contract code for the employee.';
                }
                field("Statistics Group Code"; Rec."Statistics Group Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies a statistics group code to assign to the employee for statistical purposes.';
                }
                field("Resource No."; Rec."Resource No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies a resource number for the employee.';
                }
                field("Research Center"; Rec."Research Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Research Center field.';
                }
            }
            group(Personal)
            {
                Caption = 'Personal';
                field("Birth Date"; Rec."Birth Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employee''s date of birth.';
                }
                field("Union Code"; Rec."Union Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employee''s labor union membership code.';
                }
                field("Union Membership No."; Rec."Union Membership No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employee''s labor union membership number.';
                }
            }
            group("Leave Details")
            {
                Caption = 'Leave Details';
                field("Leave Days B/F"; Rec."Reimbursed Leave Days")
                {
                    ApplicationArea = Basic;
                    Caption = 'Leave Days B/F';
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Leave Days B/F field.';
                }
                field(HOD; Rec.HOD)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the HOD field.';
                }
                field("Allocated Leave Days"; Rec."Allocated Leave Days")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Allocated Leave Days field.';
                }
                field("Total (Leave Days)"; Rec."Total (Leave Days)")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Total (Leave Days) field.';
                }
                field("Total Leave Taken"; Rec."Total Leave Taken")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Total Leave Taken field.';
                }
                field("Leave Outstanding Bal"; Rec."Leave Outstanding Bal")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Leave Outstanding Bal field.';
                }
                field("Leave Balance"; Rec."Leave Balance")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Leave Balance field.';
                }
                field("Acrued Leave Days"; Rec."Acrued Leave Days")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Acrued Leave Days field.';
                }
                field("Cash per Leave Day"; Rec."Cash per Leave Day")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Cash per Leave Day field.';
                }
                field("Cash - Leave Earned"; Rec."Cash - Leave Earned")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Cash - Leave Earned field.';
                }
                field("Leave Status"; Rec."Leave Status")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Leave Status field.';
                }
                field("Leave Type Filter"; Rec."Leave Type Filter")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Leave Type Filter field.';
                }
                field("Leave Period Filter"; Rec."Leave Period Filter")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Leave Period Filter field.';
                }
                field("On Leave"; Rec."On Leave")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the On Leave field.';
                }
            }
            group("Update Employee Details")
            {
                Caption = 'Update Employee Details';
                field(overtimehrs; overtimehrs)
                {
                    ApplicationArea = Basic;
                    Caption = 'Overtime 1.5';
                    ToolTip = 'Specifies the value of the Overtime 1.5 field.';
                }
                field(overtimehrs2; overtimehrs2)
                {
                    ApplicationArea = Basic;
                    Caption = 'Overtime 2.0';
                    ToolTip = 'Specifies the value of the Overtime 2.0 field.';
                }
                field(lostdays2; lostdays2)
                {
                    ApplicationArea = Basic;
                    Caption = 'Lost Days';
                    ToolTip = 'Specifies the value of the Lost Days field.';
                }
                field(leavedays; leavedays)
                {
                    ApplicationArea = Basic;
                    Caption = 'Leave Days';
                    ToolTip = 'Specifies the value of the Leave Days field.';
                }
                field("Claim Limit"; Rec."Claim Limit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Claim Limit field.';
                }
                field("insurance Relief2"; "insurance Relief2")
                {
                    ApplicationArea = Basic;
                    Caption = 'Insurance Relief';
                    ToolTip = 'Specifies the value of the Insurance Relief field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                Visible = false;
                ApplicationArea = Basic;
            }
            systempart(Control1905767507; Notes)
            {
                Visible = true;
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("E&mployee")
            {
                Caption = 'E&mployee';
                Image = Employee;
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Human Resource Comment Sheet";
                    RunPageLink = "Table Name" = const(Employee),
                                  "No." = field("No.");
                    ToolTip = 'Executes the Co&mments action.';
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    RunObject = Page "Default Dimensions";
                    RunPageLink = "Table ID" = const(5200),
                                  "No." = field("No.");
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'Executes the Dimensions action.';
                }
                action("&Picture")
                {
                    ApplicationArea = Basic;
                    Caption = '&Picture';
                    Image = Picture;
                    RunObject = Page "Employee Picture";
                    RunPageLink = "No." = field("No.");
                    ToolTip = 'Executes the &Picture action.';
                }
                action("&Alternative Addresses")
                {
                    ApplicationArea = Basic;
                    Caption = '&Alternative Addresses';
                    Image = Addresses;
                    RunObject = Page "Alternative Address List";
                    RunPageLink = "Employee No." = field("No.");
                    ToolTip = 'Executes the &Alternative Addresses action.';
                }
                action("&Relatives")
                {
                    ApplicationArea = Basic;
                    Caption = '&Relatives';
                    Image = Relatives;
                    RunObject = Page "Employee Relatives";
                    RunPageLink = "Employee No." = field("No.");
                    ToolTip = 'Executes the &Relatives action.';
                }
                action("Mi&sc. Article Information")
                {
                    ApplicationArea = Basic;
                    Caption = 'Mi&sc. Article Information';
                    Image = Filed;
                    RunObject = Page "Misc. Article Information";
                    RunPageLink = "Employee No." = field("No.");
                    ToolTip = 'Executes the Mi&sc. Article Information action.';
                }
                action("&Confidential Information")
                {
                    ApplicationArea = Basic;
                    Caption = '&Confidential Information';
                    Image = Lock;
                    RunObject = Page "Confidential Information";
                    RunPageLink = "Employee No." = field("No.");
                    ToolTip = 'Executes the &Confidential Information action.';
                }
                action("Q&ualifications")
                {
                    ApplicationArea = Basic;
                    Caption = 'Q&ualifications';
                    Image = Certificate;
                    RunObject = Page "Employee Qualifications";
                    RunPageLink = "Employee No." = field("No.");
                    ToolTip = 'Executes the Q&ualifications action.';
                }
                action("A&bsences")
                {
                    ApplicationArea = Basic;
                    Caption = 'A&bsences';
                    Image = Absence;
                    RunObject = Page "Employee Absences";
                    RunPageLink = "Employee No." = field("No.");
                    ToolTip = 'Executes the A&bsences action.';
                }
                separator(Action23)
                {
                }
                action("Absences by Ca&tegories")
                {
                    ApplicationArea = Basic;
                    Caption = 'Absences by Ca&tegories';
                    Image = AbsenceCategory;
                    RunObject = Page "Empl. Absences by Categories";
                    RunPageLink = "No." = field("No."),
                                  "Employee No. Filter" = field("No.");
                    ToolTip = 'Executes the Absences by Ca&tegories action.';
                }
                action("Misc. Articles &Overview")
                {
                    ApplicationArea = Basic;
                    Caption = 'Misc. Articles &Overview';
                    Image = FiledOverview;
                    RunObject = Page "Misc. Articles Overview";
                    ToolTip = 'Executes the Misc. Articles &Overview action.';
                }
                action("Co&nfidential Info. Overview")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&nfidential Info. Overview';
                    Image = ConfidentialOverview;
                    RunObject = Page "Confidential Info. Overview";
                    ToolTip = 'Executes the Co&nfidential Info. Overview action.';
                }
                separator(Action61)
                {
                }
                action("Online Map")
                {
                    ApplicationArea = Basic;
                    Caption = 'Online Map';
                    Image = Map;
                    ToolTip = 'Executes the Online Map action.';
                    trigger OnAction()
                    begin
                        Rec.DisplayMap;
                    end;
                }
            }
        }
        area(creation)
        {
            action("Assign Default Earn/Ded")
            {
                ApplicationArea = Basic;
                Caption = 'Assign Default Earn/Ded';
                Ellipsis = true;
                Image = Default;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Assign Default Earn/Ded action.';
                trigger OnAction()
                var
                    StdGenJnl: Record "Standard General Journal";
                begin
                    /*
                    PayPeriod.RESET;
                    PayPeriod.SETRANGE(PayPeriod.Closed,FALSE);
                    IF PayPeriod.FIND('-') THEN  BEGIN
                     Earnings.RESET;
                     Earnings.SETRANGE(Earnings."Applies to All",TRUE);
                     Earnings.SETRANGE(Earnings."Basic Salary Code",TRUE);
                    { IF Earnings.FIND('-') THEN BEGIN
                      REPEAT
                       AssMatrix.INIT;
                       AssMatrix."Employee No":="No.";
                       AssMatrix.Type:=AssMatrix.Type::Payment;
                       AssMatrix."Payroll Period":=PayPeriod."Starting Date";
                       AssMatrix."Department Code":="Global Dimension 1 Code";
                       AssMatrix.Code:=Earnings.Code;
                       AssMatrix.VALIDATE(Code);
                    
                       SalaryPointer.RESET;
                    
                       SalaryPointer.SETRANGE(SalaryPointer."Salary Pointer",Present);
                       IF SalaryPointer.FIND('-') THEN
                       BEGIN
                       AssMatrix.Amount:=SalaryPointer."Basic Pay";
                       AssMatrix.VALIDATE(Amount);
                       //MESSAGE('%1',SalaryPointer."Basic Pay");
                       END
                       ELSE
                       ERROR('Please select the present salary pointer for this employee');
                    
                       AssMatrix.INSERT;
                      UNTIL Earnings.NEXT=0;
                      END;}
                    
                    
                    
                     Earnings.RESET;
                     Earnings.SETRANGE(Earnings."Applies to All",TRUE);
                     Earnings.SETRANGE(Earnings."Basic Salary Code",FALSE);
                     IF Earnings.FIND('-') THEN BEGIN
                      REPEAT
                       AssMatrix.INIT;
                       AssMatrix."Employee No":="No.";
                       AssMatrix.Type:=AssMatrix.Type::Payment;
                       AssMatrix."Payroll Period":=PayPeriod."Starting Date";
                       AssMatrix."Department Code":="Global Dimension 1 Code";
                       AssMatrix.Code:=Earnings.Code;
                       AssMatrix.VALIDATE(Code);
                       IF NOT AssMatrix.GET(AssMatrix."Employee No",AssMatrix.Type,AssMatrix.Code,AssMatrix."Payroll Period") THEN
                       AssMatrix.INSERT;
                      UNTIL Earnings.NEXT=0;
                      END;
                    
                    
                    
                    
                    
                    
                    
                      // Deducton
                     Ded.RESET;
                     Ded.SETRANGE("Applies to All",TRUE);
                    
                     IF Ded.FIND('-') THEN BEGIN
                      REPEAT
                       AssMatrix.INIT;
                       AssMatrix."Employee No":="No.";
                       AssMatrix.Type:=AssMatrix.Type::Deduction;
                       AssMatrix."Payroll Period":=PayPeriod."Starting Date";
                       AssMatrix."Department Code":="Global Dimension 1 Code";
                       AssMatrix.Code:=Ded.Code;
                       AssMatrix.VALIDATE(Code);
                       IF NOT AssMatrix.GET(AssMatrix."Employee No",AssMatrix.Type,AssMatrix.Code,AssMatrix."Payroll Period") THEN
                       AssMatrix.INSERT;
                      UNTIL Ded.NEXT=0;
                      END;
                    
                    END;
                    */
                    // if Confirm(Text000, false) then
                    //    PayrollRun.DefaultAssignment(Rec);

                end;
            }
            action("Assign Earnings")
            {
                ApplicationArea = Basic;
                Caption = 'Assign Earnings';
                Ellipsis = true;
                Image = Payment;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Payments & Deductions";
                RunPageLink = "Employee No" = field("No."),
                              Type = const(Payment),
                              Closed = const(false);
                ToolTip = 'Executes the Assign Earnings action.';
                trigger OnAction()
                var
                    StdGenJnl: Record "Standard General Journal";
                begin
                end;
            }
            action("Assign Deductions")
            {
                ApplicationArea = Basic;
                Caption = 'Assign Deductions';
                Ellipsis = true;
                Image = Cost;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Payments & Deductions";
                RunPageLink = "Employee No" = field("No."),
                              Type = const(Deduction),
                              Closed = const(false);
                ToolTip = 'Executes the Assign Deductions action.';
                trigger OnAction()
                var
                    StdGenJnl: Record "Standard General Journal";
                begin
                    //IM.GenerateAcquisitionJournal(Rec);
                end;
            }
            action("&Generate Payslip")
            {
                ApplicationArea = Basic;
                Caption = '&Generate Payslip';
                Ellipsis = true;
                Image = "Report";
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the &Generate Payslip action.';
                trigger OnAction()
                var
                    StdGenJnl: Record "Standard General Journal";
                begin
                    //IM.GenerateAcquisitionJournal(Rec);

                    PayPeriod.Reset;
                    PayPeriod.SetRange(Closed, false);
                    if PayPeriod.Find('-') then
                        CurrentMonth := PayPeriod."Starting Date";
                    EmployeeRec.SetRange(EmployeeRec."No.", Rec."No.");
                    EmployeeRec.SetRange(EmployeeRec."Pay Period Filter", CurrentMonth);
                    Report.Run(89028, true, false, EmployeeRec);
                end;
            }
            action("&Employee Statement")
            {
                ApplicationArea = Basic;
                Caption = '&Employee Statement';
                Ellipsis = true;
                Image = "Report";
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the &Employee Statement action.';
                trigger OnAction()
                var
                    StdGenJnl: Record "Standard General Journal";
                begin
                    EmployeeRec.SetRange(EmployeeRec."No.", Rec."No.");
                    Report.Run(57016, true, false, EmployeeRec);
                end;
            }
            separator(Action1000000046)
            {
            }
            action("&Run Emp Payroll")
            {
                ApplicationArea = Basic;
                Caption = '&Run Emp Payroll';
                Ellipsis = true;
                Image = Calculate;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the &Run Emp Payroll action.';
                trigger OnAction()
                var
                    StdGenJnl: Record "Standard General Journal";
                begin
                    //IM.GenerateRedemptionJournal(Rec);

                    PayPeriod.Reset;
                    PayPeriod.SetRange(PayPeriod.Closed, false);
                    if PayPeriod.Find('-') then
                        CurrentMonth := PayPeriod."Starting Date";
                    EmployeeRec.SetRange("No.", Rec."No.");
                    EmployeeRec.SetRange("Pay Period Filter", CurrentMonth);

                    Report.Run(69004, true, false, EmployeeRec);
                end;
            }
            action("Update1.5")
            {
                ApplicationArea = Basic;
                Caption = 'Update 1.5';
                ToolTip = 'Executes the Update 1.5 action.';
                trigger OnAction()
                begin

                    //--------------if values are empty------------
                    if overtimehrs2 = 0 then begin
                        //overtimehrs2:="Overtime2.0";
                    end;

                    //end of if values are empty---------------------




                    assm.SetFilter(assm."Employee No", Rec."No.");
                    assm.SetFilter(assm.Closed, 'No');
                    assm.SetFilter(assm.Code, 'E001');

                    if assm.FindSet then begin
                        repeat
                            i += 1;
                        until assm.Next = 0;
                    end;
                    //MESSAGE('Basic: %1',assm.Amount);
                    OT := (assm.Amount / 22) / 8 * 1.5 * overtimehrs;
                    BA := assm.Amount;


                    //---------------------------------------------------------------------Overtime DAYS 1.5 --------------------------
                    assm.Reset;
                    assm.SetFilter(assm."Employee No", Rec."No.");
                    assm.SetFilter(assm.Closed, 'No');
                    assm.SetFilter(assm.Code, 'E007');

                    if assm.FindSet then begin
                        repeat
                            i += 1;
                        until assm.Next = 0;
                    end;

                    if not (assm.FindSet) then begin
                        assm."Employee No" := Rec."No.";
                        assm.Type := 0;
                        assm.Code := 'E007';
                        assm.Description := 'Overtime(1.5)';
                        assm.Amount := 0;
                        assm.Insert;
                    end;

                    //MESSAGE('Existing Overtime 1.5: %1',assm.Amount);
                    assm.Amount := OT;
                    assm."Hours 1.5" := overtimehrs;
                    assm.Modify;
                    //MESSAGE('Leave Pay: %1',assm.Amount);
                    Message('Updated as:\Basic Pay: %1\Overtime 1.5: %2', BA, OT);
                    //}
                end;
            }
            action("Update2.0")
            {
                ApplicationArea = Basic;
                Caption = 'Update 2.0';
                ToolTip = 'Executes the Update 2.0 action.';
                trigger OnAction()
                begin

                    //--------------if values are empty------------

                    //end of if values are empty---------------------




                    assm.SetFilter(assm."Employee No", Rec."No.");
                    assm.SetFilter(assm.Closed, 'No');
                    assm.SetFilter(assm.Code, 'E001');

                    if assm.FindSet then begin
                        repeat
                            i += 1;
                        until assm.Next = 0;
                    end;
                    //MESSAGE('Basic: %1',assm.Amount);
                    OT2 := (assm.Amount / 22) / 8 * 2 * overtimehrs2;
                    BA := assm.Amount;


                    //---------------------------------------------------------------------Overtime DAYS 2.0 --------------------------
                    assm.Reset;
                    assm.SetFilter(assm."Employee No", Rec."No.");
                    assm.SetFilter(assm.Closed, 'No');
                    assm.SetFilter(assm.Code, 'E009');

                    if assm.FindSet then begin
                        repeat
                            i += 1;
                        until assm.Next = 0;
                    end;

                    if not (assm.FindSet) then begin
                        assm."Employee No" := Rec."No.";
                        assm.Type := 0;
                        assm.Code := 'E009';
                        assm.Description := 'Overtime(2.0)';
                        assm.Amount := 0;
                        assm.Insert;
                    end;

                    //MESSAGE('Existing Overtime 2.0: %1',assm.Amount);
                    assm.Amount := OT2;
                    assm."Hours 2.0" := overtimehrs2;
                    assm.Modify;


                    //MESSAGE('Leave Pay: %1',assm.Amount);
                    Message('Updated as:\Basic Pay: %1\Overtime 2.0: %2: %5', BA, OT2);
                    //}
                end;
            }
            action(UpdateLeave)
            {
                ApplicationArea = Basic;
                Caption = 'Update Leave';
                ToolTip = 'Executes the Update Leave action.';
                trigger OnAction()
                begin





                    assm.SetFilter(assm."Employee No", Rec."No.");
                    assm.SetFilter(assm.Closed, 'No');
                    assm.SetFilter(assm.Code, 'E001');

                    if assm.FindSet then begin
                        repeat
                            i += 1;
                        until assm.Next = 0;
                    end;
                    //MESSAGE('Basic: %1',assm.Amount);
                    LE := (assm.Amount / 22) * leavedays;
                    BA := assm.Amount;


                    //-----------------------------------------------------------------Leave Days-----------------------------------
                    assm.Reset;
                    assm.SetFilter(assm."Employee No", Rec."No.");
                    assm.SetFilter(assm.Closed, 'No');
                    assm.SetFilter(assm.Code, 'E008');

                    if assm.FindSet then begin
                        repeat
                            i += 1;
                        until assm.Next = 0;
                    end;

                    if not (assm.FindSet) then begin
                        assm."Employee No" := Rec."No.";
                        assm.Type := 0;
                        assm.Code := 'E008';
                        assm.Description := 'Leave Pay';
                        assm.Amount := 0;
                        assm.Insert;
                    end;


                    //MESSAGE('Existing Leave Pay: %1',assm.Amount);
                    assm.Amount := LE;
                    assm."Leave Days" := leavedays;
                    assm.Modify;


                    //MESSAGE('Leave Pay: %1',assm.Amount);
                    Message('Updated as:\Basic Pay: %1\Leave Pay: %2', BA, LE);
                    //}
                end;
            }
            action(UpdateLostDays)
            {
                ApplicationArea = Basic;
                Caption = 'Update Lost Days';
                ToolTip = 'Executes the Update Lost Days action.';
                trigger OnAction()
                begin





                    assm.SetFilter(assm."Employee No", Rec."No.");
                    assm.SetFilter(assm.Closed, 'No');
                    assm.SetFilter(assm.Code, 'E001');

                    if assm.FindSet then begin
                        repeat
                            i += 1;
                        until assm.Next = 0;
                    end;
                    //MESSAGE('Basic: %1',assm.Amount);
                    LD := -(assm.Amount / 22) * lostdays2;
                    BA := assm.Amount;

                    //---------------------------------------------------------------------Lost Days --------------------------
                    assm.Reset;
                    assm.SetFilter(assm."Employee No", Rec."No.");
                    assm.SetFilter(assm.Closed, 'No');
                    assm.SetFilter(assm.Code, 'E014');

                    if assm.FindSet then begin
                        repeat
                            i += 1;
                        until assm.Next = 0;
                    end;

                    if not (assm.FindSet) then begin
                        assm."Employee No" := Rec."No.";
                        assm.Type := 0;
                        assm.Code := 'E014';
                        assm.Description := 'Lost Days';
                        assm.Amount := 0;
                        assm.Insert;
                    end;

                    //MESSAGE('Existing Overtime 2.0: %1',assm.Amount);
                    assm.Amount := LD;
                    assm.Lostdays := lostdays2;
                    assm.Modify;


                    //MESSAGE('Leave Pay: %1',assm.Amount);
                    Message('Updated as:\Basic Pay: %1\Lost Days: %2', BA, LD);
                    //}
                end;
            }
            action(UpdateInsurance)
            {
                ApplicationArea = Basic;
                Caption = 'Update Insurance';
                ToolTip = 'Executes the Update Insurance action.';
                trigger OnAction()
                begin





                    //MESSAGE('Basic: %1',assm.Amount);
                    "insurance Reliefcalc" := 0.15 * "insurance Relief2";

                    //---------------------------------------------------------------------Insurance Premium --------------------------
                    assm.Reset;
                    assm.SetFilter(assm."Employee No", Rec."No.");
                    assm.SetFilter(assm.Closed, 'No');
                    assm.SetFilter(assm.Code, 'E016');

                    if assm.FindSet then begin
                        repeat
                            i += 1;
                        until assm.Next = 0;
                    end;

                    if not (assm.FindSet) then begin
                        assm."Employee No" := Rec."No.";
                        assm.Type := 0;
                        assm.Code := 'E016';
                        assm.Description := 'Insurance Relief';
                        assm.Amount := 0;
                        assm.Insert;
                    end;

                    //MESSAGE('Existing Overtime 2.0: %1',assm.Amount);
                    assm.Amount := "insurance Reliefcalc";

                    assm.Modify;


                    //MESSAGE('Leave Pay: %1',assm.Amount);
                    Message('Updated as:\Insurance Premium: %1\Insurance Relief: %2', "insurance Relief2", "insurance Reliefcalc");
                    //}
                end;
            }
            action("Transfer Employee")
            {
                ApplicationArea = Basic;
                Image = HRSetup;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Transfer Employee action.';
                trigger OnAction()
                begin
                    if Dialog.Confirm('Are you sure you want to stransfer %1 ?', true, Rec."First Name" + ' ' + Rec."Last Name") then begin
                        Emp.Reset;
                        Emp.SetRange("No.", Rec."No.");
                        Report.Run(69120, true, true, Emp);
                        CurrPage.Close;
                        EmpTrans.Reset;
                        EmpTrans.SetRange("Employee No", Rec."No.");
                        Page.Run(69057, EmpTrans);
                    end;
                end;
            }
            action("Transfer History")
            {
                ApplicationArea = Basic;
                Image = History;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Transfer History action.';
                trigger OnAction()
                begin
                    EmpTrans.Reset;
                    EmpTrans.SetRange("Employee No", Rec."No.");
                    Page.Run(69057, EmpTrans);
                end;
            }
            action("Attach Documents")
            {
                ApplicationArea = Basic;
                Image = Attach;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;
                ToolTip = 'Executes the Attach Documents action.';
                trigger OnAction()
                begin
                    DMSManagement.UploadImprestDocuments(Rec."No.", 'Imprest Naration', Rec.RecordId);
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin


        Rec.SetRange("No.");

        /*
         IF "Terminal Dues Paid?"=TRUE THEN
         CurrPage."Terminal Dues Paid?".Enabled(FALSE)
         ELSE
          CurrPage."Terminal Dues Paid?".ENABLED(TRUE);
        */

    end;

    trigger OnInit()
    begin
        MapPointVisible := true;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Pays tax?" := true;
    end;

    trigger OnOpenPage()
    var
        MapMgt: Codeunit "Online Map Management";
    begin
        if not MapMgt.TestSetup then
            MapPointVisible := false;

        UserSetup.Get(UserId);

        if UserSetup."Payroll View" = false then
            Error('You do not have sufficient rights to view payroll!Please contact system administrator.');
    end;

    var
        [InDataSet]
        MapPointVisible: Boolean;
        PayPeriod: Record "Payroll PeriodX";
        CurrentMonth: Date;
        UserSetup: Record "User Setup";
        AssMatrix2: Record "Assignment Matrix-X";
        AssMatrix3: Record "Assignment Matrix-X";
        Mail: Codeunit Mail;
        EmployeeRec: Record Employee;
        GetGroup: Codeunit Payroll1;
        GroupCode: Code[20];
        CUser: Code[20];
        Earnings: Record EarningsX;
        Ded: Record DeductionsX;
        AssMatrix: Record "Assignment Matrix-X";
        SalaryPointer: Record "Salary Pointers";
        assm: Record "Assignment Matrix-X";
        i: Integer;
        OT: Decimal;
        LE: Decimal;
        BA: Decimal;
        overtimehrs: Integer;
        leavedays: Integer;
        OT2: Decimal;
        overtimehrs2: Integer;
        payperiod2: Date;
        sals: Record "Assignment Matrix-X";
        empp: Record Employee;
        someform: Page "Employee Card-P";
        text: Text[250];
        lostdays2: Integer;
        LD: Decimal;
        "insurance Relief2": Decimal;
        "insurance Reliefcalc": Decimal;
        // PayrollRun: Report "Payroll Run";
        Text000: label 'Are you sure you want to assign default earnings & deductions?';
        EmpTrans: Record "Employee Transfers";
        Emp: Record Employee;
        DMSManagement: Codeunit "DMS Management";
}

#pragma implicitwith restore

