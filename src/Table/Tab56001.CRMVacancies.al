#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56001 "CRM Vacancies"
{

    fields
    {
        field(1;"Vacancy No";Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2;"No of Openings";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(3;Position;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Estimate Annual Salary";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Job Grade ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Salary Scales";
        }
        field(6;"Seniority Level";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Entry-Level,Mid-Level,Senior-Level,Executive';
            OptionMembers = ,"Entry-Level","Mid-Level","Senior-Level",Executive;
        }
        field(7;"Employment Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Permanent,Contract,Casual,Internship,Attachment';
            OptionMembers = Permanent,Contract,Casual,Internship,Attachment;
        }
        field(8;Published;Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9;"No. Series";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Published By";Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11;"Published On";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12;"Application End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(13;Employer;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(14;Region;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(15;Comments;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Approval Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Open,"Pending Approval",Released;
        }
    }

    keys
    {
        key(Key1;"Vacancy No","No of Openings")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        HumanResourcesSetup.Get();
        HumanResourcesSetup.TestField("CRM Vacancies");
            if "Vacancy No"='' then begin
                NoSeriesMgt.InitSeries(HumanResourcesSetup."CRM Vacancies",xRec."No. Series",0D,"Vacancy No","No. Series");
            end;
    end;

    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        HumanResourcesSetup: Record "Human Resources Setup";
}

