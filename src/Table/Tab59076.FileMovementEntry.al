#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 59076 "File Movement Entry"
{

    fields
    {
        field(1;No;Code[50])
        {
            Caption = 'Registry No';
            DataClassification = ToBeClassified;
        }
        field(2;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;"Account No.";Code[40])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";
        }
        field(4;"Responsiblity Center";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code;
        }
        field(5;Date;Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"System No";Code[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;No,"System No","Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    var
        "No.": Code[50];
    begin
    end;

    var
        NoSeries: Record "No. Series";
        FileLocationsSetup: Record "File Locations Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
}

