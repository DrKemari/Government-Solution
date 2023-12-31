#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69516 "Case Defendants All"
{
    DrillDownPageID = "Defendants All";
    LookupPageID = "Defendants All";

    fields
    {
        field(1;No;Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Plaintiff,Defendant';
            OptionMembers = " ",Plaintiff,Defendant;
        }
        field(3;Names;Code[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Contacts;Code[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"No. Series";Code[40])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"First Name";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Second Name";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Last name";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(9;Email;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(10;Address;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Postal Code";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(12;City;Text[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;No,Names)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        Type:=Type::Defendant;

        if No ='' then
          begin
            HumanResourcesSetup.Get;
            HumanResourcesSetup.TestField("Defendant Nos");
            NoSeriesManagement.InitSeries(HumanResourcesSetup."Defendant Nos",xRec."No. Series",Today,No,"No. Series");
          end;
    end;

    trigger OnModify()
    begin
        //Names:="First Name"+"Middle Name"+"Last name";
        /*
        IF No <> xRec.No THEN BEGIN
          HumanResourcesSetup.GET;
          NoSeriesManagement.TestManual(HumanResourcesSetup."Defendant Nos");
           "No. Series" := '';
          END;
          */

    end;

    var
        Plantiff: Record "Plaintive-Defentants";
        HumanResourcesSetup: Record "Human Resources Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        PostCode: Record "Post Code";
        Country: Record "Country/Region";
        County: Text;
}

