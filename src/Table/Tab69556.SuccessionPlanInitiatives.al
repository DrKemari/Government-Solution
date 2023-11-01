#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69556 "Succession Plan Initiatives"
{

    fields
    {
        field(1;"Document No";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Employee No";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";
        }
        field(3;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(4;"Initiative Category";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Succession Template Category".Code;
        }
        field(5;Initiative;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Planned Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Planned End Date";Date)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Planned End Date"<"Planned Start Date" then
                  Error('Planned End date must be greater than Start Date');
            end;
        }
        field(8;"Responsible Officer";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource."No." where (Type=const(Person),
                                                  Blocked=const(false));
        }
        field(9;Status;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Planned,Pending,Ongoing,Completed';
            OptionMembers = Planned,Pending,Ongoing,Completed;
        }
        field(10;"Actual Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Actual End Date";Date)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                // IF "Actual End Date"< "Actual Start Date" THEN
                //  ERROR('Actual End date must be greater than start date');
            end;
        }
        field(12;Remarks;Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No","Employee No","Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

