#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 59019 "Travel Requisition Non Staff"
{

    fields
    {
        field(1; "Req No"; Code[20])
        {
        }
        field(2; "ID No"; Code[20])
        {
        }
        field(3; Name; Text[70])
        {
        }
        field(4; Position; Text[70])
        {
        }
        field(5; "Daily Work Ticket"; Code[20])
        {

            trigger OnValidate()
            begin
                DwTicket.Reset;
                DwTicket.SetRange(DwTicket."Transport Requisition No", "Req No");
                if DwTicket.Find('-') then
                    "Daily Work Ticket" := DwTicket."Work Ticket No";
            end;
        }
        field(6; EntryNo; Integer)
        {
            AutoIncrement = true;
        }
        field(7; "Phone Number"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(8; "Allocated Vehicle Reg No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Fleet Vehicles."."Registration No.";
        }
    }

    keys
    {
        key(Key1; "Req No", "ID No", EntryNo)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        HrEmployee: Record Employee;
        DwTicket: Record "Transport Requisition";
}

