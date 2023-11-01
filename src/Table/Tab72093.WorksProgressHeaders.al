#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 72093 "Works Progress Headers"
{

    fields
    {
        field(1;"Progress No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Progress Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Financial Year Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Financial Year Code";
        }
        field(4;"Funding Source";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Funding Source";
        }
        field(5;"Road Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Fixed Asset"."No." where ("Record Type"=filter("Road Asset"));

            trigger OnValidate()
            begin
                if ObjRoadAsset.Get("Road Code") then
                  "Road Link Name":=ObjRoadAsset.Description;
            end;
        }
        field(6;"Road Link Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"No. Series";Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Progress No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Progress No"='' then begin
          RMSSetup.Get();
          RMSSetup.TestField("Works Progress Nos");
          NoSeriesMgt.InitSeries(RMSSetup."Works Progress Nos",xRec."No. Series",Today,"Progress No","No. Series");
          end;
    end;

    var
        RMSSetup: Record "Roads Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        ObjRoadAsset: Record "Fixed Asset";
}

