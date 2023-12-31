#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 95118 "RMP Line Job Task"
{

    fields
    {
        field(1;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Corporate,Functional (Directorate),Functional (Department),Functional (Region),Project';
            OptionMembers = " ",Corporate,"Functional (Directorate)","Functional (Department)","Functional (Region)",Project;
        }
        field(2;"Document No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Risk ID";Integer)
        {
            AutoIncrement = false;
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                RiskManagementPlanLine.Reset;
                RiskManagementPlanLine.SetRange("Risk ID", "Risk ID");
                if RiskManagementPlanLine.FindSet then begin
                  "Risk ID":= RiskManagementPlanLine."Risk ID";
                  "Risk Title" := RiskManagementPlanLine."Risk Title";
                  end;
            end;
        }
        field(4;"Job No";Code[100])
        {
            Caption = 'Budget Code';
            DataClassification = ToBeClassified;
            TableRelation = Job;
        }
        field(5;"Job Task No";Code[50])
        {
            Caption = 'Budget Amount';
            DataClassification = ToBeClassified;
            TableRelation = Job;
        }
        field(6;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Risk Title";Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document Type","Document No","Risk ID","Job No","Job Task No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        RiskManagementPlanLine: Record "Risk Management Plan Line";
}

