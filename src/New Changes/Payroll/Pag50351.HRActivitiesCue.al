page 81283 "HR Activities Cue"
{
    PageType = CardPart;
    SourceTable = "HR Activities Cue";


    layout
    {
        area(content)
        {

            cuegroup(JobsActivities)
            {
                Caption = 'Jobs Dashboard';
                ShowCaption = true;
                Visible = true;
                field("All Jobs"; "All Jobs")
                {
                    ApplicationArea = All;

                }
            }
            cuegroup(DueEmployeesGroup)
            {
                Caption = 'Staff Dashboard';
                ShowCaption = true;
                Visible = true;


                field("Staff on Leave"; "Staff on Leave")
                {
                    ApplicationArea = All;
                    Caption = 'Staff On Leave';
                }

                field("Contracts Due"; "Contracts Due")
                {
                    ApplicationArea = All;
                    Caption = 'Contracts Due';
                }

                field("Retirement Report"; "Retirement Report")
                {
                    ApplicationArea = all;
                    Caption = 'Retirement';
                }

                field("Probation Report"; "Probation Report")
                {
                    ApplicationArea = all;
                    Caption = 'Probation Report';
                }
            }


            cuegroup(EmployeeActivitiesActive)
            {
                Caption = 'Employee Dashboard';
                ShowCaption = true;
                Visible = true;
                field("Active Employees"; "Active Employees")
                {
                    ApplicationArea = All;
                    Caption = 'Active Employees';
                }
                field("In-Active Employees"; "In-Active Employees")
                {
                    ApplicationArea = All;
                    Caption = 'In-Active Employees';
                }
                field("Contract Staff"; "Contract Staff")
                {
                    ApplicationArea = all;
                    Caption = 'Contract Staff';
                }

                field("Permanent Staff"; "Permanent Staff")
                {
                    ApplicationArea = all;
                    Caption = 'Permanent Staff';
                }
                field("Seconded Staff"; "Seconded Staff")
                {
                    Caption = 'Seconded Staff';
                    ApplicationArea = all;
                }
            }


            cuegroup(EmployeeActivitiesGender)
            {
                Caption = 'Gender Dashboard';
                ShowCaption = false;
                Visible = true;


                field("Male Employees"; "Male Employees")
                {
                    ApplicationArea = All;
                    Caption = 'Male Employees';
                }

                field("Female Employees"; "Female Employees")
                {
                    ApplicationArea = All;
                    Caption = 'Female Employees';
                }
            }
        }

    }


       
    trigger OnOpenPage();
    begin

        RESET;
        IF NOT GET THEN BEGIN
            INIT;
            INSERT;
        END;
    end;
}




