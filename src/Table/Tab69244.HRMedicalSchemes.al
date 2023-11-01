#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69244 "HR Medical Schemes"
{

    fields
    {
        field(1;"Scheme No";Code[10])
        {
        }
        field(2;"Medical Insurer";Code[50])
        {
            TableRelation = Vendor."No.";

            trigger OnValidate()
            begin

                         Insurer.Reset;
                         Insurer.SetRange(Insurer."No.","Medical Insurer");
                          if Insurer.Find('-') then begin
                         "Insurer Name":=Insurer.Name;

                          end;
            end;
        }
        field(3;"Scheme Name";Text[250])
        {
        }
        field(4;"In-patient limit";Decimal)
        {
        }
        field(5;"Out-patient limit";Decimal)
        {
        }
        field(6;"Area Covered";Text[2000])
        {
        }
        field(7;"Dependants Included";Boolean)
        {
        }
        field(8;Comments;Text[2000])
        {
        }
        field(9;"Insurer Name";Text[250])
        {
        }
        field(10;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Insurance,NHIF';
            OptionMembers = Insurance,NHIF;
        }
        field(11;"Funding Source";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Insurance,Funded';
            OptionMembers = " ",Insurance,Funded;
        }
        field(12;"NHIF Rebates";Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Scheme No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Insurer: Record Vendor;
}

