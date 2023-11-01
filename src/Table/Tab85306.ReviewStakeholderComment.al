#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85306 "Review Stakeholder Comment"
{

    fields
    {
        field(1;"Application No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Stakeholder Type";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Stakeholder Type";

            trigger OnValidate()
            begin
                StakeholderType.Reset;
                StakeholderType.SetRange(Code,"Stakeholder Type");
                if StakeholderType.FindFirst then begin
                  "Stakeholder Name":=StakeholderType.Description;
                  end
            end;
        }
        field(3;"Stakeholder Name";Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4;"Expected Content";Blob)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Source Type";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Review Resource";

            trigger OnValidate()
            begin
                ReviewResource.Reset;
                ReviewResource.SetRange(Code,"Source Type");
                if ReviewResource.FindFirst then begin
                  "Source Name":=ReviewResource.Description;
                end
            end;
        }
        field(6;"Rules and Regulation";Blob)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(8;"Source Name";Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1;"Application No.","Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        StakeholderType: Record "Stakeholder Type";
        ReviewResource: Record "Review Resource";
}

