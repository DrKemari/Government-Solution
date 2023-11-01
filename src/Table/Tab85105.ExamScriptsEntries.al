#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85105 "Exam Scripts Entries"
{
  //  DataCaptionFields = Field85287;
    DrillDownPageID = "Marker Claim Details";

    fields
    {
        field(1;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Document No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Examination;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;
        }
        field(4;"Paper Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Papers;

            trigger OnValidate()
            var
                Papers: Record Papers;
            begin
            end;
        }
        field(5;"Paper Name";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"No. of Scripts Expected";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Quantity Received";Integer)
        {
            Editable = false;

            trigger OnValidate()
            var
                TXT001: label 'The scripts for %1 have already been received';
            begin
            end;
        }
        field(8;"No. of Envelopes";Integer)
        {
            Editable = false;
        }
        field(9;"Examination Sitting";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exam Sitting Cycle";
        }
        field(10;"Project No";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Project Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Center Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Center Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Marker Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Marker Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Created By";Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(17;"Last Modified Date";DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(18;Level;Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(19;Allocated;Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Line No.","Center Code","Paper Code",Examination,"Examination Sitting")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown;"Center Code","Center Name","Marker Code","Marker Name","Paper Name")
        {
        }
    }

    trigger OnInsert()
    begin
         "Created By":=UserId;
         "Last Modified Date":=CurrentDatetime;
    end;

    trigger OnModify()
    begin
         "Created By":=UserId;
         "Last Modified Date":=CurrentDatetime;
    end;
}

