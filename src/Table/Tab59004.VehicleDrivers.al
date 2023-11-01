#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 59004 "Vehicle Drivers"
{
    DrillDownPageID = "Fleet Drivers List";
    LookupPageID = "Fleet Drivers List";

    fields
    {
        field(1; Driver; Code[10])
        {
            TableRelation = Employee where("Employee Job Type" = const(Driver));

            trigger OnValidate()
            begin
                Emp.Reset;
                Emp.SetRange(Emp."No.", Driver);
                if Emp.Find('-') then begin
                    "Driver Name" := Emp."First Name" + ' ' + Emp."Middle Name" + ' ' + Emp."Last Name";
                    "Phone Number" := Emp."Phone No.";
                    Gender := Format(Emp.Gender);
                    Email := Emp."Company E-Mail";
                    "Job Title code" := Emp."Job ID";
                    //Emp.CalcFields("Job Title");
                    "Job Title Description" := Emp."Job Title";
                    "Center/Department" := Emp."Department Code";
                    Grade := Emp."Salary Scale";
                    "Employement Date" := Emp."Employment Date";
                end;
            end;
        }
        field(2; "Driver Name"; Text[100])
        {
        }
        field(3; "Driver License Number"; Code[20])
        {
        }
        field(4; "Last License Renewal"; Date)
        {
        }
        field(5; "Renewal Interval"; Option)
        {
            OptionMembers = Years;
        }
        field(6; "Renewal Interval Value"; Integer)
        {

            trigger OnValidate()
            begin
                "Next License Renewal" := CalcDate(Format("Renewal Interval Value") + 'Y', "Last License Renewal");
            end;
        }
        field(7; "Next License Renewal"; Date)
        {
        }
        field(8; "Year Of Experience"; Decimal)
        {
        }
        field(9; Grade; Code[20])
        {
        }
        field(10; Active; Boolean)
        {
        }
        field(11; "Licence Type"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Licence Types"."Licence Type Code";
        }
        field(12; "Phone Number"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Center/Department"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(14; "Department Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Job Title code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(16; "Job Title Description"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(17; Email; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Date of Birth"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Employement Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(20; Gender; Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; Driver, "Driver Name")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Emp: Record Employee;
        StrValue: Text[1];
}

