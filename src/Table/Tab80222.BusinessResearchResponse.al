#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80222 "Business Research Response"
{

    fields
    {
        field(1;"Document No.";Code[30])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Document No." <> xRec."Document No." then begin
                    BRInnovationSetup.Get;
                    NoSeriesMgt.TestManual(BRInnovationSetup."Survey Response No. Series");
                    "No. Series" := '';
                end;
            end;
        }
        field(2;"Business Research Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Employee Experience,Customer Experience,Post-Project Survey,Custom Survey';
            OptionMembers = "Employee Experience","Customer Experience","Post-Project Survey","Custom Survey";
        }
        field(3;"Document Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Survey ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Business Research Survey"."Document No.";
        }
        field(5;"Survey Type";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Research Survey Type".Code;
        }
        field(6;"Target Respondent Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Employees,Stakeholders,Contacts,Suppliers';
            OptionMembers = Employees,Customers,Contacts,Vendors;
        }
        field(7;"Participant ID";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(8;Name;Code[255])
        {
            DataClassification = ToBeClassified;
        }
        field(9;Description;Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Project ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";
        }
        field(11;"Primary Department ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Primary Directorate ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(13;"No. Series";Code[10])
        {
            Caption = 'No. Series';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "No. Series";
        }
        field(14;"Due Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(15;Status;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Submitted';
            OptionMembers = Open,Submitted;
        }
        field(16;"Submitted Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(17;"ID Number";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(18;"Last Modified Date Time";DateTime)
        {
            Caption = 'Last Modified Date Time';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(19;"Last Date Modified";Date)
        {
            Caption = 'Last Date Modified';
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1;"Document No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Document No."= '' then begin
            BRInnovationSetup.Get;
            BRInnovationSetup.TestField("Survey Response No. Series");
            NoSeriesMgt.InitSeries(BRInnovationSetup."Survey Response No. Series",xRec."No. Series",0D,"Document No.","No. Series");
          end;
    end;

    var
        BRInnovationSetup: Record "e-BR & Innovation Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Employee: Record Employee;
        ResearchSurveyType: Record "Research Survey Type";
        BusinessResearchTemplate: Record "Business Research Template";
        ResponsibilityCenter: Record "Responsibility Center";
}

