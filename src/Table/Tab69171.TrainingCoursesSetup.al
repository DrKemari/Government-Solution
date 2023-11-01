#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69171 "Training Courses Setup"
{

    fields
    {
        field(1;"Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Descritpion;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(4;Domain;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Training Domains";
        }
        field(5;"No. of Staff Trained";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Budget Spent";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Qualification Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Qualification;

            trigger OnValidate()
            begin
                Qualification.Reset;
                Qualification.SetRange(Code,"Qualification Code");
                if Qualification.FindFirst then begin
                  "Qualification Name":=Qualification.Description;
                end
            end;
        }
        field(8;"Qualification Name";Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1;"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown;"Code",Descritpion)
        {
        }
    }

    var
        Qualification: Record Qualification;
}

