#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56905 "Applications Accomplishments"
{

    fields
    {
        field(1;"Code";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Job Application No";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "HR Job Applications";
        }
        field(3;"Job Indicator Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Indicators Setup"."Indicator  Code";

            trigger OnValidate()
            begin
                /*JobIndicatorsSetup.SETRANGE("Indicator  Code","Job Indicator Code");
                IF JobIndicatorsSetup.FINDSET THEN
                  "Indicator Description":=JobIndicatorsSetup."Indicator Description";*/

            end;
        }
        field(4;"Indicator Description";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5;Number;Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Additional Comments";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Job ID";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(8;Amount;Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Job Application No","Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

