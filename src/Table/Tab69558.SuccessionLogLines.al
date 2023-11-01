#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69558 "Succession  Log Lines"
{

    fields
    {
        field(1;"Document No";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Employee No";Code[20])
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
        field(6;"Actual Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Actual End Date";Date)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Actual End Date"< "Actual Start Date" then
                  Error('Actual End date must be greater than start date');
            end;
        }
        field(8;"Responsible Officer";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource."No." where (Type=const(Person),
                                                  Blocked=const(false));
        }
        field(9;"Position ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Company Positions"."Position ID";
        }
        field(10;Status;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Planned,Pending,Ongoing,Completed';
            OptionMembers = Planned,Pending,Ongoing,Completed;
        }
        field(11;Remarks;Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No","Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

