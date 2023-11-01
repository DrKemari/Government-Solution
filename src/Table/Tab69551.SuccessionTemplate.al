#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69551 "Succession Template"
{

    fields
    {
        field(1;"Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Position ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Company Positions"."Position ID" where (Blocked=const(false));

            trigger OnValidate()
            begin
                CompanyPositions.Reset;
                CompanyPositions.SetRange("Position ID","Position ID");
                if CompanyPositions.FindSet then
                  Description:= CompanyPositions."Job Title" +' Succession Template';
            end;
        }
        field(3;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Created By";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Document Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"No. Series";Code[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
         if Code='' then begin
         HumanResourcesSetup.Get;
         HumanResourcesSetup.TestField("Succession Template Nos");
         NoSeriesManagement.InitSeries(HumanResourcesSetup."Succession Template Nos",xRec."No. Series",0D,Code,"No. Series");
         end;
         "Created By":=UserId;
         "Document Date":=Today;

    end;

    var
        HumanResourcesSetup: Record "Human Resources Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        CompanyPositions: Record "Company Positions";
}

