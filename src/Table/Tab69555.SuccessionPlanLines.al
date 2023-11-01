#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69555 "Succession Plan Lines"
{

    fields
    {
        field(1;"Document No";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Employee No";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                Employee.Reset;
                Employee.SetRange("No.","Employee No");
                if Employee.FindSet then begin
                "Employee Name":=Employee."First Name"+' '+Employee."Middle Name"+' '+Employee."Last Name";
                  Directorate:=Employee."Directorate Code";
                  Department:=Employee."Department Code";
                  "Current Position ID":=Employee."Job ID";

                end;
            end;
        }
        field(3;"Employee Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Current Position ID";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Company Positions"."Position ID" where (Blocked=const(false));
        }
        field(5;"Projected Position ID";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Company Positions"."Position ID" where (Blocked=const(false));
        }
        field(6;"Planned Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Planned End Date";Date)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Planned End Date"<"Planned Start Date" then
                  Error('Planned End date must be greater than Start Date');
            end;
        }
        field(8;Directorate;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where ("Operating Unit Type"=filter(Directorate));
        }
        field(9;Department;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where ("Operating Unit Type"=filter("Department/Center"));
        }
        field(10;Mentor;Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource."No." where (Type=const(Person),
                                                  Blocked=const(false));
        }
        field(11;"Default Mentorship Template";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Succession Template".Code where (Blocked=const(false));
        }
    }

    keys
    {
        key(Key1;"Document No","Employee No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Employee: Record Employee;
        CompanyPositions: Record "Company Positions";
}

