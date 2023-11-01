#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69125 "Job Advert Lines"
{
    LookupPageID = "Training Feedback";

    fields
    {
        field(1;"Entry No.";Integer)
        {
            AutoIncrement = true;
        }
        field(2;"Job Advert No.";Code[30])
        {
            TableRelation = "Job Advert Header";
        }
        field(3;"Job Id";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Positions;

            trigger OnValidate()
            begin
                Positions.Reset;
                Positions.SetRange("Job ID","Job Id");
                if Positions.FindSet then  begin
                  "Job Title":=Positions."Job Description";
                  end
            end;
        }
        field(4;"Job Title";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Quantity Sought";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Media Option";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Print,TV,Online;
        }
    }

    keys
    {
        key(Key1;"Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Positions: Record Positions;
}

