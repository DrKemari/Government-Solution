#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69015 "Salary Scales"
{
    DrillDownPageID = "Salary Scale List";
    LookupPageID = "Salary Scale List";

    fields
    {
        field(1;Scale;Code[10])
        {
        }
        field(2;"Minimum Pointer";Code[10])
        {
            TableRelation = "Salary Pointers"."Salary Pointer" where ("Salary Scale"=field(Scale));
        }
        field(3;"Maximum Pointer";Code[10])
        {
            TableRelation = "Salary Pointers"."Salary Pointer" where ("Salary Scale"=field(Scale));
        }
        field(4;"Responsibility Allowance";Decimal)
        {
        }
        field(5;"Commuter Allowance";Decimal)
        {
        }
        field(6;"In Patient Limit";Decimal)
        {
        }
        field(7;"Out Patient Limit";Decimal)
        {
        }
        field(8;Description;Text[50])
        {
        }
        field(9;"Maximum Cover";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(69600;"Appointment Authority";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where ("Blocked?"=filter(false));
        }
        field(69601;"Seniority Level";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Entry-Level,Mid-Entry-Level,Level,Senior Level,Executive';
            OptionMembers = ,"Entry-Level","Mid-Entry-Level",Level,"Senior Level",Executive;
        }
        field(69602;"Valid Positions";Integer)
        {
            CalcFormula = count("Company Positions" where ("Job Grade ID"=field(Scale)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(69603;"Active Employees";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(69604;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(69605;"Maximum Car Loan";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(69606;"Maximum Mortage Loan";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(69607;"Bed Limit";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(69608;"Maternity Limit";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(69609;"Dental Limit";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(69610;"Optical Limit";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;Scale)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

