#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56072 "Maintenance Periods"
{

    fields
    {
        field(1;"Document No";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "ICT Maintenance Schedule".Code;
        }
        field(2;Period;Date)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Accounting Period"."Starting Date";

            trigger OnValidate()
            begin
                AccountingPeriod.Reset;
                AccountingPeriod.SetRange("Starting Date",Period);
                if AccountingPeriod.FindSet then
                  Description:=AccountingPeriod.Name;
            end;
        }
        field(3;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Planned,Actual';
            OptionMembers = Planned,Actual;
        }
        field(5;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(6;"Maintenance Code";Code[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No","Entry No","Maintenance Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        AccountingPeriod: Record "Accounting Period";
}

