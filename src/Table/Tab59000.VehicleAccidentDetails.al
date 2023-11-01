#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 59000 "Vehicle Accident Details"
{

    fields
    {
        field(1;RegNo;Code[10])
        {
        }
        field(2;Driver;Code[10])
        {
            TableRelation = "Vehicle Drivers".Driver;

            trigger OnValidate()
            begin
                FleetDriver.Reset;
                FleetDriver.SetRange(FleetDriver.Driver,Driver);
                if FleetDriver.Find('-') then
                "Driver Names":=FleetDriver."Driver Name";
            end;
        }
        field(3;"Accident date";Date)
        {
        }
        field(4;"Accident Details";Text[200])
        {
        }
        field(5;"Driver Names";Text[30])
        {
        }
        field(6;No;Code[10])
        {
        }
        field(7;"Police Obstract No";Code[30])
        {
        }
        field(8;Remarks;Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Claim Payment Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Entry Number";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;RegNo,"Entry Number","Police Obstract No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        FleetDriver: Record "Vehicle Drivers";
}

