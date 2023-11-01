#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 59032 "Property Reports"
{

    fields
    {
        field(1;No;Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Period;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Monthly,Quarterly,Annual';
            OptionMembers = Monthly,Quarterly,Annual;
        }
        field(4;"Created By";Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5;Created;DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6;"No. Series";Code[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;No)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if No = '' then begin
             FASetup.Get;
             FASetup.TestField(FASetup."Property Reports  Nos.");
             NoSeriesMgt.InitSeries(FASetup."Property Reports  Nos.",xRec."No. Series",0D,No,"No. Series");
        end;
        Created:=CurrentDatetime;
        "Created By":=UserId;
    end;

    var
        FASetup: Record "FA Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

