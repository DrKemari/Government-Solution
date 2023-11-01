#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85041 "Staff Role Codes"
{
    DrillDownPageID = "Staff Role Codes";
    LookupPageID = "Staff Role Codes";

    fields
    {
        field(1;"Staff Role Code";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Team Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'External,Internal';
            OptionMembers = External,Internal;
        }
        field(3;Description;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Staff Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Executive,Technical Staff,Consultant,Project Management,Delivery,Support,Other';
            OptionMembers = ,Executive,Technical,Consultant,"Project Management",Delivery,Support,Other;
        }
        field(5;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Staff Role Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown;"Staff Role Code","Team Type","Staff Category")
        {
        }
    }
}

