#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85065 "Exam Marksheet Lines"
{

    fields
    {
        field(1;"Document No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Student Reg No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Examination Account";

            trigger OnValidate()
            var
                Customer: Record "Examination Account";
            begin
                Customer.Reset;
                Customer.SetRange("Registration No.","Student Reg No.");
                if Customer.FindFirst then begin
                  "Student Name":=Customer."First Name"+' '+Customer."Middle Name"+' '+Customer.Surname;
                end;
                /*BookingEntries.RESET;
                BookingEntries.SETRANGE("Student Reg No.","Student Reg No.");
                BookingEntries.SETRANGE(Status,BookingEntries.Status::Ongoing);
                IF BookingEntries.FINDFIRST THEN BEGIN
                  "Examination Center":=BookingEntries."Exam Center";
                END
                */

            end;
        }
        field(3;"Student Name";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Examination Center";Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Examination Centres";
        }
        field(5;"No. of Papers";Integer)
        {
            CalcFormula = count("Marksheet Detailed Lines" where ("Document No."=field("Document No."),
                                                                  "Student Reg No."=field("Student Reg No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(6;"Examination Sitting ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No.","Student Reg No.","Examination Sitting ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        BookingEntries: Record "Exam Booking Entries";
}

