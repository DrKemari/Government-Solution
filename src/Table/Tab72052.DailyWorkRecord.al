#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 72052 "Daily Work Record"
{

    fields
    {
        field(1;"Road Authority";Text[250])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Authority"."Authority Name";
        }
        field(2;Contractor;Text[250])
        {
            DataClassification = ToBeClassified;
            TableRelation = Vendor;
        }
        field(3;Project;Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job;
        }
        field(4;"Road Name/Chainage";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Road Class";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Classes";
        }
        field(6;"Inspected By";Text[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource;
        }
        field(7;"Standard Service Level";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,High,Low,Standard,Medium';
            OptionMembers = " ",High,Low,Standard,Medium;
        }
        field(8;"Road Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Fixed Asset"."No." where ("Record Type"=filter("Road Asset"));

            trigger OnValidate()
            begin
                if RoadAsset.Get("Road Code") then
                "Road Name/Chainage":=RoadAsset.Description;
            end;
        }
        field(9;"Daily Work No";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"No. Series";Code[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Daily Work No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Daily Work No"='' then begin
          RMSSetup.Get();
          RMSSetup.TestField("Daily Work Record Nos");
          NoSeriesMgt.InitSeries(RMSSetup."Daily Work Record Nos",xRec."No. Series",Today,"Daily Work No","No. Series");
          end;
    end;

    var
        RoadAsset: Record "Fixed Asset";
        RMSSetup: Record "Roads Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

