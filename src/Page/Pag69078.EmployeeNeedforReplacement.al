#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69078 "Employee Need for Replacement"
{
    ApplicationArea = Basic;
    Caption = 'Terminated and Retired Employee List';
    CardPageID = "Closed Welfare Benefits";
    Editable = false;
    PageType = List;
    SourceTable = Employee;
    //SourceTableView = where(Status = filter(Terminated | Retired));
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field(FullName; Rec.FullName)
                {
                    ApplicationArea = Basic;
                    Caption = 'Full Name';
                    ToolTip = 'Specifies the value of the Full Name field.';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the employee''s first name.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the employee''s middle name.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the employee''s last name.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employee''s job title.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employment status of the employee.';
                }
                field("Termination Date"; Rec."Termination Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the date when the employee was terminated, due to retirement or dismissal, for example.';
                }
                // field("Reason for termination Code"; "Reason for termination Code")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Reason for termination Code field.';
                // }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("Posting Group"; Rec."Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting Group field.';
                }
                field("Employment Date"; Rec."Employment Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the date when the employee began to work for the company.';
                }
                field("Date Of Join"; Rec."Date Of Join")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Of Join field.';
                }
                field("Salary Scale"; Rec."Salary Scale")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Salary Scale field.';
                }
            }
        }
        area(factboxes)
        {
            part(Control3; "HR Employees Factbox")
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
                group(Dimensions)
                {
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    action("Dimensions-Single")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Dimensions-Single';
                        Image = Dimensions;
                        RunObject = Page "Default Dimensions";
                        RunPageLink = "Table ID" = const(5200),
                                      "No." = field("No.");
                        ShortCutKey = 'Shift+Ctrl+D';
                        ToolTip = 'Executes the Dimensions-Single action.';
                    }
                    action("Dimensions-&Multiple")
                    {
                        ApplicationArea = Basic;
                        Caption = 'Dimensions-&Multiple';
                        Image = DimensionSets;
                        ToolTip = 'Executes the Dimensions-&Multiple action.';
                        trigger OnAction()
                        var
                            Employee: Record Employee;
                            DefaultDimMultiple: Page "Default Dimensions-Multiple";
                        begin
                            CurrPage.SetSelectionFilter(Employee);
                            DefaultDimMultiple.SetMultiEmployee(Employee);
                            DefaultDimMultiple.RunModal;
                        end;
                    }
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
                action("Co&nfidential Information")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&nfidential Information';
                    Image = Lock;
                    RunObject = Page "Confidential Information";
                    RunPageLink = "Employee No." = field("No.");
                    ToolTip = 'Executes the Co&nfidential Information action.';
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
                separator(Action51)
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
                action("Con&fidential Info. Overview")
                {
                    ApplicationArea = Basic;
                    Caption = 'Con&fidential Info. Overview';
                    Image = ConfidentialOverview;
                    RunObject = Page "Confidential Info. Overview";
                    ToolTip = 'Executes the Con&fidential Info. Overview action.';
                }
            }
        }
    }
}

#pragma implicitwith restore
