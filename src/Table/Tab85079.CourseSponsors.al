#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85079 "Course Sponsors"
{
    DrillDownPageID = "Course Sponsors";
    LookupPageID = "Course Sponsors";

    fields
    {
        field(1;"Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Sponsor Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Examination Donors";

            trigger OnValidate()
            begin
                Customer.Reset;
                Customer.SetRange("No.","Sponsor Code");
                if Customer.FindFirst then begin
                  "Sponsor Name":=Customer.Name;

                end
            end;
        }
        field(3;"Sponsor Name";Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4;"Course Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;
        }
        field(5;"Course Description";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(7;"Line No";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Notified On";DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9;Notified;Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10;"Prize Details";Text[2000])
        {
            DataClassification = ToBeClassified;
        }
        field(11;Amount;Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Code","Entry No","Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Customer: Record "Examination Donors";
}
