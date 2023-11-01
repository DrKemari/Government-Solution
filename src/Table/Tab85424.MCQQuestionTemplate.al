#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85424 "MCQ Question Template"
{

    fields
    {
        field(1;"Document No.";Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3;"Created By";Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4;"Created On";DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(26;"No. Series";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(27;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        SettingModerationSetup.Get;
          SettingModerationSetup.TestField("MCQ's Question Template  Nos.");
          if "Document No."='' then
          NoSeriesMgt.InitSeries(SettingModerationSetup."MCQ's Question Template  Nos.",xRec."No. Series",0D,"Document No.","No. Series");

        "Created By":=UserId;
        "Created On":=CurrentDatetime;
    end;

    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        SettingModerationSetup: Record "Setting Moderation Setup";
        Levels: Record Level;
        ResourceRoleAllocation: Record "Resource Role Allocation";
}
