#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85011 "Appointment Line"
{

    fields
    {
        field(1;"Appointment No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Exam Route Team","External Route Team","Internal Route Team";
        }
        field(3;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(4;"Exam Sitting";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Role Type";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Role Type";
        }
        field(6;"Member No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource;

            trigger OnValidate()
            begin
                Employee.Reset;
                Employee.SetRange("No.","Member No.");
                if Employee.FindSet then begin
                  "Staff No.":=Employee."No.";
                  "Member Name":=Employee."First Name"+'  '+Employee."Middle Name"+' '+Employee."Last Name"+' ';
                   "ID/Passport":=Employee."ID Number";
                  Employee.CalcFields("Job Title");
                  Designation:=Employee."Job Title";
                  "Tax Registration(PIN)":=Employee."P.I.N";
                end else begin
                  Resource.Reset;
                  Resource.SetRange("No.","Member No.");
                  if Resource.FindSet then begin
                    "Member Name":=Resource.Name;
                    "Member Email":=Resource."Address 2";//add email on resource table
                    "Telephone No.":=Resource.Address;

                  end;
                end;
            end;
        }
        field(7;"Member Name";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Member Email";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Telephone No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(10;Designation;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Staff No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"ID/Passport";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Tax Registration(PIN)";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Notified on Email";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(15;DateTime;DateTime)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Appointment No.","Line No.","Exam Sitting",Type)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Employee: Record Employee;
        Resource: Record Resource;
}

