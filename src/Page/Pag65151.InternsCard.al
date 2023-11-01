#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
/// <summary>
/// Page Interns Card (ID 65151).
/// </summary>
#pragma implicitwith disable
Page 65151 "Interns Card"
{
    Caption = 'Employee Card';
    CardPageID = "Interns List-HR";
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
                    Caption = 'Personal No.';
                    ShowMandatory = true;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                    trigger OnAssistEdit()
                    begin
                        /*IF AssistEdit(xRec) THEN
                          CurrPage.UPDATE;
                          */

                    end;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the employee''s first name.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
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
                field("Current Position ID"; Rec."Current Position ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Position ID field.';
                }
                field("Current Duty Station"; Rec."Current Duty Station")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Duty Station field.';
                }
                field("Current Job Grade"; Rec."Current Job Grade")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Job Grade field.';
                }
                field("Current Terms of Service"; Rec."Current Terms of Service")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Terms of Service field.';
                }
                field(Position; Rec.Position)
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Position field.';
                }
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Job ID field.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the employee''s job title.';
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
                    ToolTip = 'Specifies the city of the address.';
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the country/region of the address.';
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
                    ShowMandatory = true;
                    ToolTip = 'Specifies the employee''s gender.';
                }
                field(County; Rec.County)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the county of the employee.';
                }
                field("Marital Status"; Rec."Marital Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Marital Status field.';
                }
                field(Religion; Rec.Religion)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Religion field.';
                }
                field(Disabled; Rec.Disabled)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disabled field.';
                }
                field("Ethnic Origin"; Rec."Ethnic Origin")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ethnic Origin field.';
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
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Region Name';
                    ToolTip = 'Specifies the value of the Region Name field.';
                }
                field("User Signature"; Rec."User Signature")
                {
                    ApplicationArea = Basic;
                    Caption = 'Signature';
                    ToolTip = 'Specifies the value of the Signature field.';
                }
                // field(Picture; Picture)
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Picture field.';
                // }
                field(HOD; Rec.HOD)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the HOD field.';
                }
                field("Regional Manager"; Rec."Regional Manager")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Regional Manager field.';
                }
                field("ICT Help Desk Admin"; Rec."ICT Help Desk Admin")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ICT Help Desk Admin field.';
                }
                field(CEO; Rec.CEO)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the CEO field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User ID field.';
                }
                field(Supervisor; Rec.Supervisor)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Supervisor field.';
                }
                field("Reliver Code"; Rec."Reliver Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reliver Code field.';
                }
            }
            group("Organization Units")
            {
                field("Directorate Code"; Rec."Directorate Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directorate Code field.';
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Division Code field.';
                }
                field(Division; Rec.Division)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Division field.';
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
                field("Address."; Rec.Address)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employee''s address.';
                }
                field("Address2."; Rec."Address 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies additional address information.';
                }
                field("Phone No.2"; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employee''s telephone number.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the employee''s private email address.';
                }
                field("Company E-Mail"; Rec."Company E-Mail")
                {
                    ApplicationArea = Basic;
                    Caption = 'Organization Email';
                    ToolTip = 'Specifies the employee''s email address at the company.';
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
                field("Work Phone Number"; Rec."Work Phone Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Work Phone Number field.';
                }
                field("Ext."; Rec."Ext.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ext. field.';
                }
            }
            group(Administration)
            {
                Caption = 'Administration';
                field("Date Of Birth"; Rec."Date Of Birth")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Date Of Birth field.';
                }
                field(Age; Rec.Age)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Age field.';
                }
                field("Employment Date"; Rec."Employment Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the date when the employee began to work for the company.';
                }
                field("End Of Probation Date"; Rec."End Of Probation Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Last Promotion Date';
                    ToolTip = 'Specifies the value of the Last Promotion Date field.';
                }
                field("Pension Scheme Join"; Rec."Pension Scheme Join")
                {
                    ApplicationArea = Basic;
                    Caption = 'Pension Scheme Join Date';
                    ToolTip = 'Specifies the value of the Pension Scheme Join Date field.';
                }
                field("Medical Scheme Join"; Rec."Medical Scheme Join")
                {
                    ApplicationArea = Basic;
                    Caption = 'Medical Scheme Join Date';
                    ToolTip = 'Specifies the value of the Medical Scheme Join Date field.';
                }
                field("Retirement Date"; Rec."Retirement Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Retirement Date field.';
                }
                field("Full / Part Time"; Rec."Full / Part Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Full / Part Time field.';
                }
                field("Contract End Date"; Rec."Contract End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract End Date field.';
                }
                field("Notice Period"; Rec."Notice Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notice Period field.';
                }
                field("Send Alert to"; Rec."Send Alert to")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Send Alert to field.';
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
                field("Salespers./Purch. Code"; Rec."Salespers./Purch. Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies a salesperson or purchaser code for the employee.';
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
                field("Disciplinary status"; Rec."Disciplinary status")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Disciplinary status field.';
                }
            }
            group("Separation Details")
            {
                // field("Reason for termination Code"; "Reason for termination Code")
                // {
                //     ApplicationArea = Basic;
                //     Caption = 'Grounds for Exit';
                //     ToolTip = 'Specifies the value of the Grounds for Exit field.';
                // }
                field("Reason for termination"; Rec."Reason for termination")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reason for Exit';
                    ToolTip = 'Specifies the value of the Reason for Exit field.';
                }
                field("Termination Date"; Rec."Termination Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Exit Date';
                    ToolTip = 'Specifies the date when the employee was terminated, due to retirement or dismissal, for example.';
                }
                field("Date Of Leaving"; Rec."Date Of Leaving")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Of Leaving field.';
                }
                field("Exit Interview Conducted"; Rec."Exit Interview Conducted")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Exit Interview Conducted field.';
                }
                field("Exit Interview Date"; Rec."Exit Interview Date")
                {
                    ApplicationArea = Basic;
                    Editable = ExitDateEditable;
                    ToolTip = 'Specifies the value of the Exit Interview Date field.';
                }
                field("Exit Interview Done by"; Rec."Exit Interview Done by")
                {
                    ApplicationArea = Basic;
                    Editable = ExitByEditable;
                    ToolTip = 'Specifies the value of the Exit Interview Done by field.';
                }
                field("Allow Re-Employment In Future"; Rec."Allow Re-Employment In Future")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Allow Re-Employment In Future field.';
                }
            }
            group("Payroll Details")
            {
                Caption = 'Payroll Details';
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field("Pays tax?"; Rec."Pays tax?")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pays tax? field.';
                }
                field("Pay Wages"; Rec."Pay Wages")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pay Wages field.';
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pay Mode field.';
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
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the ID Number field.';
                }
                field("Employee Posting Group"; Rec."Employee Posting Group")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the employee''s type to link business transactions made for the employee with the appropriate account in the general ledger.';
                }
                field("Posting Group"; Rec."Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting Group field.';
                }
                group("Primary Bank Details")
                {
                    Caption = 'Primary Bank Details';
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
            group("Job Details")
            {
                Caption = 'Job Details';
                field("Salary Scale"; Rec."Salary Scale")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Salary Scale field.';
                }
            }
            group("Leave Details")
            {
                Caption = 'Leave Details';
                field("Allow Negative Leave"; Rec."Allow Negative Leave")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Allow Negative Leave field.';
                }
                field("Off Days"; Rec."Off Days")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Off Days field.';
                }
                field("Leave Days B/F"; Rec."Reimbursed Leave Days")
                {
                    ApplicationArea = Basic;
                    Caption = 'Leave Days B/F';
                    Importance = Promoted;
                    ToolTip = 'Specifies the value of the Leave Days B/F field.';
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
        }
        area(factboxes)
        {
            part(Control35; "HR Employees Factbox")
            {
                SubPageLink = "No." = field("No.");
                ApplicationArea = Basic;
            }
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

    // actions
    // {
    //     area(navigation)
    //     {
    //         group("E&mployee")
    //         {
    //             Caption = 'E&mployee';
    //             Image = Employee;
    //             action("Co&mments")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Co&mments';
    //                 Image = ViewComments;
    //                 RunObject = Page "Human Resource Comment Sheet";
    //                 RunPageLink = "Table Name" = const(Employee),
    //                               "No." = field("No.");
    //                 ToolTip = 'Executes the Co&mments action.';
    //             }
    //             action(Dimensions)
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Dimensions';
    //                 Image = Dimensions;
    //                 RunObject = Page "Default Dimensions";
    //                 RunPageLink = "Table ID" = const(5200),
    //                               "No." = field("No.");
    //                 ShortCutKey = 'Shift+Ctrl+D';
    //                 ToolTip = 'Executes the Dimensions action.';
    //             }
    //             action("&Picture")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = '&Picture';
    //                 Image = Picture;
    //                 RunObject = Page "Employee Picture";
    //                 RunPageLink = "No." = field("No.");
    //                 ToolTip = 'Executes the &Picture action.';
    //             }
    //             action("&Alternative Addresses")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = '&Alternative Addresses';
    //                 Image = Addresses;
    //                 RunObject = Page "Alternative Address List";
    //                 RunPageLink = "Employee No." = field("No.");
    //                 ToolTip = 'Executes the &Alternative Addresses action.';
    //             }
    //             action("&Relatives")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = '&Relatives';
    //                 Image = Relatives;
    //                 RunObject = Page "Employee Relatives";
    //                 RunPageLink = "Employee No." = field("No.");
    //                 ToolTip = 'Executes the &Relatives action.';
    //             }
    //             action("&Next Of Kin")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = '&Next Of Kin';
    //                 Image = Relatives;
    //                 RunObject = Page "HR Employee Next of Kin";
    //                 RunPageLink = "Employee Code" = field("No.");
    //                 ToolTip = 'Executes the &Next Of Kin action.';
    //             }
    //             action("&Dependants")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = '&Dependants';
    //                 Image = Relatives;
    //                 RunObject = Page "Professional Qualifications";
    //                 RunPageLink = "Application No" = field("No.");
    //                 Visible = false;
    //                 ToolTip = 'Executes the &Dependants action.';
    //             }
    //             action("&Emergency Contacts")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = '&Emergency Contacts';
    //                 Image = ContactPerson;
    //                 RunObject = Page "Apptitude Interview Lines";
    //                 RunPageLink = "Line No" = field("No.");
    //                 Visible = false;
    //                 ToolTip = 'Executes the &Emergency Contacts action.';
    //             }
    //             action("Mi&sc. Article Information")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Mi&sc. Article Information';
    //                 Image = Filed;
    //                 RunObject = Page "Misc. Article Information";
    //                 RunPageLink = "Employee No." = field("No.");
    //                 ToolTip = 'Executes the Mi&sc. Article Information action.';
    //             }
    //             action("&Confidential Information")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = '&Confidential Information';
    //                 Image = Lock;
    //                 RunObject = Page "Confidential Information";
    //                 RunPageLink = "Employee No." = field("No.");
    //                 ToolTip = 'Executes the &Confidential Information action.';
    //             }
    //             action("&Medical Info")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = '&Medical Info';
    //                 Image = Lock;
    //                 RunObject = Page "Vacancy Media Advertisements";
    //                 RunPageLink = "Entry No." = field("No.");
    //                 Visible = false;
    //                 ToolTip = 'Executes the &Medical Info action.';
    //             }
    //             action("R&esponsibilities")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'R&esponsibilities';
    //                 Image = Position;
    //                 RunObject = Page "Welfare Contribution Header";
    //                 RunPageLink = "Welfare No." = field(Position);
    //                 Visible = false;
    //                 ToolTip = 'Executes the R&esponsibilities action.';
    //             }
    //             action("Q&ualifications")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Q&ualifications';
    //                 Image = Certificate;
    //                 RunObject = Page "Employee Qualifications";
    //                 RunPageLink = "Employee No." = field("No.");
    //                 ToolTip = 'Executes the Q&ualifications action.';
    //             }
    //             action("Employment H&istory")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Employment H&istory';
    //                 Image = History;
    //                 RunObject = Page "Oral Interview  List";
    //                 RunPageLink = "Line No." = field("No.");
    //                 Visible = false;
    //                 ToolTip = 'Executes the Employment H&istory action.';
    //             }
    //             action("Employee Referees")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Employee Referees';
    //                 Image = History;
    //                 RunObject = Page "Employee Referees";
    //                 RunPageLink = Field8 = field("No.");
    //                 Visible = false;
    //                 ToolTip = 'Executes the Employee Referees action.';
    //             }
    //             action("I&tems Assigned")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'I&tems Assigned';
    //                 Image = CheckList;
    //                 RunObject = Page "Oral Interview Card";
    //                 RunPageLink = "Line No." = field("No.");
    //                 Visible = false;
    //                 ToolTip = 'Executes the I&tems Assigned action.';
    //             }
    //             action("C&onfidential Info")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'C&onfidential Info';
    //                 Image = ConfidentialOverview;
    //                 RunObject = Page "Job Advertisement Templates";
    //                 RunPageLink = Code = field("No.");
    //                 Visible = false;
    //                 ToolTip = 'Executes the C&onfidential Info action.';
    //             }
    //             action("A&bsences")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'A&bsences';
    //                 Image = Absence;
    //                 RunObject = Page "Employee Absences";
    //                 RunPageLink = "Employee No." = field("No.");
    //                 ToolTip = 'Executes the A&bsences action.';
    //             }
    //             separator(Action23)
    //             {
    //             }
    //             action("Absences by Ca&tegories")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Absences by Ca&tegories';
    //                 Image = AbsenceCategory;
    //                 RunObject = Page "Empl. Absences by Categories";
    //                 RunPageLink = "No." = field("No."),
    //                               "Employee No. Filter" = field("No.");
    //                 ToolTip = 'Executes the Absences by Ca&tegories action.';
    //             }
    //             action("Misc. Articles &Overview")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Misc. Articles &Overview';
    //                 Image = FiledOverview;
    //                 RunObject = Page "Misc. Articles Overview";
    //                 ToolTip = 'Executes the Misc. Articles &Overview action.';
    //             }
    //             action("Co&nfidential Info. Overview")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Co&nfidential Info. Overview';
    //                 Image = ConfidentialOverview;
    //                 RunObject = Page "Confidential Info. Overview";
    //                 ToolTip = 'Executes the Co&nfidential Info. Overview action.';
    //             }
    //             separator(Action61)
    //             {
    //             }
    //             action("Online Map")
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Online Map';
    //                 Image = Map;
    //                 ToolTip = 'Executes the Online Map action.';
    //                 trigger OnAction()
    //                 begin
    //                     DisplayMap;
    //                 end;
    //             }
    //             action("Create Customer Imprest A/C")
    //             {
    //                 ApplicationArea = Basic;
    //                 Enabled = ShowCust;
    //                 Image = Customer;
    //                 Promoted = true;
    //                 PromotedCategory = Process;
    //                 ToolTip = 'Executes the Create Customer Imprest A/C action.';
    //                 trigger OnAction()
    //                 var
    //                     Cust: Record Customer;
    //                 begin
    //                     if CreateCustomer then
    //                         Message(Text000, 'Imprest A/C')
    //                     else
    //                         Message(Text001, 'Imprest A/C');
    //                 end;
    //             }
    //             action("Create Resource A/C")
    //             {
    //                 ApplicationArea = Basic;
    //                 Enabled = ShowResource;
    //                 Image = Resource;
    //                 Promoted = true;
    //                 PromotedCategory = Process;
    //                 ToolTip = 'Executes the Create Resource A/C action.';
    //                 trigger OnAction()
    //                 begin
    //                     if CreateResource then
    //                         Message(Text000, 'Resource')
    //                     else
    //                         Message(Text001, 'Resource');
    //                 end;
    //             }
    //             action(Attachments)
    //             {
    //                 ApplicationArea = Basic;
    //                 Caption = 'Attachments';
    //                 Image = Attachments;
    //                 Promoted = true;
    //                 PromotedCategory = Category6;
    //                 RunObject = Page "Attachments Setup";
    //                 RunPageLink = Code = field("No.");
    //                 ToolTip = 'Executes the Attachments action.';
    //             }
    //             action("Transfer Employee")
    //             {
    //                 ApplicationArea = Basic;
    //                 Image = HRSetup;
    //                 Promoted = true;
    //                 PromotedCategory = Process;
    //                 PromotedIsBig = true;
    //                 ToolTip = 'Executes the Transfer Employee action.';
    //                 trigger OnAction()
    //                 begin
    //                     if Dialog.Confirm('Are you sure you want to stransfer %1 ?', true, "First Name" + ' ' + "Last Name") then begin
    //                         Emp.Reset;
    //                         Emp.SetRange("No.", "No.");
    //                         Report.Run(69120, true, true, Emp);
    //                         CurrPage.Close;
    //                         EmpTrans.Reset;
    //                         EmpTrans.SetRange("Employee No", "No.");
    //                         Page.Run(69057, EmpTrans);
    //                     end;
    //                 end;
    //             }
    //             action("Transfer History")
    //             {
    //                 ApplicationArea = Basic;
    //                 Image = History;
    //                 Promoted = true;
    //                 PromotedCategory = Process;
    //                 ToolTip = 'Executes the Transfer History action.';
    //                 trigger OnAction()
    //                 begin
    //                     EmpTrans.Reset;
    //                     EmpTrans.SetRange("Employee No", "No.");
    //                     Page.Run(69057, EmpTrans);
    //                 end;
    //             }
    //         }
    //     }
    // }

    trigger OnAfterGetRecord()
    begin
        ShowCust := Rec.CreateCustomer;
        ShowResource := Rec.CreateResource;
    end;

    trigger OnInit()
    begin
        MapPointVisible := true;
        ExitDateEditable := true;
        ExitByEditable := true;
    end;

    trigger OnOpenPage()
    var
        MapMgt: Codeunit "Online Map Management";
    begin
        ShowCust := Rec.CreateCustomer;
        ShowResource := Rec.CreateResource;
    end;

    trigger OnQueryClosePage(CloseAction: action): Boolean
    begin
        if CloseAction in [Action::OK, Action::LookupOK] then begin
            if Rec."No." > '00267' then begin
                Rec.TestField("Mobile Phone No.");
                Rec.TestField(Address);
                Rec.TestField("Address 2");
            end;
        end;
    end;

    var
        [InDataSet]
        MapPointVisible: Boolean;
        [InDataSet]
        ShowCust: Boolean;
        [InDataSet]
        ShowResource: Boolean;
        Text000: label '%1 has been created successully';
        Text001: label '%1 already exists';
        [InDataSet]
        ExitDateEditable: Boolean;
        [InDataSet]
        ExitByEditable: Boolean;
        Emp: Record Employee;
        EmpTrans: Record "Employee Transfers";


    /// <summary>
    /// Updatecontrols.
    /// </summary>
    procedure Updatecontrols()
    begin

        if Rec."Exit Interview Conducted" = Rec."exit interview conducted"::Yes then begin
            ExitByEditable := true;
            ExitDateEditable := true;
        end else begin
            ExitByEditable := false;
            ExitDateEditable := false;
        end;
    end;
}

#pragma implicitwith restore

