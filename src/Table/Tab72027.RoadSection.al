#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 72027 "Road Section"
{

    fields
    {
        field(1;"Section ID";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Road Code";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Fixed Asset"."No.";
        }
        field(3;"Section Label";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Start Reference Point";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Start Point Coordinates";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"End Reference Point";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"End Point Coordinates";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Tota SectionLength(KM)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Total Paved Length(KM)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Start Chainage(Km)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"End Chainage(Km)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Section Length(Km)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Constituency Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Constituency Name";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Surface Type";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Surface Type".Code;
        }
        field(17;"Road Condition";Option)
        {
            DataClassification = ToBeClassified;
            InitValue = Good;
            OptionCaption = ' ,Good,Fairly Good,Poor,Impassable,Excelent';
            OptionMembers = " ",Good,"Fairly Good",Poor,Impassable,Excelent;
        }
        field(18;"Secton Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(19;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(20;"No Series";Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Entry No","Section ID","Road Code")
        {
            Clustered = true;
        }
        // key(Key2;'')
        // {
        //     Enabled = false;
        // }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Section ID" ='' then begin
          RMSSetup.Get();
         RMSSetup.TestField("Section Nos");
         NoSeriesMgt.InitSeries(RMSSetup."Section Nos",xRec."No Series",Today,"Section ID","No Series");
         end;
    end;

    var
        RMSSetup: Record "Roads Management Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

