#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69608 "Establishment Plan Position"
{
    DrillDownPageID = "App Welfare  Membership";
    LookupPageID = "App Welfare  Membership";

    fields
    {
        field(1; "Job ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Company Positions" where("Position Category" = filter(Employee | Resource));
            trigger OnValidate()
            var
                Positn: Record "Company Positions";
            begin
                if Positn.Get("Job ID") then
                    "Job Title" := Positn."Job Title"

            end;
        }
        field(2; "Job Title"; Text[250])
        {
            Editable = false;
        }
        field(3; "Actual Active"; Integer)
        {
            //  Editable = false;
            CalcFormula = count(Employee where("Job ID" = field("Job ID"),
                                                Status = const(Active)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(4; "Actual Terminated"; Integer)
        {
            CalcFormula = count(Employee where("Job ID" = field("Job ID"),
                                                Status = const(Terminated)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(5; "Actual Suspended"; Integer)
        {
            CalcFormula = count(Employee where("Job ID" = field("Job ID"),
                                                Status = const(Inactive)));
            FieldClass = FlowField;
        }
        field(6; "Staff Establishment Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Staff Establishment Plan".Code;
        }
        field(7; "Year Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Annual Reporting Codes";
        }
        field(8; "Approved No."; Integer)
        {
            CalcFormula = sum("Establishment Planning Line"."Optimal Staffing" where("Position ID" = field("Job ID"),
                                                                                      Blcoked = const(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(9; "Department Code"; Code[20])
        {
            Caption = 'Directorate/ Department';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
            //TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter("Department/Center"));
        }
        field(10; "Directorate Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            Caption = 'Court Level';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
            // TableRelation = "Responsibility Center".Code where("Operating Unit Type" = filter(Directorate));
        }
        field(11; "Designation Group"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Designation Groups";
        }
        field(12; "Position Category"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Employee,Resource';
            OptionMembers = Employee,Resource;
        }
        field(13; Variance; Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(36; "Cadre Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Normal Cadre,Common Cadre';
            OptionMembers = " ","Normal Cadre","Common Cadre";
        }
        field(37; "Cadre Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(38; Status; Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Approved,Not Approved';
            OptionMembers = " ",Approved,"Not Approved";
        }
    }

    keys
    {
        key(Key1; "Job ID", "Staff Establishment Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Job Title", "Actual Active", "Actual Terminated")
        {
        }
    }
}

