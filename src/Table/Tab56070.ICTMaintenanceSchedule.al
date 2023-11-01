#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56070 "ICT Maintenance Schedule"
{

    fields
    {
        field(1;"Code";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Year Code";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Annual Reporting Codes".Code where ("Current Year"=const(true));
        }
        field(4;"Created By";Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5;"Document Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6;"No. Series";Code[10])
        {
            DataClassification = ToBeClassified;
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
    }

    trigger OnInsert()
    begin
        if Code = '' then begin
          ICT.Get;
          ICT.TestField(ICT."ICT Maintenance Schedule Nos.");
          NoSeriesMgt.InitSeries(ICT."ICT Maintenance Schedule Nos.",xRec."No. Series",0D,Code,"No. Series");
         end;
         "Document Date":=Today;
         "Created By":=UserId;
    end;

    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        ICT: Record "ICT Helpdesk Global Parameters";
}

