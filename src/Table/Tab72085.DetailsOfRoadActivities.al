#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 72085 "Details Of Road Activities"
{

    fields
    {
        field(1;"Item Code";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "BoQ Template Line1"."No.";

            trigger OnValidate()
            begin
                FnPopulateBOQItemAttributes;
            end;
        }
        field(2;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Unit;Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Quantity;Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Rate(LCY)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Bill Item Amount(LCY)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Start Chainage(Km)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"End Chainage(Km)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9;Technology;Option)
        {
            DataClassification = ToBeClassified;
            InitValue = LB;
            OptionCaption = ' ,LB,MB,LB-MB,ND';
            OptionMembers = " ",LB,MB,"LB-MB",ND;
        }
        field(10;"Labour(%)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"WorkPlan No";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Entry No","Item Code","WorkPlan No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        BoQTemplateLine1: Record "BoQ Template Line1";

    local procedure FnPopulateBOQItemAttributes()
    begin
        BoQTemplateLine1.Reset;
        BoQTemplateLine1.SetRange(BoQTemplateLine1."No.","Item Code");
        if BoQTemplateLine1.FindSet then begin
          Description:=BoQTemplateLine1.Description;
          Unit:=BoQTemplateLine1."Unit of Measure Code";
          "Bill Item Amount(LCY)":=BoQTemplateLine1."Amount Excl. VAT";
        //  Technology:=BoQTemplateLine1.Technology;
          "Labour(%)":=BoQTemplateLine1."Labour(%)";
          //"Rate(LCY)":=BoQTemplateLine1
          end;
    end;
}

