#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85053 "Exam Material Planner Header"
{

    fields
    {
        field(1;"Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Examination;Code[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = Courses;
        }
        field(3;"Examination Sitting ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exam Sitting Cycle";
        }
        field(4;"Eamination Center Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Examination Centres";

            trigger OnValidate()
            begin
                if ExamCenter.Get("Eamination Center Code") then
                  "Examination Center":=ExamCenter.Name;
            end;
        }
        field(5;"Examination Center";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Document Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Financial Year Code";Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Annual Reporting Codes";
        }
        field(8;Description;Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9;"Region ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where ("Operating Unit Type"=filter(Region));
        }
        field(10;"Corporate Strategic ID";Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Corporate Strategic Plans";
        }
        field(11;"Financial Plan ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Planning Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Planning End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Total Candidature";Integer)
        {
            CalcFormula = sum("Exam Planner Line"."Total Candidature" where ("Planner No."=field(Code)));
            FieldClass = FlowField;
        }
        field(15;"Total Quantity";Decimal)
        {
        }
        field(16;"Total Budget";Decimal)
        {
        }
        field(17;"Total Actual Cost";Decimal)
        {
            CalcFormula = sum("Exam Planner Line"."Total Actual Cost" where ("Planner No."=field(Code)));
            FieldClass = FlowField;
        }
        field(18;"Approval Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(19;Posted;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(20;"Posted On";DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(21;"Posted By";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(22;"Created By";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(23;"Created On";DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(24;"No. Series";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(25;"Examination Project ID";Code[30])
        {
            DataClassification = ToBeClassified;
           // TableRelation = Job where ("Document Type"=filter("3"));

            trigger OnValidate()
            begin
                if Job.Get("Examination Project ID") then begin
                  "Project Name":=Format(Job.Description,30);
                  Examination:=Job."Examination Code";
                  "Examination Sitting ID":=Job."Examination Sitting Cycle";
                  Validate(Examination);
                  "Financial Year Code":=Job."Financial Year";
                  "Planning Start Date":=Job."Starting Date";
                  "Planning End Date":=Job."Ending Date";
                   Description:=Format('Planning for:'+' '+Job.Description,50);
                end
            end;
        }
        field(26;"Project Name";Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
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
        ExaminationSetup.Get;
        ExaminationSetup.TestField("Examination Planner Nos.");
          if Code='' then
          NoSeriesMgt.InitSeries(ExaminationSetup."Examination Planner Nos.",xRec."No. Series",0D,Code,"No. Series");
        "Created By":=UserId;
        "Document Date":=Today;
        "Created On":=CurrentDatetime;
    end;

    var
        ExaminationSetup: Record "Examination Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        ExamCenter: Record "Examination Centres";
        Job: Record Job;
}

