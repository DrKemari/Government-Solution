#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 55000 "Board Committees"
{
    DrillDownPageID = "Board Committee";
    LookupPageID = "Board Committee";

    fields
    {
        field(1;"Code";Code[20])
        {
            NotBlank = true;
        }
        field(2;Description;Text[200])
        {
            NotBlank = true;
        }
        field(3;Comments;Text[200])
        {
        }
        field(4;"Start Date";Date)
        {
        }
        field(5;"End Date";Date)
        {
        }
        field(6;Status;Option)
        {
            OptionCaption = 'Active,Disbanded';
            OptionMembers = Active,Disbanded;
        }
        field(7;Mandate;Text[250])
        {
        }
        field(8;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Board,Committee,Trust,Adhoc';
            OptionMembers = ,Board,Committee,Trust,Adhoc;
        }
        field(9;Salutation;Option)
        {
            Caption = 'Salutation';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,DR,FCPA,FCS,CPA,CS,FA,ENG,MISS,MR';
            OptionMembers = " ",DR,FCPA,FCS,CPA,CS,FA,ENG,MISS,MR;
        }
        field(10;"Institution Name";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Entry No";Integer)
        {
            AutoIncrement = false;
            DataClassification = ToBeClassified;
        }
        field(13;Email;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(14;Role;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(15;Name;Text[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Code","Entry No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

