#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 95180 "Risk & Audit Officer"
{
    DrillDownPageID = "Risk & Audit Officers";
    LookupPageID = "Risk & Audit Officers";

    fields
    {
        field(1;"Resource No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Employee Name";Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = Employee;
        }
        field(3;"Employee No.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee;

            trigger OnValidate()
            begin
                Resource.Reset;
                Resource.SetRange("No.","Employee No.");
                if Resource.FindSet then begin
                  "Employee No.":= Resource."No.";
                  "Employee Name":= Resource.Name;
                  Email:= Resource."E-mail Address";
                  end;
                // Employee.RESET;
                // Employee.SETRANGE("No.", "Employee No.");
                // IF Employee.FINDSET THEN BEGIN
                //  "Employee No.":= Employee."No.";
                //  "Employee Name":= Employee."First Name";
                //  Email:= Employee."E-Mail";
                //  END;
            end;
        }
        field(4;"No. of Assigned Audit Projects";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(5;Email;Text[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Resource No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Resource: Record Resource;
}

