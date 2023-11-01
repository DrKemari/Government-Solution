#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69559 "Attendance Register"
{

    fields
    {
        field(1;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Employee No";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No." where (Status=const(Active));

            trigger OnValidate()
            begin
                TestField("Type of Visitor","type of visitor"::Employee);
                Employee.Reset;
                Employee.SetRange("No.","Employee No");
                if Employee.FindSet then
                  Name:=Employee."First Name"+' '+Employee."Middle Name"+' '+Employee."Last Name";
                Directorate:=Employee."Directorate Code";
                Department:=Employee."Department Code";
                "E-Mail":=Employee."Company E-Mail";
                "ID Number":=Employee."ID Number";
                "Passport No.":=Employee."Passport No.";
                "Telephone No.":=Employee."Mobile Phone No.";
            end;
        }
        field(3;Name;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Date;Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Check In Time";Time)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Movement Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'In,Out';
            OptionMembers = "In",Out;
        }
        field(7;Directorate;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where ("Operating Unit Type"=filter(Directorate));
        }
        field(8;Department;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where ("Operating Unit Type"=filter("Department/Center"));
        }
        field(9;"Type of Visitor";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Guest,Employee,Tenant,Student';
            OptionMembers = Guest,Employee,Tenant,Student;
        }
        field(10;"ID Number";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Passport No.";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Telephone No.";Code[10])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = PhoneNo;
        }
        field(13;"E-Mail";Text[250])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = EMail;
        }
        field(14;"Reason for Visit";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(15;Temperature;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Area of Residence";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(17;"Check Out Time";Time)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Employee: Record Employee;
}

