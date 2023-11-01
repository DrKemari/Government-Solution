#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51201 "Acc Fee Schedules"
{

    fields
    {
        field(1;Service;Code[30])
        {
            TableRelation = "Accreditation Type Series".Code;

            trigger OnValidate()
            begin
                if AccreditationSetup.Get(Service) then begin
                  Description:=AccreditationSetup.Description;
                end
            end;
        }
        field(2;Description;Text[30])
        {
        }
        field(3;Currency;Code[30])
        {
            TableRelation = Currency.Code;
        }
        field(4;Amount;Decimal)
        {
        }
        field(5;"Effective Date";Date)
        {
        }
        field(6;Blocked;Boolean)
        {
        }
        field(7;"Applies To New";Boolean)
        {
        }
        field(8;"Application Type";Option)
        {
            OptionMembers = Original,"Major Revamp","Re-Design";
        }
        field(9;"No. Series";Code[30])
        {
            TableRelation = "No. Series";
        }
        field(10;"Resource No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource;
        }
        field(11;"Amount LCY";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;Service,"Effective Date",Currency)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown;Description)
        {
        }
    }

    var
        AccreditationSetup: Record "Accreditation Type Series";
}

