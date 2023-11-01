#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69095 "Temporary Employee Card"
{
    Caption = 'Employee Card';
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Temporary Employee";

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

                    trigger OnAssistEdit()
                    begin
                        /*IF AssistEdit(xRec) THEN
                          CurrPage.UPDATE;*/ //commented by morris during upgrade

                    end;
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Middle Name/Initials';
                }
                field(Initials; Rec.Initials)
                {
                    ApplicationArea = Basic;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = Basic;
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = Basic;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field("Search Name"; Rec."Search Name")
                {
                    ApplicationArea = Basic;
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                }
                field("Last Date Modified"; Rec."Last Date Modified")
                {
                    ApplicationArea = Basic;
                }
                field(Rank; Rec.Rank)
                {
                    ApplicationArea = Basic;
                }
                field("Employee Posting Group"; Rec."Employee Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("Posting Group"; Rec."Posting Group")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Balance; Rec.Balance)
                {
                    ApplicationArea = Basic;
                }
            }
            group("Payroll Details")
            {
                Caption = 'Payroll Details';
                field("Pays tax?"; Rec."Pays tax?")
                {
                    ApplicationArea = Basic;
                }
                field("Payroll Pay Mode"; Rec."Payroll Pay Mode")
                {
                    ApplicationArea = Basic;
                }
                field("P.I.N"; Rec."P.I.N")
                {
                    ApplicationArea = Basic;
                }
                field("N.H.I.F No"; Rec."N.H.I.F No")
                {
                    ApplicationArea = Basic;
                }
                field("Social Security No."; Rec."Social Security No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'N.S.S.F No.';
                }
                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = Basic;
                }
                field("Taxable Allowance"; Rec."Taxable Allowance")
                {
                    ApplicationArea = Basic;
                }
                field("Total Allowances"; Rec."Total Allowances")
                {
                    ApplicationArea = Basic;
                }
                field("Total Deductions"; Rec."Total Deductions")
                {
                    ApplicationArea = Basic;
                }
                field("Total Gratuity Amount"; Rec."Total Gratuity Amount")
                {
                    ApplicationArea = Basic;
                }
                field("Salary Scale"; Rec."Salary Scale")
                {
                    ApplicationArea = Basic;
                }
                field(Present; Rec.Present)
                {
                    ApplicationArea = Basic;
                }
                field(Halt; Rec.Halt)
                {
                    ApplicationArea = Basic;
                }
                field(Previous; Rec.Previous)
                {
                    ApplicationArea = Basic;
                }
                field("Job No"; Rec."Job No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Project';
                }
                field("Job Task No"; Rec."Job Task No")
                {
                    ApplicationArea = Basic;
                }
                field(Basic; Rec.Basic)
                {
                    ApplicationArea = Basic;
                }
                group("Primary Bank Details")
                {
                    Caption = 'Primary Bank Details';
                    field("Primary Bank %"; Rec."Primary Bank %")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Bank Account Number"; Rec."Bank Account Number")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Employee's Bank"; Rec."Employee's Bank")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Bank Name"; Rec."Bank Name")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Bank Branch"; Rec."Bank Branch")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Bank Branch Name"; Rec."Bank Branch Name")
                    {
                        ApplicationArea = Basic;
                    }
                }
                group("Bank 2")
                {
                    Caption = 'Bank 2';
                    field("Bank 2 %"; Rec."Bank 2 %")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Employee's Bank 2"; Rec."Employee's Bank 2")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Bank Name 2"; Rec."Bank Name 2")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Bank Branch 2"; Rec."Bank Branch 2")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Bank Branch Name 2"; Rec."Bank Branch Name 2")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Bank Account No. 2"; Rec."Bank Account No. 2")
                    {
                        ApplicationArea = Basic;
                    }
                }
            }
            group(Communication)
            {
                Caption = 'Communication';
                field(Extension; Rec.Extension)
                {
                    ApplicationArea = Basic;
                }
                field("Mobile Phone No."; Rec."Mobile Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field(Pager; Rec.Pager)
                {
                    ApplicationArea = Basic;
                }
                field("Phone No.2"; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                }
                field("Company E-Mail"; Rec."Company E-Mail")
                {
                    ApplicationArea = Basic;
                }
                field("Send Payslip By E-mail?"; Rec."Send Payslip By E-mail?")
                {
                    ApplicationArea = Basic;
                }
                field("Alt. Address Code"; Rec."Alt. Address Code")
                {
                    ApplicationArea = Basic;
                }
                field("Alt. Address Start Date"; Rec."Alt. Address Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Alt. Address End Date"; Rec."Alt. Address End Date")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Administration)
            {
                Caption = 'Administration';
                field("Employment Date"; Rec."Employment Date")
                {
                    ApplicationArea = Basic;
                }
                field("Employement Terms"; Rec."Employement Terms")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("Inactive Date"; Rec."Inactive Date")
                {
                    ApplicationArea = Basic;
                }
                field("Cause of Inactivity Code"; Rec."Cause of Inactivity Code")
                {
                    ApplicationArea = Basic;
                }
                field("Termination Date"; Rec."Termination Date")
                {
                    ApplicationArea = Basic;
                }
                field("Reason for termination Code"; Rec."Reason for termination Code")
                {
                    ApplicationArea = Basic;
                }
                field("Retirement Date"; Rec."Retirement Date")
                {
                    ApplicationArea = Basic;
                }
                field("Emplymt. Contract Code"; Rec."Emplymt. Contract Code")
                {
                    ApplicationArea = Basic;
                }
                field("Statistics Group Code"; Rec."Statistics Group Code")
                {
                    ApplicationArea = Basic;
                }
                field("Resource No."; Rec."Resource No.")
                {
                    ApplicationArea = Basic;
                }
                field("Research Center"; Rec."Research Center")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Personal)
            {
                Caption = 'Personal';
                field("Birth Date"; Rec."Birth Date")
                {
                    ApplicationArea = Basic;
                }
                field("Union Code"; Rec."Union Code")
                {
                    ApplicationArea = Basic;
                }
                field("Union Membership No."; Rec."Union Membership No.")
                {
                    ApplicationArea = Basic;
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
                }
                field(HOD; Rec.HOD)
                {
                    ApplicationArea = Basic;
                }
                field("Allocated Leave Days"; Rec."Allocated Leave Days")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("Total (Leave Days)"; Rec."Total (Leave Days)")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("Total Leave Taken"; Rec."Total Leave Taken")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Importance = Promoted;
                }
                field("Leave Outstanding Bal"; Rec."Leave Outstanding Bal")
                {
                    ApplicationArea = Basic;
                }
                field("Leave Balance"; Rec."Leave Balance")
                {
                    ApplicationArea = Basic;
                    Enabled = false;
                    Importance = Promoted;
                }
                field("Acrued Leave Days"; Rec."Acrued Leave Days")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("Cash per Leave Day"; Rec."Cash per Leave Day")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("Cash - Leave Earned"; Rec."Cash - Leave Earned")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("Leave Status"; Rec."Leave Status")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("Leave Type Filter"; Rec."Leave Type Filter")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("Leave Period Filter"; Rec."Leave Period Filter")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                }
                field("On Leave"; Rec."On Leave")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Update Employee Details")
            {
                Caption = 'Update Employee Details';
                field(overtimehrs; overtimehrs)
                {
                    ApplicationArea = Basic;
                    Caption = 'Overtime 1.5';
                }
                field(overtimehrs2; overtimehrs2)
                {
                    ApplicationArea = Basic;
                    Caption = 'Overtime 2.0';
                }
                field(lostdays2; lostdays2)
                {
                    ApplicationArea = Basic;
                    Caption = 'Lost Days';
                }
                field(leavedays; leavedays)
                {
                    ApplicationArea = Basic;
                    Caption = 'Leave Days';
                }
                field("insurance Relief2"; "insurance Relief2")
                {
                    ApplicationArea = Basic;
                    Caption = 'Insurance Relief';
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
                }
                action("&Picture")
                {
                    ApplicationArea = Basic;
                    Caption = '&Picture';
                    Image = Picture;
                    RunObject = Page "Employee Picture";
                    RunPageLink = "No." = field("No.");
                }
                action("&Alternative Addresses")
                {
                    ApplicationArea = Basic;
                    Caption = '&Alternative Addresses';
                    Image = Addresses;
                    RunObject = Page "Alternative Address List";
                    RunPageLink = "Employee No." = field("No.");
                }
                action("&Relatives")
                {
                    ApplicationArea = Basic;
                    Caption = '&Relatives';
                    Image = Relatives;
                    RunObject = Page "Employee Relatives";
                    RunPageLink = "Employee No." = field("No.");
                }
                action("Mi&sc. Article Information")
                {
                    ApplicationArea = Basic;
                    Caption = 'Mi&sc. Article Information';
                    Image = Filed;
                    RunObject = Page "Misc. Article Information";
                    RunPageLink = "Employee No." = field("No.");
                }
                action("&Confidential Information")
                {
                    ApplicationArea = Basic;
                    Caption = '&Confidential Information';
                    Image = Lock;
                    RunObject = Page "Confidential Information";
                    RunPageLink = "Employee No." = field("No.");
                }
                action("Q&ualifications")
                {
                    ApplicationArea = Basic;
                    Caption = 'Q&ualifications';
                    Image = Certificate;
                    RunObject = Page "Employee Qualifications";
                    RunPageLink = "Employee No." = field("No.");
                }
                action("A&bsences")
                {
                    ApplicationArea = Basic;
                    Caption = 'A&bsences';
                    Image = Absence;
                    RunObject = Page "Employee Absences";
                    RunPageLink = "Employee No." = field("No.");
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
                }
                action("Misc. Articles &Overview")
                {
                    ApplicationArea = Basic;
                    Caption = 'Misc. Articles &Overview';
                    Image = FiledOverview;
                    RunObject = Page "Misc. Articles Overview";
                }
                action("Co&nfidential Info. Overview")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&nfidential Info. Overview';
                    Image = ConfidentialOverview;
                    RunObject = Page "Confidential Info. Overview";
                }
                separator(Action61)
                {
                }
                action("Online Map")
                {
                    ApplicationArea = Basic;
                    Caption = 'Online Map';
                    Image = Map;

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

                trigger OnAction()
                var
                    StdGenJnl: Record "Standard General Journal";
                begin
                    PayDateP := PayPeriod."Starting Date";
                    PayPeriod.Reset;
                    PayPeriod.SetRange(PayPeriod.Closed, false);
                    if PayPeriod.FindFirst then begin
                        Earnings.Reset;
                        Earnings.SetRange(Earnings."Applies to All", true);
                        //Earnings.SETRANGE(Earnings."Basic Salary Code",FALSE);
                        if Earnings.Find('-') then begin
                            repeat
                                AssMatrix.Init;
                                AssMatrix."Employee No" := Rec."No.";
                                AssMatrix.Type := AssMatrix.Type::Payment;
                                AssMatrix."Payroll Period" := PayPeriod."Starting Date";
                                AssMatrix."Department Code" := Rec."Global Dimension 1 Code";
                                AssMatrix.Code := Earnings.Code;
                                AssMatrix.Validate(Code);
                                if not AssMatrix.Get(AssMatrix."Employee No", AssMatrix.Type, AssMatrix.Code, AssMatrix."Payroll Period") then
                                    AssMatrix.Insert;
                            until Earnings.Next = 0;
                        end;

                        // Deducton
                        Ded.Reset;
                        Ded.SetRange("Applies to All", true);
                        if Ded.Find('-') then begin
                            repeat
                                AssMatrix.Init;
                                AssMatrix."Employee No" := Rec."No.";
                                AssMatrix.Type := AssMatrix.Type::Deduction;
                                AssMatrix."Payroll Period" := PayPeriod."Starting Date";
                                AssMatrix."Department Code" := Rec."Global Dimension 1 Code";
                                AssMatrix.Code := Ded.Code;
                                AssMatrix.Validate(Code);
                                if not AssMatrix.Get(AssMatrix."Employee No", AssMatrix.Type, AssMatrix.Code, AssMatrix."Payroll Period") then
                                    AssMatrix.Insert;
                            until Ded.Next = 0;
                        end;
                        Message('Defauts assigned to %1 period', PayPeriod."Starting Date");
                    end;
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

                trigger OnAction()
                var
                    StdGenJnl: Record "Standard General Journal";
                begin
                    PayPeriod.Reset;
                    PayPeriod.SetRange(PayPeriod.Closed, false);
                    if PayPeriod.FindFirst then begin
                        Earnings.Reset;
                        Earnings.SetRange(Earnings."Applies to All", true);
                        //Earnings.SETRANGE(Earnings."Basic Salary Code",FALSE);
                        if Earnings.Find('-') then begin
                            repeat
                                AssMatrix.Init;
                                AssMatrix."Employee No" := Rec."No.";
                                AssMatrix.Type := AssMatrix.Type::Payment;
                                AssMatrix."Payroll Period" := PayPeriod."Starting Date";
                                AssMatrix."Department Code" := Rec."Global Dimension 1 Code";
                                AssMatrix.Code := Earnings.Code;
                                AssMatrix.Validate(Code);
                                if not AssMatrix.Get(AssMatrix."Employee No", AssMatrix.Type, AssMatrix.Code, AssMatrix."Payroll Period") then
                                    AssMatrix.Insert;
                            until Earnings.Next = 0;
                        end;
                    end;

                    AssMatrix.Reset;
                    AssMatrix.SetRange("Employee No", Rec."No.");
                    AssMatrix.SetRange(Type, AssMatrix.Type::Payment);
                    AssMatrix.SetRange(Closed, false);
                    Page.Run(69098, AssMatrix);
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

                trigger OnAction()
                var
                    StdGenJnl: Record "Standard General Journal";
                begin
                    PayPeriod.Reset;
                    PayPeriod.SetRange(PayPeriod.Closed, false);
                    if PayPeriod.FindFirst then begin
                        // Deducton
                        Ded.Reset;
                        Ded.SetRange("Applies to All", true);
                        if Ded.Find('-') then begin
                            repeat
                                AssMatrix.Init;
                                AssMatrix."Employee No" := Rec."No.";
                                AssMatrix.Type := AssMatrix.Type::Deduction;
                                AssMatrix."Payroll Period" := PayPeriod."Starting Date";
                                AssMatrix."Department Code" := Rec."Global Dimension 1 Code";
                                AssMatrix.Code := Ded.Code;
                                AssMatrix.Validate(Code);
                                if not AssMatrix.Get(AssMatrix."Employee No", AssMatrix.Type, AssMatrix.Code, AssMatrix."Payroll Period") then
                                    AssMatrix.Insert;
                            until Ded.Next = 0;
                        end;
                        //MESSAGE('Defauts assigned to %1 period',PayPeriod."Starting Date");
                    end;
                    AssMatrix.Reset;
                    AssMatrix.SetRange("Employee No", Rec."No.");
                    AssMatrix.SetRange(Type, AssMatrix.Type::Deduction);
                    AssMatrix.SetRange(Closed, false);
                    Page.Run(69098, AssMatrix);
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
                    Report.Run(69401, true, false, EmployeeRec);
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

                trigger OnAction()
                var
                    StdGenJnl: Record "Standard General Journal";
                begin
                    EmployeeRec.SetRange(EmployeeRec."No.", Rec."No.");
                    Report.Run(69407, true, false, EmployeeRec);
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

                    Report.Run(69400, true, false, EmployeeRec);
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
        PayPeriod: Record "Payroll PeriodXT";
        CurrentMonth: Date;
        UserSetup: Record "User Setup";
        AssMatrix2: Record "Assignment Matrix-X Temp-E";
        AssMatrix3: Record "Assignment Matrix-X Temp-E";
        Mail: Codeunit Mail;
        EmployeeRec: Record "Temporary Employee";
        GetGroup: Codeunit Payroll1;
        GroupCode: Code[20];
        CUser: Code[20];
        Earnings: Record "EarningsX Temp-E";
        Ded: Record "DeductionsX Temp-E";
        AssMatrix: Record "Assignment Matrix-X Temp-E";
        SalaryPointer: Record "Salary Pointers";
        assm: Record "Assignment Matrix-X Temp-E";
        i: Integer;
        OT: Decimal;
        LE: Decimal;
        BA: Decimal;
        overtimehrs: Integer;
        leavedays: Integer;
        OT2: Decimal;
        overtimehrs2: Integer;
        payperiod2: Date;
        sals: Record "Assignment Matrix-X Temp-E";
        empp: Record "Temporary Employee";
        someform: Page "Temporary Employee Card";
        text: Text[250];
        lostdays2: Integer;
        LD: Decimal;
        "insurance Relief2": Decimal;
        "insurance Reliefcalc": Decimal;
        //  PayrollRun: Report "Payroll Run Temp";
        Text000: label 'Are you sure you want to assign default earnings & deductions?';
        EmpTrans: Record "Employee Transfers";
        Emp: Record "Temporary Employee";
        PayDateP: Date;
}

#pragma implicitwith restore

