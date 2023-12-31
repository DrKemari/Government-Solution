#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80126 "Policy Stakeholder Revision"
{

    fields
    {
        field(1;"Policy ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Policy.Code;
        }
        field(2;"Stakeholder Group ID";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Stakeholder Group".Code;

            trigger OnValidate()
            begin
                if StakeholderGroup.Get ("Stakeholder Group ID") then begin
                   Description:=StakeholderGroup.Description;
                end;
            end;
        }
        field(3;Description;Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Revision No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Code";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6;Entry;Code[10])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Policy ID","Revision No.","Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        StakeholderGroup: Record "Stakeholder Group";
}

