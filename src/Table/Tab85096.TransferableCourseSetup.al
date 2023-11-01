#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85096 "Transferable Course Setup"
{

    fields
    {
        field(1;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;Course;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;
        }
        field(3;"Transferable Course";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;

            trigger OnValidate()
            var
                TXT001: label 'The transfer from course and to cannot be the same';
            begin
                if Course="Transferable Course" then
                  Error(TXT001);
            end;
        }
        field(4;"Refund Required";Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;Course,"Transferable Course")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

