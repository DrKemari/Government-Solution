#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69206 "HR Leave Types"
{
    LookupPageID = "HR Leave Types";

    fields
    {
        field(1; "Code"; Code[40])
        {
            NotBlank = true;
        }
        field(2; Description; Text[200])
        {
        }
        field(3; Days; Decimal)
        {
        }
        field(4; "Acrue Days"; Boolean)
        {
        }
        field(5; "Unlimited Days"; Boolean)
        {
        }
        field(6; Gender; Option)
        {
            OptionCaption = ' ,Female,Male,Both';
            OptionMembers = " ",Female,Male,Both;
        }
        field(7; Balance; Option)
        {
            OptionCaption = 'Ignore,Carry Forward,Convert to Cash';
            OptionMembers = Ignore,"Carry Forward","Convert to Cash";
        }
        field(8; "Inclusive of Holidays"; Boolean)
        {
        }
        field(9; "Inclusive of Saturday"; Boolean)
        {
        }
        field(10; "Inclusive of Sunday"; Boolean)
        {
        }
        field(11; "Off/Holidays Days Leave"; Boolean)
        {
        }
        field(12; "Max Carry Forward Days"; Decimal)
        {
        }
        field(13; "Inclusive of Non Working Days"; Boolean)
        {
        }
        field(14; "Date Filter"; Date)
        {
            FieldClass = FlowFilter;
        }
        field(15; "Carry Forward Allowed"; Boolean)
        {
        }
        field(16; "Fixed Days"; Boolean)
        {
        }
        field(17; Annual; Boolean)
        {
        }
        field(18; "Grace Period(in Days )"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Posting Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Annual,Compassionate,Marternity,Parternity,Sick Leave,Study Leave,Sports Leave,Unpaid Leave,Terminal Leave,Off Days,Abscence,Adoption,Examination,Sabbatical,Special Sports,Home Leave';
            OptionMembers = Annual,Compassionate,Marternity,Parternity,"Sick Leave","Study Leave","Sports Leave","Unpaid Leave","Terminal Leave","Off Days",Abscence,Adoption,Examination,Sabbatical,"Special Sports","Home Leave";
        }
        field(20; "Attachment Mandatory"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Multiple Allocations"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Detailed Description"; Text[250])
        {
        }

    }

    keys
    {
        key(Key1; "Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

