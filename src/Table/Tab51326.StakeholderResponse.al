#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51326 "Stakeholder Response"
{

    fields
    {
        field(1;"Entry No.";Integer)
        {
            AutoIncrement = true;
        }
        field(2;"Audit Response No.";Code[30])
        {
            TableRelation = "Audit Requisition Header";

            trigger OnValidate()
            begin
                //IF StakeholdersSetup.GET
            end;
        }
        field(3;"Stakeholder Code";Code[30])
        {

            trigger OnValidate()
            begin
                if StakeholdersSetup.Get("Stakeholder Code") then begin
                    "Stakeholder Name":=StakeholdersSetup.Description;
                  end;
            end;
        }
        field(4;"Stakeholder Name";Text[30])
        {
        }
        field(5;"A Stakeholder?";Boolean)
        {
        }
        field(6;"Engaged for last 5yrs";Boolean)
        {
            Caption = 'Engaged in the last five years?';
        }
        field(7;"Analyzed needs last 5yrs";Boolean)
        {
            Caption = 'Analyzed Needs Last 5 Years';
        }
        field(8;"University Code";Code[50])
        {
            TableRelation = Customer;
        }
    }

    keys
    {
        key(Key1;"Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        StakeholdersSetup: Record "Stakeholders Setup";
}

