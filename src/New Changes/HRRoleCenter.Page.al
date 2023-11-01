page 60002 "HR Role Center"
{
    Caption = 'HR Role Center';
    PageType = RoleCenter;
    layout
    {
        area(rolecenter)
        {
            group(Control1900724808)
            {
                part(Control1904652008; "HR Manager Activities")
                {
                    ApplicationArea = Basic;
                }
                systempart(Control1000000050; MyNotes)
                {
                    ApplicationArea = Basic;
                }
                systempart(Control1901420308; Outlook)
                {
                    ApplicationArea = Basic;
                }
            }
            group(Control1900724708)
            {
                part(Control21; "My Job Queue")
                {
                    Visible = false;
                    ApplicationArea = Basic;
                }
            }
        }
    }
    actions
    {
        area(Sections)
        {
            group("HR Administration")
            {
                Caption = 'HR Administration';
                Image = Administration;
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Employee;
                    RunObject = Page Dimensions;
                    ToolTip = 'Executes the Dimensions action.';
                }
                action("Human ResourcesSetup")
                {
                    ApplicationArea = Basic;
                    Caption = 'Human Resources Setup';
                    Image = AccountingPeriods;
                    RunObject = Page "HR Setup List";
                    ToolTip = 'Executes the Human Resources Setup action.';
                }
                action("Employee Posting Group")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee Posting Group';
                    Image = AccountingPeriods;
                    RunObject = Page "Employee Posting Group";
                    ToolTip = 'Executes the Employee Posting Group action.';
                }
                action("Leave Types")
                {
                    ApplicationArea = Basic;
                    Caption = 'Leave Types';
                    Image = AccountingPeriods;
                    RunObject = Page "Leave Types";
                    ToolTip = 'Executes the Leave Types action.';
                }

                action("Human Res. Units of Measure")
                {
                    ApplicationArea = Basic;
                    Caption = 'Human Res. Units of Measure';
                    Image = AccountingPeriods;
                    RunObject = Page "Human Res. Units of Measure";
                    ToolTip = 'Executes the Human Res. Units of Measure action.';
                }
                action("Registration Codes")
                {
                    ApplicationArea = Basic;
                    Caption = 'Registration Codes';
                    RunObject = Page "Causes of Absence";
                    ToolTip = 'Executes the Registration Codes action.';
                }
                action("Causesof Inactivity")
                {
                    ApplicationArea = Basic;
                    Caption = 'Causes of Inactivity';
                    Image = Currency;
                    RunObject = Page "Causes of Inactivity";
                    ToolTip = 'Executes the Causes of Inactivity action.';
                }
                action("Groundsfor Termination")
                {
                    ApplicationArea = Basic;
                    Caption = 'Grounds for Termination';
                    Image = AccountingPeriods;
                    RunObject = Page "Grounds for Termination";
                    ToolTip = 'Executes the Grounds for Termination action.';
                }
                action(Union)
                {
                    ApplicationArea = Basic;
                    Caption = 'Unions';
                    RunObject = Page Unions;
                    ToolTip = 'Executes the Unions action.';
                }
                action("Employment Contract")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employment Contracts';
                    Image = Currency;
                    RunObject = Page "Employment Contracts";
                    ToolTip = 'Executes the Employment Contracts action.';
                }
                action(Relative)
                {
                    ApplicationArea = Basic;
                    Caption = 'Relatives';
                    Image = Employee;
                    RunObject = Page Relatives;
                    ToolTip = 'Executes the Relatives action.';
                }
                action("Misc Articles")
                {
                    ApplicationArea = Basic;
                    Caption = 'Misc. Articles';
                    RunObject = Page "Misc. Articles";
                    ToolTip = 'Executes the Misc. Articles action.';
                }
                action(Confidentials)
                {
                    ApplicationArea = Basic;
                    Caption = 'Confidential';
                    RunObject = Page Confidential;
                    ToolTip = 'Executes the Confidential action.';
                }
                action(Qualification)
                {
                    ApplicationArea = Basic;
                    Caption = 'Qualifications';
                    Image = Currency;
                    RunObject = Page Qualifications;
                    ToolTip = 'Executes the Qualifications action.';
                }
                action("Pay Periods")
                {
                    ApplicationArea = Basic;
                    Caption = 'Pay Periods';
                    Image = Currency;
                    RunObject = Page "Pay Periods";
                    ToolTip = 'Executes the Pay Periods action.';
                }
                action("Employee Statistics Group")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee Statistics Groups';
                    Image = Employee;
                    RunObject = Page "Employee Statistics Groups";
                    ToolTip = 'Executes the Employee Statistics Groups action.';
                }
                action("Human Resource Setup")
                {
                    ApplicationArea = Basic;
                    Caption = 'Human Resource Setup';
                    Image = Employee;
                    RunObject = Page "HR Setup List";
                    ToolTip = 'Executes the Human Resource Setup action.';
                }
                action("Base Calendar")
                {
                    ApplicationArea = Basic;
                    Caption = 'Base Calendar';
                    Image = Employee;
                    RunObject = Page "Base Calendar List";
                    ToolTip = 'Executes the Base Calendar action.';
                }
                action("HR LeaveTypes")
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Leave Types';
                    Image = Employee;
                    RunObject = Page "HR Leave Types";
                    ToolTip = 'Executes the HR Leave Types action.';
                }
                action("HR LeavePeriods")
                {
                    ApplicationArea = Basic;
                    Caption = 'HR Leave Periods';
                    Image = Employee;
                    RunObject = Page "HR Leave Periods";
                    ToolTip = 'Executes the HR Leave Periods action.';
                }
                action("User Setup Permissions")
                {
                    ApplicationArea = Basic;
                    Caption = 'User Setup Permissions';
                    Image = Employee;
                    RunObject = Page "User Setup Permissions";
                    ToolTip = 'Executes the HR Leave Periods action.';
                }

            }
            group("Company Information1")
            {
                Caption = 'Company Information';
                action("Company Information")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Company Information';
                    RunObject = page "Employee List";
                }
                action("Base Calendar Card")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Base Calendar Card';
                    RunObject = page "Base Calendar Card";
                }
            }
            group(JobsManagement)
            {
                Caption = 'Jobs Management';
                Image = HumanResources;
                action("Jobs Management")
                {
                    ApplicationArea = Basic;
                    Caption = 'Jobs List';
                    Image = Employee;
                    RunObject = Page Positions;
                    ToolTip = 'List the Jobs.';
                }
                action("Jobs Grade")
                {
                    ApplicationArea = Basic;
                    Caption = 'Job Grades';
                    Image = Employee;
                    RunObject = Page "Job Grades";
                    ToolTip = 'List the Jobs.';
                }
                action("Salary Pointers")
                {
                    ApplicationArea = Basic;
                    Caption = 'Salary Pointers';
                    Image = Employee;
                    RunObject = Page "Salary pointers";
                    ToolTip = 'List the Jobs.';
                }
            }
            group("Hr Planning Management")
            {
                Caption = 'Hr Planning Management';
                action("Positions")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Positions';
                    RunObject = page "Positions";
                }
                action("Duty Stations")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Duty Stations';
                    RunObject = page "Duty Station";
                }
            }
            group("Employee Management")
            {

                action("Employees12")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Employees';
                    RunObject = page "Employee List-HR";
                }
                action("Employee List-Casual")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Employee List-Casual';
                    RunObject = page "Employee List";
                }

                action("Hardship Allowance Setup")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Hardship Allowance Setup';
                    RunObject = page "Hardship Allowance Setup";
                }
                action("Employee Transfers History")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Employee Transfers History';
                    RunObject = page "Employee Transfers History";
                }
                group("Reports2")
                {
                    Caption = 'Reports and Analysis';
                    action("Employee List Per Region/Towns")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee List Per Region/Towns';
                        RunObject = page "Employee List";
                    }
                    action("Employee - Absences by Causes1")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Absences by Causes';
                        //   RunObject = report "Employee - Absences by Causes";
                    }
                    action("Employee - Addresses1")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Addresses';
                        RunObject = report "Employee - Addresses";
                    }
                    action("Employee - Alt. Addresses1")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Alt. Addresses';
                        RunObject = report "Employee - Alt. Addresses";
                    }
                    action("Employee - Birthdays1")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Birthdays';
                        RunObject = report "Employee - Birthdays";
                    }
                    action("Employee - Confidential Info.1")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Confidential Info.';
                        RunObject = report "Employee - Confidential Info.";
                    }
                    action("Employee - Contracts1")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Contracts';
                        RunObject = report "Employee - Contracts";
                    }
                    action("Employee - Labels1")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Labels';
                        RunObject = report "Employee - Labels";
                    }
                    action("Employee - List1")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee List';
                        RunObject = report "Employee - List";
                    }
                    action("Employee - Misc. Article Info.1")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Misc. Article Info.';
                        RunObject = report "Employee - Misc. Article Info.";
                    }
                    action("Employee - Qualifications1")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Qualifications';
                        RunObject = report "Employee - Qualifications";
                    }
                    action("Employee - Relatives1")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Relatives';
                        RunObject = report "Employee - Relatives";
                    }
                    action("Employee - Staff Absences1")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Staff Absences';
                        // RunObject = report "Employee - Staff Absences";
                    }
                    action("Employee - Unions1")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Unions';
                        RunObject = report "Employee - Unions";
                    }

                }
            }
            group("Establishment")
            {
                Caption = 'Establishment';
                action("Board1")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Board';
                    RunObject = page "Board List";
                }
                action("Legal Entities")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Legal Entities';
                    RunObject = page "Legal Entity List";
                }
                action("Directorates1")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Directorates';
                    RunObject = page "Directorate List";
                }
                action("Departments")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Departments';
                    RunObject = page "Department List";
                }
                action("Regions List")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Counties List';
                    RunObject = page "Regions List";
                }
                action("Centers")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Offices';
                    RunObject = page "Center List";
                }
                action("Sections1")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Units';
                    RunObject = page "Section List";
                }
                action("Organization Hierarchy")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Organization Hierarchy';
                    RunObject = page "Organization Hierarchy";
                }
                action("Duty Station")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Duty Station';
                    RunObject = page "Duty Station";
                }
                action("Terms of Service")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Terms of Service';
                    RunObject = page "Terms of Service";
                }

                action("Job Grades")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Job Grades';
                    RunObject = page "Job Grades";
                }
                action("Designation Groups")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Designation Groups';
                    RunObject = page "Designation Groups";
                }
                action("Employee Work Shift")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Employee Work Shift';
                    RunObject = page "Employee Work Shift";
                }
                action("Positions1")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Positions';
                    RunObject = page "Positions";
                }
                action("Global Staff Establishment")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Global Staff Establishment';
                    RunObject = page "Staff Establishment Plans";
                }

                action("Commitee Types")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Commitee Types';
                    RunObject = page "Commitee Types";
                }
                action("Domain Area")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Domain Area';
                    RunObject = page "Domain Area";
                }
                action("HR Committee Appointment")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'HR Committee Appointment List';
                    RunObject = page "HR Committee Appointment List";
                }
                group("Reports11")
                {
                    caption = 'Reports';
                    action("Staff Establishment")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Staff Establishment';
                        //   RunObject = report "Staff Establishment";
                    }
                    action("Detailed Staff Establishment")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Detailed Staff Establishment';
                        //   RunObject = report "Detailed Staff Establishment";
                    }
                }


            }
            group("Recruitment  & Selection")
            {
                Caption = 'Recruitment  & Selection';
                group("Pre-Hire Preparation")
                {
                    action("HR Officers")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'HR Officers';
                        RunObject = page "HR Officers";
                    }
                    action("Recruitment Agencies")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Recruitment Agencies';
                        RunObject = page "Recruitment Agencies";
                    }
                    action("Hr Guiding Principle")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Hr Guiding Principle';
                        RunObject = page "Hr Guiding Principle";
                    }
                    action("HR Document Template")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'HR Document Template';
                        RunObject = page "Document Template-HR";
                    }
                    action("Recruitment Reasons")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Recruitment Reasons';
                        RunObject = page "Recruitment Reasons";
                    }
                    action("Job Boards")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Job Boards';
                        RunObject = page "Job Boards";
                    }
                    action("Functional Recruitment Plans")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Functional Recruitment Plans';
                        RunObject = page "Functional Recruitment Plans";
                    }
                    action("Annual Recruitment Plans")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Annual Recruitment Plans';
                        RunObject = page "Recruitment Plans";
                    }
                    action("Recruitment Requisitions")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Recruitment Requisitions';
                        RunObject = page "Recruitment Requisitions";
                    }
                    action("Employer Information")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employer Profile';
                        RunObject = page "Company Information";
                    }
                    action("Employee List")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee List';
                        RunObject = page "Employee List";
                    }
                    action("Qualifications Invetory")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Qualifications Inventory';
                        RunObject = page "Qualifications";
                    }
                    action("Created Vacancies")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Created Vacancies';
                        RunObject = page "Created Vacancies";
                    }
                    action("Published Vacancies List")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Published Vacancies List';
                        RunObject = page "All Published  Vacancies List";
                    }
                    action("Career Fair Vouchers")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Career Fair Vouchers';
                        RunObject = page "Career Fair Vouchers";
                    }
                    action("Vacancy Announcement Vouchers")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Vacancy Announcement Vouchers';
                        RunObject = page "Vacancy Announcement Vouchers";
                    }
                    action("Approved Vacancy Announcement Vouchers")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Approved Vacancy Announcement Vouchers';
                        RunObject = page "Approved Vacancy Ann Vouchers";
                    }
                    action("Published Announcement Vouchers")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Published Announcement Vouchers';
                        RunObject = page "Published Ann Vouchers";
                    }
                    action("Recruitment Agency Vouchers")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Recruitment Agency Vouchers';
                        RunObject = page "Recruitment Agency Vouchers";
                    }
                    action("Partially Filled Vacancies")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Partially Filled Vacancies';
                        RunObject = page "Vacancies";
                    }
                    action("Fully Filled Vacancies")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Fully Filled Vacancies';
                        RunObject = page "Vacancies";
                    }


                    action("Declaration Setup")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Declaration Setup';
                        RunObject = page "Declaration Setup";
                    }
                    action("Close Ended Qn Type")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Close Ended Qn Type';
                        RunObject = page "Close Ended Qn Type";
                    }
                    action("Pre-Screening Templates")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Pre-Screening Templates';
                        RunObject = page "Pre-Screening Templates";
                    }
                    action("Job Grades11")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Job Grades';
                        RunObject = page "Job Grades";
                    }
                    action("Domain Area1")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Domain Area';
                        RunObject = page "Domain Area";
                    }
                    group("reports123")
                    {
                        caption = 'Reports';

                        action("Detailed Manpower Plan")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Detailed Manpower Plan';
                            //  RunObject = report "Staff Establishment";
                        }
                        action("Recruitment  Requisition List")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Recruitment  Requisition List';
                            //  RunObject = report "Staff Establishment";
                        }
                        action("Vacancies List")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Vacancies List';
                            // RunObject = report "Vacancies List";
                        }
                        action("Vacancy Announcements List")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Vacancy Announcements List';
                            // RunObject = report "Vacancy Announcements List";
                        }
                    }
                }
                group("Application & Selection")
                {
                    action("Candidates")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Candidates';
                        RunObject = page "Candidates";
                    }

                    action("Open Vacancies")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Open Vacancies';
                        RunObject = page "Vacancies";
                    }
                    action("Job Applications")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Job Applications';
                        RunObject = page "Job Applications";
                    }

                    action("Commitee Appointment Vouchers")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Commitee Appointment Vouchers';
                        RunObject = page "Commitee Appointment Vouchers";
                    }
                    action("Shortlist Vouchers")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Shortlist Vouchers';
                        RunObject = page "Candidate Shortlist Vouchers";
                    }

                    action("Interview Invitations")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Interview Invitations';
                        RunObject = page "Interview Invitations";
                    }
                    action("Interview Records")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Interview Records';
                        RunObject = page "Candidate Interview Records";
                    }
                    action("Consolidated Interview Records")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Consolidated Interview Records';
                        //  RunObject = page "Consolidated Interview Records";
                    }
                    action("Closed Vacancies")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Closed Vacancies';
                        RunObject = page "Vacancies";
                    }
                    action("Rejected Job Offers")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Rejected Job Offers';
                        RunObject = page "Vacancies";
                    }
                    group("Administration2121")
                    {
                        caption = 'Administration';
                        action("Job Board")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Job Board';
                            RunObject = page "Job Boards";
                        }
                        action("Hobby Types")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Hobby Types';
                            RunObject = page "Hobby Types";
                        }
                        action("Disability Code")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Disability Code';
                            RunObject = page "Disability Code";
                        }
                        action("Ethnic Groups")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Ethnic Groups';
                            RunObject = page "Ethnic Groups";
                        }
                        action("System Shortlisted Application")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'System Shortlisted Application';
                            RunObject = page "System Shortlisted Application";
                        }
                        action("Background Checks")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Background Checks';
                            RunObject = page "Background Checks";
                        }
                        action("Medical Check Reports")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Medical Check Reports';
                            RunObject = page "Medical Check Reports";
                        }
                        action("Apptitude Question")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Apptitude Question';
                            RunObject = page "Apptitude Question";
                        }
                        action("Ability Test Responses")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Ability Test Responses';
                            RunObject = page "Ability Responses";
                        }
                        action("Interview Scoresheet Templates")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Interview Scoresheet Templates';
                            RunObject = page "Interview Scoresheet Templates";
                        }

                        action("Medical History Setup")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Medical History Setup';
                            RunObject = page "Medical History Setup";
                        }
                        action("Medical Examination Type")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Medical Examination Type';
                            RunObject = page "Medical Examination Type";
                        }
                        action("Referee Recommendation")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Referee Recommendation';
                            RunObject = page "Referee Recommendation";
                        }
                        action("Medical Check Templates")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Medical Check Templates';
                            RunObject = page "Medical Check Templates";
                        }
                        action("Shortlisting Score Code")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Shortlisting Score Code';
                            RunObject = page "Shortlisting Score Code";
                        }

                    }

                }
                group("Appointment & Onboarding")
                {
                    action("Employees23")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employees';
                        RunObject = page "Employee List";
                    }
                    action("Employee Contracts")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Contracts';
                        RunObject = page "Contract List";
                    }
                    action("Employment Offers")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employment Offers';
                        RunObject = page "Employment Offers";
                    }
                    action("Terminated Employee Contracts")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Terminated Employee Contracts';
                        RunObject = page "Employee List";
                    }
                    action("Employee Statistics Groups1")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Statistics Groups';
                        RunObject = page "Employee Statistics Groups";
                    }
                    action("Employee Contract Groups")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Contract Groups';
                        RunObject = page "Employee Statistics Groups";
                    }

                }
            }
            group("Lease Management")
            {
                Caption = 'Lease Management';
                group("Lease Managements")
                {
                    action("Property List ")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Property List ';
                        RunObject = page "Property List";
                    }
                    action("Property Item List")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Property Item List';
                        RunObject = page "Property Item List";
                    }
                    action("Property Customer List")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Tenant List';
                        RunObject = page "Property Customer List";
                    }

                    action("Property Contracts List")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Lease Agreement List';
                        RunObject = page "Property Contracts List";
                    }
                    action("Service Invoices")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Service Invoices';
                        RunObject = page "Service Invoices";
                    }


                }
            }

            group("Succession Planning")
            {
                Caption = 'Career and Succession Planning';
                group("Career & Succession Planning")
                {
                    action("Succession Plan Header")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Succession Plans';
                        RunObject = page "Succession Plan Header";
                    }
                    action("Succession Log Header")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Succession Log';
                        RunObject = page "Succession Log Header";
                    }
                    action("Approved Succession Plan")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Approved Succession Plans';
                        RunObject = page "Approved Succession Plan";
                    }

                    action("Succession Template")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Succession Template';
                        RunObject = page "Succession Template";
                    }
                    action("Succession Template Category")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Succession Template Category';
                        RunObject = page "Succession Template Category";
                    }


                }
            }

            group("LeaveManagement")
            {
                Caption = 'Leave Management';
                group("Setup")
                {
                    action("HRLeavePeriods")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'HR Leave Periods';
                        RunObject = page "HR Leave Periods";
                    }
                    action("Base Leave Calender")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Base Leave Calender';
                        RunObject = page "Base Calendar Card";
                    }
                    action("HRLeaveTypes")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'HR Leave Types';
                        RunObject = page "HR Leave Types";
                    }

                    action("Leave Adjustment")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Leave Adjustment';
                        RunObject = page "HR Leave Adjustment";
                    }
                    action("Leave Batches")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Leave Batches';
                        RunObject = page "HR Leave Batches";
                    }

                }

                group("Leave Management List")
                {
                    action("Leave Application")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Leave Applications';
                        RunObject = page "Leave Applications List";
                    }
                    action("Leave Planner List")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Leave Planner List';
                        RunObject = page "Leave Planner List";
                    }
                    action("Employee Leave Balances")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Leave Balances';
                        RunObject = page "Employee Leave Balances";
                    }

                    action("ApprovedLeave Applications")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Approved Leave Applications';
                        RunObject = page "Approved Leave Applications";
                    }
                    action("Leave Recall Applications")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Leave Application Recall';
                        RunObject = page "Leave Application Recall";
                    }
                    action("Posted Leave Applications")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Posted Leave Applications';
                        RunObject = page "Posted Leave Applications..";
                    }
                    action(HRApprovedLeaveReimbursements)
                    {
                        Caption = 'HR Leave Reimbursement';
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "HR Leave Reimbursements List";
                        RunPageView = WHERE("Application Type" = filter("Re-Imbursement"));
                    }
                    action(HRApprovedLeave)
                    {
                        Caption = 'Time-Off Lieu Applications';
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "HR Leave Reimbursements List";
                        RunPageView = WHERE("Application Type" = filter("Time Off Lie"));
                    }
                    action(HRLeaveApplicatio)
                    {
                        Caption = 'Paternity / Maternity Notification Applications';
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "HR Leave Reimbursements List";
                        RunPageView = WHERE("Application Type" = filter("Paternity" | "Maternity"));
                    }
                    action(HRApprovedLeaveCarryForward)
                    {
                        Caption = 'Leave Carry Forward Applications';
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "HR Leave Reimbursements List";
                        RunPageView = WHERE("Application Type" = filter("Carry Forward"));
                    }
                    action(HRApprovedLeaveOther)
                    {
                        Caption = 'Other Leave Applications';
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "HR Leave Reimbursements List";
                        RunPageView = WHERE("Application Type" = filter(Normal));
                    }
                }
                group("Reports999999")
                {
                    Caption = 'Reports';
                    action("Leave Application Form")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Leave Application Form';
                        // RunObject = Report "Leave Application Form";
                    }
                    action("Employee Leave Trend Analysis")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Leave Trend Analysis';
                        //RunObject = Report "Leave Trend Analysis";
                    }
                    action("Employee Leave Balance")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Leave Balances';
                        //RunObject = Report "HR Leave Balance";
                    }
                    action("Employee Leave Allowance Payment Status")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Leave Allowance Payment Status';
                        //RunObject = Report "HR Leave Allowance Status";
                    }
                    // action("HR Leave Liability Report KURA")
                    // {
                    //     ApplicationArea = BasicHR;
                    //     Caption = 'HR Leave Liability Report KURA';
                    //     //RunObject = Report "HR Leave Liability Report KeRR";
                    // }
                }

            }
            group("Discplinary Case Management")
            {
                Caption = 'Discplinary Case Management';
                action("Employee Discplinary List")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Employee Discplinary List';
                    RunObject = page "Hr New Discplinary List";
                }
                action("Discplinary Files List")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Discplinary Files List';
                    RunObject = page "Hr Discplinary List";
                }

                action("Disciplinary Committee")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Disciplinary Committee';
                    //RunObject = page "Disciplinary Committee";
                }
                action("Disciplinary Deduction Setup")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Disciplinary Deduction Setup';
                    RunObject = page "Disciplinary Status";
                }
                group("Reports2323")
                {
                    Caption = 'Reports';
                    action("Disciplinary Cases Report")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Disciplinary Cases Report';
                        //  RunObject = report "HR Cases Report";
                    }
                    action("Disciplinary Cases Report per Employee")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Disciplinary Cases Report per Employee';
                        //RunObject = Report "HR Cases Report - Employee Bas";
                    }
                    action("Disciplinary Cases Report per Dept")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Disciplinary Cases Report per Dept';
                        //RunObject = Report "HR Cases Report - Dept Based";
                    }

                }


            }
            group("Overtime Management")
            {
                Caption = 'Overtime Management';
                action("Overtime List")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Overtime List';
                    RunObject = page "Overtime List";
                }
                action("Approved Overtime")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Approved Overtime';
                    RunObject = page "Approved Overtime List";
                }
                action("Overtime Report")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Overtime Report';
                    //  RunObject = report "Overtime Report";
                }
                action("Overtime Types")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Overtime Types';
                    RunObject = page "Overtime Types";
                }
            }
            group("Absence Registration")
            {
                Caption = 'Absence Registration';
                action("Causes of Absence")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Causes of Absence';
                    RunObject = page "Causes of Absence";
                }
                action("Absence Registration12")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Absence Registration';
                    RunObject = page "Absence Registration";
                }
                action("Staff Absences")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Staff Absences';
                    RunObject = report "Employee - Staff Absences";
                }
                action("Employee Absences by Causes")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Employee Absences by Causes';
                    RunObject = report "Employee - Absences by Causes";
                }
            }


            group("Group")
            {
                Caption = 'Employees';
                action("Employees")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Employees';
                    RunObject = page "Employee List";
                }
                action("Absence Registration1")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Absence Registration';
                    RunObject = page "Absence Registration";

                }
                group("Group1")
                {
                    Caption = 'Reports';
                    action("Employee - Absences by Causes")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Absences by Causes';
                        //   RunObject = report "Employee - Absences by Causes";
                    }
                    action("Employee - Addresses")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Addresses';
                        RunObject = report "Employee - Addresses";
                    }
                    action("Employee - Alt. Addresses")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Alt. Addresses';
                        RunObject = report "Employee - Alt. Addresses";
                    }
                    action("Employee - Birthdays")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Birthdays';
                        RunObject = report "Employee - Birthdays";
                    }
                    action("Employee - Confidential Info.")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Confidential Info.';
                        RunObject = report "Employee - Confidential Info.";
                    }
                    action("Employee - Contracts")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Contracts';
                        RunObject = report "Employee - Contracts";
                    }
                    action("Employee - Labels")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Labels';
                        RunObject = report "Employee - Labels";
                    }
                    action("Employee - List")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee List';
                        RunObject = report "Employee - List";
                    }
                    action("Employee - Misc. Article Info.")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Misc. Article Info.';
                        RunObject = report "Employee - Misc. Article Info.";
                    }
                    action("Employee - Qualifications")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Qualifications';
                        RunObject = report "Employee - Qualifications";
                    }
                    action("Employee - Relatives")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Relatives';
                        RunObject = report "Employee - Relatives";
                    }
                    action("Employee - Staff Absences")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Staff Absences';
                        // RunObject = report "Employee - Staff Absences";
                    }
                    action("Employee - Unions")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Employee Unions';
                        RunObject = report "Employee - Unions";
                    }
                }
            }
            group("Occupational Safety & Health")
            {
                group("OSH Governance & Planning")
                {
                    group("Lists and Tasks")
                    {
                        action("Board")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Board';
                            RunObject = page 80014;
                        }
                        action("Directorates")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Directorates';
                            RunObject = page 80016;
                        }
                        action("Sections")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Sections';
                            RunObject = page 80020;
                        }
                        action("OSH Mnagement Roles")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'OSH Mnagement Roles';
                            RunObject = page 69496;
                        }
                        action("Employees1")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Employees';
                            RunObject = page 5201;
                        }
                        action("Projects")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Projects';
                            RunObject = page 89;
                        }
                        action("OSH Framework")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'OSH Framework';
                            RunObject = page 69400;
                        }
                        action("OSH Management Plans")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'OSH Management Plans';
                            RunObject = page 69447;
                        }
                    }
                    group("Report & Analysis")
                    {
                        action("OSH Framework Summary")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'OSH Framework Summary';
                            //  RunObject = report 69450;
                        }
                        action("OSH Mnagement Plan Summary")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'OSH Mnagement Plan Summary';
                            //  RunObject = report 69451;
                        }
                    }
                    group("Administration")
                    {
                        action("Hazard Types")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Hazard Types';
                            RunObject = page 69401;
                        }
                        action("Hazard Identification Methods")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Hazard Identification Methods';
                            RunObject = page 69427;
                        }
                        action("Evacuation Events1")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Evacuation Events';
                            RunObject = page "Evacuation Events";
                        }
                        action("Workplace Prohibited Items")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Workplace Prohibited Items';
                            RunObject = page "Workplace Prohibited Items";
                        }
                        action("HSE Equipment Categorxies")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'HSE Equipment Categories';
                            //  RunObject = page 69423;
                        }
                        action("Safe Work Permit Types1")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Safe Work Permit Types';
                            RunObject = page 69413;
                        }
                        action("Safety Workgroups")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Safety Workgroups';
                            //  RunObject = page 69419;
                        }
                        action("Safety Rules & Regulations Templates")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Safety Rules & Regulations Templates';
                            RunObject = page 69432;
                        }
                        action("Safety Inspection Templates1")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Safety Inspection Templates';
                            RunObject = page 69439;
                        }
                        action("OSH Legal Instruments")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'OSH Legal Instruments';
                            RunObject = page "OSH Legal Instruments";
                        }
                        action("Incident Severity Levels1")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Incident Severity Levels';
                            RunObject = page 69490;
                        }
                        action("Incident Party Types1")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Incident Party Levels';
                            RunObject = page 69492;
                        }
                    }
                }
                group("OSH Operations")
                {
                    group("Lists and Tasks1")
                    {
                        caption = 'Lists and Tasks';
                        action("Safety Eequipment Register")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Safety Eequipment Register';
                            RunObject = page 69470;
                        }
                        action("OSH Training Register")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'OSH Training Register';
                            RunObject = page 69566;
                        }
                        action("OSH Meeting Register")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'OSH Meeting Register';
                            RunObject = page 69565;
                        }
                        action("Hazard Insurance Register")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Hazard Insurance Register';
                            RunObject = page 69470;
                        }
                        action("Safe Work Permit Applications")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Safe Work Permits';
                            RunObject = page 69482;
                        }
                        action("Safe Work Completion Reports")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Safe Work Permits COM';
                            RunObject = page 69507;
                        }
                        action("Emergency Drill Logs")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Emergency Drill Reports';
                            RunObject = page "Emergency Drill Logs";
                        }
                        action("Risk Incident Reports")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'Risk Incident Reports';
                            RunObject = page 95104;
                        }
                        action("OSH Inspection Vouchers")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'OSH Inspection Vouchers';
                            RunObject = page 69532;
                        }
                        action("OSH Status Reports")
                        {
                            ApplicationArea = BasicHR;
                            Caption = 'OSH Status Reports';
                            RunObject = page 69439;
                        }

                        group("Reports & Analysis")
                        {
                            action("Safety Equipment List")
                            {
                                ApplicationArea = BasicHR;
                                Caption = 'Safety Equipment List';
                                //  RunObject = report 69459;
                            }
                            action("OSH Training List")
                            {
                                ApplicationArea = BasicHR;
                                Caption = 'OSH Training List';
                                // RunObject = page 69460;
                            }
                            action("OSH Meeting  List")
                            {
                                ApplicationArea = BasicHR;
                                Caption = 'OSH Meeting  List';
                                // RunObject = page 69461;
                            }
                            action("Hazard Insurance List")
                            {
                                ApplicationArea = BasicHR;
                                Caption = 'Hazard Insurance List';
                                // RunObject = page 69462;
                            }
                            action("Safe Work Permit Application  List")
                            {
                                ApplicationArea = BasicHR;
                                Caption = 'Safe Work Permit Application  List';
                                // RunObject = page 69463;
                            }
                            action("Emergency Drill List")
                            {
                                ApplicationArea = BasicHR;
                                Caption = 'Emergency Drill List';
                                // RunObject = page 69464;
                            }
                            action("Risk Incident Log List")
                            {
                                ApplicationArea = BasicHR;
                                Caption = 'Risk Incident Log List';
                                // RunObject = page 69465;
                            }
                            action("OSH Inspection List")
                            {
                                ApplicationArea = BasicHR;
                                Caption = 'OSH Inspection List';
                                // RunObject = page 69466;
                            }
                            group("Archieve")
                            {
                                action("Issued Safe Work Permits")
                                {
                                    ApplicationArea = BasicHR;
                                    Caption = 'Issued Safe Work Permits';
                                    RunObject = page "Safe Work Permits";
                                }
                                action("Denied Safe Work Permits")
                                {
                                    ApplicationArea = BasicHR;
                                    Caption = 'Denied Safe Work Permits';
                                    RunObject = page "Safe Work Permits";
                                }
                                action("Posted Emergency Drills")
                                {
                                    ApplicationArea = BasicHR;
                                    Caption = 'Posted Emergency Drills';
                                    RunObject = page "Emergency Drill Logs";
                                }

                                action("Posted Risk Incident Reports")
                                {
                                    ApplicationArea = BasicHR;
                                    Caption = 'Posted Risk Incident Reports';
                                    RunObject = page "Risk Incident Logs";
                                }
                                action("Posted OSH Inspection Vouchers")
                                {
                                    ApplicationArea = BasicHR;
                                    Caption = 'Posted OSH Inspection Vouchers';
                                    RunObject = page "Inspection Templates";
                                }
                            }


                        }
                        group("Administration1")
                        {
                            Caption = 'Administration';
                            action("Safety Equipment Categories")
                            {
                                ApplicationArea = BasicHR;
                                Caption = 'Safety Equipment Categories';
                                //RunObject = page "HSE Equipment Categorxies";
                            }
                            action("Hazard Types1")
                            {
                                ApplicationArea = BasicHR;
                                Caption = 'Hazard Types';
                                RunObject = page 69401;
                            }
                            action("Safe Work Permit Types")
                            {
                                ApplicationArea = BasicHR;
                                Caption = 'Safe Work Permit Types';
                                RunObject = page "Safe Work Permit Types";
                            }
                            action("Evacuation Events")
                            {
                                ApplicationArea = BasicHR;
                                Caption = 'Evacuation Events';
                                RunObject = page "Evacuation Events";
                            }
                            action("Incident Severity Levels")
                            {
                                ApplicationArea = BasicHR;
                                Caption = 'Incident Severity Levels';
                                RunObject = page "Incident Severity Levels";
                            }
                            action("Safety Inspection Templates")
                            {
                                ApplicationArea = BasicHR;
                                Caption = 'Safety Inspection Templates';
                                RunObject = page "Inspection Templates";
                            }

                        }


                    }
                }
            }
            group("Group2")
            {
                Caption = 'Setup';
                action("Human Resources Setup")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Human Resources Setup';
                    RunObject = page "Human Resources Setup";
                }
                action("Human Resources Units of Measu")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Human Resources Units of Measure';
                    RunObject = page "Human Res. Units of Measure";
                }
                action("Causes of Inactivity")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Causes of Inactivity';
                    RunObject = page "Causes of Inactivity";
                }
                action("Grounds for Termination")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Grounds for Termination';
                    RunObject = page "Grounds for Termination";
                }
                action("Unions")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Unions';
                    RunObject = page "Unions";
                }
                action("Employment Contracts")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Employment Contracts';
                    RunObject = page "Employment Contracts";
                }
                action("Relatives")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Relatives';
                    RunObject = page "Relatives";
                }
                action("Misc. Articles")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Employee Misc. Articles';
                    RunObject = page "Misc. Articles";
                }
                action("Confidential")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Confidential';
                    RunObject = page "Confidential";
                }
                action("Qualifications")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Qualifications';
                    RunObject = page "Qualifications";
                }
                action("Employee Statistics Groups")
                {
                    ApplicationArea = BasicHR;
                    Caption = 'Employee Statistics Groups';
                    RunObject = page "Employee Statistics Groups";
                }
            }
            group(AppraisalGroup)
            {
                Caption = 'Performance Management';
                //Image = HumanResources;
                group("Setups")
                {
                    action(HRAppraisalPeriods)
                    {
                        Caption = 'HR Appraisal Periods';
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Appraisal Period";
                    }
                    action(HRAppraisalSetup)
                    {
                        Caption = 'SPM Setup';
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Strategy General Setup";
                    }
                    action("Performance Management Plans")
                    {
                        Caption = 'Performance Management Plans';
                        ApplicationArea = Basic, Suite;
                        RunObject = Page "Performance Management Plans";
                    }
                    action(HRAppraisalDepartments)
                    {
                        Caption = 'Appraisal Types';
                        ApplicationArea = Basic, Suite;
                        //  RunObject = Page "Appraisal Types";
                        Visible = false;
                    }


                    action("Performance Evaluation Template")
                    {
                        ApplicationArea = Basic;
                        RunObject = Page "Perfomance Evaluation Template";
                    }
                    // action("Competency Perfomance Template")
                    // {
                    //     ApplicationArea = Basic;
                    //     RunObject = Page 80108;
                    // }
                    action("Performance Rating Scale")
                    {
                        ApplicationArea = Basic;
                        RunObject = Page "Perfomance Rating Scale";
                    }
                    action("Proficiency Rating Scale")
                    {
                        ApplicationArea = Basic;
                        RunObject = Page "Proficiency Scale Line";
                    }
                    action("Appraisal Questionnaire Template")
                    {
                        ApplicationArea = Basic;
                        RunObject = Page "Appraisal Questionnaire Temp";
                    }
                    action("Performance Policy & Guidelines")
                    {
                        ApplicationArea = Basic;
                        RunObject = Page "Policy & Guidelines";
                    }
                }
                group("Target Setting & Reporting")
                {
                    action("Strategic Plans")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Corporate Strategic Plans';
                        RunObject = Page "Corporate Strategic Plans";
                        ToolTip = 'Combine various financial data sources to find out when a cash surplus or deficit might happen or whether you should pay down debt, or borrow to meet upcoming expenses.';
                    }
                    action("Corporate Annual Workplans")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Corporate Annual Workplans';
                        RunObject = Page "Annual Strategy Workplans";
                        ToolTip = 'Combine various financial data sources to find out when a cash surplus or deficit might happen or whether you should pay down debt, or borrow to meet upcoming expenses.';
                    }
                    action("Annual Performance Contract")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Annual Performance Contract';
                        RunObject = Page "Board/Executive PCs";
                        ToolTip = 'Combine various financial data sources to find out when a cash surplus or deficit might happen or whether you should pay down debt, or borrow to meet upcoming expenses.';
                    }
                    action("Functional Annual Work Plans")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Functional Annual Work Plans';
                        RunObject = Page "Functional/Operational PCs";
                        ToolTip = 'Combine various financial data sources to find out when a cash surplus or deficit might happen or whether you should pay down debt, or borrow to meet upcoming expenses.';
                    }

                    action("Annual Strategic Plan")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Consolidated Annual Work Plans';
                        RunObject = Page "Annual Strategy Workplans";
                        ToolTip = 'Combine various financial data sources to find out when a cash surplus or deficit might happen or whether you should pay down debt, or borrow to meet upcoming expenses.';
                    }
                    // action("Board Annual Workplan")
                    // {
                    //     ApplicationArea = Basic, Suite;
                    //     Caption = 'Board Annual Workplan';
                    //     RunObject = Page "Board/Executive PCs";
                    //     Visible = false;

                    //     ToolTip = 'Combine various financial data sources to find out when a cash surplus or deficit might happen or whether you should pay down debt, or borrow to meet upcoming expenses.';
                    // }
                    // action("DG/CEO Annual Workplan")
                    // {
                    //     ApplicationArea = Basic, Suite;
                    //     Caption = 'DG/CEO Annual Workplan';
                    //     RunObject = Page "CEO/Corporate PCs";
                    //     Visible = FALSE;
                    //     ToolTip = 'Combine various financial data sources to find out when a cash surplus or deficit might happen or whether you should pay down debt, or borrow to meet upcoming expenses.';
                    // }
                    action("Functional Objective Templates")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Functional Objective Templates';
                        RunObject = Page 80080;
                        ToolTip = 'Combine various financial data sources to find out when a cash surplus or deficit might happen or whether you should pay down debt, or borrow to meet upcoming expenses.';
                    }


                }
                group("Performance Contracts")
                {
                    action("Directors Annual Workplan")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Directors Annual Workplan';
                        RunObject = Page "Directors Perfomance Contracts";
                        ToolTip = 'Combine various financial data sources to find out when a cash surplus or deficit might happen or whether you should pay down debt, or borrow to meet upcoming expenses.';
                    }
                    action("Department/Region Annual Workplan")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Department/Region Annual Workplan';
                        RunObject = Page 80366;

                    }
                    action("Principal Officer Annual Workplan")
                    {
                        ApplicationArea = Basic, Suite;
                        Caption = 'Principal Officer Annual Workplan';
                        RunObject = Page 80409;
                    }
                    action("Senior Officer Annual Workplan")
                    {
                        ApplicationArea = Basic, Suite;
                        // Caption ='Functional Objective Template';
                        RunObject = Page 80411;

                    }
                    action("Staff Annual Workplan")
                    {
                        ApplicationArea = Basic, Suite;
                        // Caption ='Functional Objective Template';
                        RunObject = Page 80082;

                    }
                }
                group("Performance Appraisal")
                {
                    group("Standard Appraisal")
                    {
                        action(Q1Requests)
                        {
                            Caption = 'Standard Appraisal';
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Standard Perfomance Appraisal";
                        }
                        action(Q2Requests)
                        {
                            Caption = 'Standard Appraisal-Evaluation';
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Standard Perform Appraisal-E";
                        }
                        action(Q3Requests)
                        {
                            Caption = 'Submitted Standard Appraisal';
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Standard Appraisal-Submitted";
                        }
                        action(Q4Requests)
                        {
                            Caption = 'Closed Standard Appraisal';
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Standard Appraisal-Closed";
                        }
                    }
                    group("Employee-Supervisor Appraisal")
                    {
                        action("Self-Supervisor")
                        {
                            Caption = 'Self-Supervisor Appraisal';
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Self-Supervisor Appraisal";
                        }
                        action("Self-Supervisor Evaluation")
                        {
                            Caption = 'Self-Supervisor Under Evaluation';
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Self-Supervisor Appraisal-E";
                        }
                        action("Self-Supervisor Submitted")
                        {
                            Caption = 'Submitted Self-Supervisor Appraisal';
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Self-Supervisor Appraisals-Sub";
                        }
                        action("Self-Supervisor Closed")
                        {
                            Caption = 'Closed Self-Supervisor Appraisal';
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "SelfSupervisorAppraisal-Closed";
                        }
                    }
                    group("360 Degree Appraisal")
                    {
                        action("360 Degree")
                        {
                            Caption = '360 Degree Appraisal';
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Group Appraisals";
                        }
                        action("Group Appraisal Under")
                        {
                            Caption = 'Group Appraisal Under Evaluation';
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Group Appraisal-Evaluations";
                        }
                        action("Submitted Group Appraisal")
                        {
                            Caption = 'Submitted Group Appraisal';
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Group Appraisal-Submitted";
                        }
                        action("Closed Group Appraisal")
                        {
                            Caption = 'Closed Group Appraisal';
                            ApplicationArea = Basic, Suite;
                            RunObject = Page "Group Appraisal-Closed";
                        }
                    }
                }
                // group("Budget Allignment")
                // {
                //     action("Budget Allignment List")
                //     {
                //         ApplicationArea = Basic, Suite;
                //         // Caption ='Functional Objective Template';
                //         // RunObject = Page "Budget Consolidation List";
                //     }
                // }
                group(Archive)
                {
                    action("Approved Annual Plan")
                    {
                        ApplicationArea = Basic, Suite;
                        // Caption ='Functional Objective Template';
                        // RunObject = Page  ;

                    }
                    action("Approved Strategic Plan")
                    {
                        ApplicationArea = Basic, Suite;
                        // Caption ='Functional Objective Template';
                        RunObject = Page 80193;

                    }
                    action("Approved Departmental Workplans")
                    {
                        ApplicationArea = Basic, Suite;
                        // Caption ='Functional Objective Template';
                        //  RunObject = Page "Approved Dept Annual Workplans";
                    }

                    action("Approved Annual Work Plans")
                    {
                        ApplicationArea = Basic, Suite;
                        // Caption ='Functional Objective Template';
                        RunObject = Page 80197;

                    }

                    action("Approved Board Annual Work Plans")
                    {
                        ApplicationArea = Basic, Suite;
                        // Caption ='Functional Objective Template';
                        //  RunObject = Page 99408;
                        Visible = false;

                    }
                    action("Approved Functional Objective Templates")
                    {
                        ApplicationArea = Basic, Suite;
                        // Caption ='Functional Objective Template';
                        RunObject = Page 80361;

                    }
                    action("Appoved Directors Annual Workplans")
                    {
                        ApplicationArea = Basic, Suite;
                        // Caption ='Functional Objective Template';
                        RunObject = Page 80379;

                    }
                    action("Approved Departmental/Region Annual Workplans")
                    {
                        ApplicationArea = Basic, Suite;
                        // Caption ='Functional Objective Template';
                        RunObject = Page 80378;


                    }
                    action("Approved  Strategic Plans")
                    {
                        ApplicationArea = Basic, Suite;
                        // Caption ='Functional Objective Template';
                        RunObject = Page 80193;

                    }
                    action("Approved Staff Annual Workplan")
                    {
                        ApplicationArea = Basic, Suite;
                        // Caption ='Functional Objective Template';
                        RunObject = Page 80363;

                    }
                }

            }
            group("Training Management")
            {
                Caption = 'Training Management';
                group("Training Setup")
                {
                    Caption = 'Training Setup';
                    action("Setups2")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Setups';
                        RunObject = page 69314;
                    }
                    action("Training Goal")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Training Goal';
                        RunObject = page 69304;
                    }
                    action("Training Domains")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Training Domains';
                        RunObject = page "Training Domains";
                    }
                    action("Training Courses")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Training Courses';
                        RunObject = page "Training Courses Setup";
                    }
                    action("Training Service Providers")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Training Service Providers';
                        RunObject = page "Training Service Providers";
                    }
                    action("Rating Category setup")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Feedback Rating Category';
                        RunObject = page "Rating Category Setup";
                    }
                    action("Competency Perfomance Template")
                    {
                        ApplicationArea = Basic;
                        RunObject = Page 80108;
                    }
                    action(RatingScales)
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Rating Scales';
                        RunObject = page "Rating Scales";
                    }
                    action(CategoryRatingScale)
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Category Rating Scale';
                        RunObject = page "Category Rating Scale";
                    }
                    action(TrainingNeedCategories)
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Training Need Categories';
                        RunObject = page "Training Need Categories";
                    }
                    action("Evaluation Category Setup")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Evaluation Category Setup';
                        RunObject = page "Evaluation Category Setup";
                    }
                    action("Evaluation Rating Scale")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Evaluation Rating Scale';
                        RunObject = page "Evaluation Rating Scale";
                    }
                }
                group("Training Needs Register")
                {
                    caption = 'Training Needs Register';
                    action(TrainingNeeds)
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Training Needs';
                        RunObject = page 69309;

                    }
                    action("Training Needs Request")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Training Needs Requests';
                        RunObject = page "Training Need Requests";

                    }
                    action("Submitted Training Needs")
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Submitted Training Needs';
                        RunObject = page 65152;

                    }
                }
                group("Training Planning")
                {
                    Caption = 'Training Planning';
                    action(TrainingPlans)
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Training Plans';
                        RunObject = page 69194;

                    }
                    action(ApprovedTrainingPlans)
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Approved Training Plans';
                        RunObject = page 69199;

                    }

                }
                group("Training Application")
                {
                    caption = 'Training Applications';
                    action(TrainingApplicationList)
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Training Application List';
                        RunObject = page 69220;
                    }
                    action(ApprovedTrainingApplicationList)
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Approved Training Applications';
                        RunObject = page 69280;
                    }
                    action(ProcessedTrainingApplicationList)
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Processed Training Applications';
                        RunObject = page 69282;
                    }
                }
                group("Back To Office")
                {
                    caption = 'Training FeedBack';
                    action(Training)
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Training Feedback';
                        RunObject = page "Training Feedback";
                    }
                    action(TrainingEvaluation)
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Training Evaluation';
                        RunObject = page "Training Evaluation";
                    }
                    action(TrainingFeedback)
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Submitted Training Feedback';
                        RunObject = page "Submitted Training Feedback";
                    }

                }
                group("Reports")
                {
                    caption = 'Reports';
                    action(AnnualTrainingPlans)
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Annual Training Plans';
                        // RunObject = report 69145;
                    }
                    action(TotalsTrainingsPerEmployee)
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Totals Trainings Per Employee';
                        // RunObject = report 69111;
                    }
                    action(DepartmentalTraining)
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Departmental Trainings';
                        // RunObject = report 69112;
                    }
                    action(AnnualTrainingPlansStatistics)
                    {
                        ApplicationArea = BasicHR;
                        Caption = 'Annual Training Plans Statistics';
                        // RunObject = report 69114;
                    }
                }

            }
            group(FleetManagement)
            {
                Caption = 'Fleet Management';
                Image = HumanResources;
                group(VehicleReq)
                {
                    Caption = 'Vehicle Requisition Management';
                    action("FleetManagementSetup")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Fleet Management Setup';
                        Image = AccountingPeriods;
                        RunObject = Page "Fleet Management Setup";
                        ToolTip = 'Executes the Fleet Management Setup action.';
                    }
                    action("Fleet Vehicles")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Fleet Vehicles';
                        Image = Employee;
                        RunObject = Page "Fleet Vehicles List";
                        ToolTip = 'Executes the Fleet Vehicles action.';
                    }
                    action("Fleet Drivers")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Fleet Drivers';
                        Image = Employee;
                        RunObject = Page "Fleet Drivers List";
                        ToolTip = 'Executes the Fleet Drivers action.';
                    }
                    action("Requisition List")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Transport Requisition List';
                        Image = Employee;
                        RunObject = page "Fleet Requisition List";
                        ToolTip = 'Executes the Approved Work Tickets action.';
                    }
                    action("Pending Fleet Requests")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Pending Fleet Requests';
                        Image = Employee;
                        RunObject = page "Pending Fleet Requests list";
                        ToolTip = 'Executes the Approved Work Tickets action.';
                    }
                    action("Approved Fleet Requests")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Approved Fleet Requests';
                        Image = Employee;
                        RunObject = Page "Approved Fleet Requests List";
                        ToolTip = 'Executes the Approved Fleet Requests action.';
                    }

                    action("DriversInactive")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Inactive Drivers';
                        Image = Employee;
                        RunObject = page "Fleet Drivers List";
                        RunPageView = where(Active = const(true));
                        ToolTip = 'Executes the Approved Work Tickets action.';
                    }
                    action("Fleet Requisition Report")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Fleet Requisition Report';
                        Image = Report2;
                        RunObject = report "Fleet Requisition Report";
                        ToolTip = 'Executes the Approved Work Tickets action.';
                    }
                    action("Closed Fleet Requests")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Closed Fleet Requests';
                        Image = Camera;
                        RunObject = page "Closed Fleet Requests List";
                        ToolTip = 'Executes the Approved Work Tickets action.';
                    }
                }
                group(WorkTicket)
                {
                    Caption = 'Work Ticket Management';
                    action("Work Tickets")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Work Tickets';
                        Image = Employee;
                        RunObject = Page "Daily Work Ticket List";
                        ToolTip = 'Executes the Approved Work Tickets action.';
                    }
                    action("Approved Work Tickets")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Approved Work Tickets';
                        Image = Employee;
                        RunObject = Page "Approved Daily Work Ticket Lis";
                        ToolTip = 'Executes the Approved Work Tickets action.';
                    }
                    action("Closed Work Tickets")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Closed Work Tickets';
                        Image = Employee;
                        RunObject = Page "Closed Daily Work Ticket";
                        ToolTip = 'Executes the Approved Work Tickets action.';
                    }
                }
                group("VehicleMaint")
                {
                    Caption = 'Vehicle Maintenance';
                    action("Maintenance Requests")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Maintenance Requests';
                        Image = Employee;
                        RunObject = Page "Maintenance Requests list";
                        ToolTip = 'Executes the Approved Work Tickets action.';
                    }
                    action("Pending Maintenance Requests")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Pending Maintenance Requests';
                        Image = Employee;
                        RunObject = Page "Pending Maintenance Requests";
                        ToolTip = 'Executes the Approved Work Tickets action.';
                    }
                    action("Approved Maintenance Requests")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Approved Maintenance Requests';
                        Image = Employee;
                        RunObject = Page "Approved Maintenance Requests";
                        ToolTip = 'Executes the Approved Work Tickets action.';
                    }
                    action("Maintenance Report")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Maintenance Report';
                        Image = Report2;
                        RunObject = report "Fuel and Maintenance Report";
                        ToolTip = 'Executes the Approved Work Tickets action.';
                    }
                }
                group("Insurance Management")
                {
                    Caption = 'Fleet Insurance Management';
                    action("Insurance")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Insurance Types';
                        Image = Employee;
                        RunObject = Page "Insurance Types";
                        ToolTip = 'Executes the Approved Work Tickets action.';
                    }
                    action("Vehicle Insurance")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Vehicle Insurance List';
                        Image = Employee;
                        RunObject = Page "Vehicle Insurance List";
                        ToolTip = 'Executes the Approved Work Tickets action.';
                    }
                    action("Vehicle Insurance Due")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Vehicle Insurance Due Expiry';
                        Image = Employee;
                        RunObject = Page "Vehicle Insurance Due Expiry";
                        ToolTip = 'Executes the Approved Work Tickets action.';
                    }
                    action("Expired Vehicle Insurance")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Expired Vehicle Insurance';
                        Image = Employee;
                        RunObject = Page "Expired Vehicle Insurance";
                        ToolTip = 'Executes the Approved Work Tickets action.';
                    }
                    action("Insurance Report")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Fleet Vehicle Insurance Report';
                        Image = Report2;
                        RunObject = report "Fleet Vehicle Insurance Report";
                        ToolTip = 'Executes the Approved Work Tickets action.';
                    }
                    action("Blocked Vehicle Insurance")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Blocked Vehicle Insurance';
                        Image = Employee;
                        RunObject = Page "Blocked Vehicle Insurance";
                        ToolTip = 'Executes the Approved Work Tickets action.';
                    }
                }
                group("Fuel")
                {
                    Caption = 'Fuel Management';
                    action("Fuel Card")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Fuel Card';
                        Image = Employee;
                        RunObject = Page "Fuel Card List";
                        ToolTip = 'Executes the Approved Work Tickets action.';
                    }
                    action("Pending Fuel Requests")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Pending Fuel Requests';
                        Image = Employee;
                        RunObject = Page "Pending Fuel Requests";
                        ToolTip = 'Executes the Approved Work Tickets action.';
                    }
                    action("Approved Fuel Requests")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Approved Fuel Requests';
                        Image = Employee;
                        RunObject = Page "Approved Fuel Requests";
                        ToolTip = 'Executes the Approved Work Tickets action.';
                    }
                    action("Closed Fuel Requests")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Closed Fuel Requests';
                        Image = Employee;
                        RunObject = Page "Closed Fleet Requests List";
                        ToolTip = 'Executes the Approved Work Tickets action.';
                    }

                    action("Fuel  Report")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Fuel  Report';
                        Image = Report2;
                        RunObject = report "Fuel and Maintenance Report";
                        ToolTip = 'Executes the Approved Work Tickets action.';
                    }
                }
                group("Fleet Report")
                {
                    Caption = 'Fleet Reports';

                    action("Vehicles List Report")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Vehicles List  Report';
                        Image = Report2;
                        RunObject = report "Fleet Vehicles List";
                        ToolTip = 'Executes the Approved Work Tickets action.';
                    }
                    action("Vehicles Assignment Report")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Vehicles Assignment Report';
                        Image = Report2;
                        RunObject = report "Vehicles Assignment Per Driver";
                        ToolTip = 'Executes the Approved Work Tickets action.';
                    }
                    action("Fleet RequisitionReport")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Fleet Requisition Report';
                        Image = Report2;
                        RunObject = report "Fleet Requisition Report";
                        ToolTip = 'Executes the Approved Work Tickets action.';
                    }

                }

            }
            group("Welfare Management")
            {
                Caption = 'Welfare Management';
                Image = HumanResources;
                action("Request Welfare Membership")
                {
                    ApplicationArea = Basic;
                    Caption = 'Request Welfare Membership';
                    Image = Employee;
                    RunObject = Page "Requests Welfare Membership";
                    ToolTip = 'Executes the Request Welfare Membership action.';
                }
                action("Welfare Members List")
                {
                    ApplicationArea = Basic;
                    Caption = 'Welfare Members List';
                    Image = Employee;
                    RunObject = Page "Welfare Members List";
                    ToolTip = 'Executes the Welfare Members List action.';
                }
                action("Request Welfare benefit")
                {
                    ApplicationArea = Basic;
                    Caption = 'Request Welfare benefit';
                    Image = Employee;
                    RunObject = Page "Requests Welfare Benefit";
                    ToolTip = 'Executes the Request Welfare benefit action.';
                }
                action("Welfare Contributions")
                {
                    ApplicationArea = Basic;
                    Caption = 'Welfare Contributions';
                    Image = Employee;
                    RunObject = Page "Welfare Contributions";
                    ToolTip = 'Executes the Welfare Contributions action.';
                }
            }

        }
    }


}
