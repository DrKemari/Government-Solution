#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69124 "Job Advert Header"
{

    fields
    {
        field(1;"Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Requisition No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Status;Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(5;"Document Date";DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Created By";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(7;Published;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"No. Series";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Applications End Time";Time)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Applications End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Applications Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Company Profile";Text[300])
        {
            DataClassification = ToBeClassified;
        }
        field(13;Provider;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(33;Test;Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(46;"test 2";Code[10])
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
        //GENERATE DOCUMENT NUMBER
        if Code = '' then begin
          HRSetup.Get;
          HRSetup.TestField(HRSetup."Job Advert Nos.");
          NoSeriesMgt.InitSeries(HRSetup."Job Advert Nos.",xRec."No. Series",0D,Code,"No. Series");
        end;

        "Created By":=UserId;
        "Document Date":=CurrentDatetime;
    end;

    var
        HRSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

