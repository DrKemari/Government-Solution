#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85064 "Marksheet Header"
{

    fields
    {
        field(1;"Document No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Examination Sitting ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exam Sitting Cycle";

            trigger OnValidate()
            begin
                ExamSittingCycle.Reset;
                ExamSittingCycle.SetRange("Exam Sitting Cycle","Examination Sitting ID");
                if ExamSittingCycle.FindFirst then begin
                  "Examination Start Date":=ExamSittingCycle."Exam Start Date";
                  "Examination End Date":=ExamSittingCycle."Exam End Date";
                  end
            end;
        }
        field(3;"Document Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Financial Year Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Financial Year Code";
        }
        field(5;Description;Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Corporate Strategic Plan ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Corporate Strategic Plans";
        }
        field(7;"Financial Budget ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Budget Name";
        }
        field(8;"Examination Start Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9;"Examination End Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10;"Total Candidature";Integer)
        {
            CalcFormula = count("Exam Marksheet Lines" where ("Document No."=field("Document No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(11;"Approval Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(12;"Created By";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Created On";DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(14;Posted;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Posted On";DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Posted By";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(17;"No. Series";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(18;"Examination Project ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job;

            trigger OnValidate()
            begin
                Job.Reset;
                Job.SetRange("No.","Examination Project ID");
                if Job.FindFirst then begin
                  "Examination Sitting ID":=Job."Examination Sitting Cycle";
                  "Financial Year Code":=Job."Financial Year";
                  "Examination Start Date":=Job."Starting Date";
                   Description:=Format('Marksheet for:'+' '+Job.Description,50);
                end
            end;
        }
        field(19;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Exam Results,Prize Award,Marksheet';
            OptionMembers = "Exam Results","Prize Award",Marksheet;
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
        ExaminationSetup.Get;
        if "Document Type"="document type"::"Exam Results" then begin
        ExaminationSetup.TestField("Exam Results Nos.");
        if "Document No."='' then
          NoSeriesMgt.InitSeries(ExaminationSetup."Exam Results Nos.",xRec."No. Series",0D,"Document No.","No. Series");
        end;
        if "Document Type"="document type"::"Prize Award" then begin
        ExaminationSetup.TestField("Prize Award Nos.");
        if "Document No."='' then
          NoSeriesMgt.InitSeries(ExaminationSetup."Prize Award Nos.",xRec."No. Series",0D,"Document No.","No. Series");
        end;
        if "Document Type"="document type"::Marksheet then begin
        ExaminationSetup.TestField("Marksheet Header Nos.");
        if "Document No."='' then
          NoSeriesMgt.InitSeries(ExaminationSetup."Marksheet Header Nos.",xRec."No. Series",0D,"Document No.","No. Series");
        end;
        "Created By":=UserId;
        "Created On":=CurrentDatetime;
    end;

    var
        ExaminationSetup: Record "Examination Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Job: Record Job;
        ExamSittingCycle: Record "Exam Sitting Cycle";
}

