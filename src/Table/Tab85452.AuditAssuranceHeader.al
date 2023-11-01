#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85452 "Audit Assurance Header"
{

    fields
    {
        field(1;"Document No.";Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2;"Engagement Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Syllabuses Development,Setting of Examinations,Moderation of Examinations,Printing of Examinations,Delivery of Examinations,Administration of Examinations,Marking Process,Processing of Results,Release of Results,Processing of Certificates,Certificate Dispatch';
            OptionMembers = "Syllabuses Development","Setting of Examinations","Moderation of Examinations","Printing of Examinations","Delivery of Examinations","Administration of Examinations","Marking Process","Processing of Results","Release of Results","Processing of Certificates","Certificate Dispatch";
        }
        field(3;"Lead Auditor ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource."No." where (Type=filter(Person),
                                                  Blocked=filter(false));

            trigger OnValidate()
            begin
                // IF Resource.GET("Lead Auditor ID") THEN BEGIN
                //  Resource.TESTFIELD("E-mail Address");
                //  "Lead Auditor Email":=Resource."E-mail Address";
                //  END;
            end;
        }
        field(4;"Lead Auditor Email";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Planned Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Planned End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Global Dimension Dim 1 Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Global Dimension  Dim 2 Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Dimension Set ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Exam Sitting";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exam Sitting Cycle";
        }
        field(11;"Document Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12;"Created By";Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13;"Created On";DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14;"Audit Plan ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exam Audit Plan";
        }
        field(15;"Audit Plan Item";Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exam Audit Lines"."Engagement Line No." where ("Audit Plan ID"=field("Audit Plan ID"));

            trigger OnValidate()
            begin
                ExamAuditLines.Reset;
                ExamAuditLines.SetRange("Audit Plan ID","Audit Plan ID");
                ExamAuditLines.SetRange("Engagement Line No.","Audit Plan Item");
                if ExamAuditLines.FindFirst then begin
                  "Lead Auditor ID":=ExamAuditLines."Lead Officer ID";
                  "Lead Auditor Email":=ExamAuditLines."Lead Officer Name";
                  "Planned Start Date":=ExamAuditLines."Planned Start Date";
                  "Planned End Date":=ExamAuditLines."Planned End Date";
                  "Exam Sitting":=ExamAuditLines."Exam Sitting";

                  "Engagement Category":=ExamAuditLines."Engagement Category";

                end
            end;
        }
        field(16;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Audit Report,Audit Action';
            OptionMembers = "Audit Report","Audit Action";
        }
        field(17;Status;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending Approval,Released,Closed';
            OptionMembers = Open,"Pending Approval",Released,Closed;
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
        fieldgroup(DropDown;"Document Type","Engagement Category","Document No.")
        {
        }
    }

    trigger OnInsert()
    begin
        ExaminationSetup.Get;

        if "Document Type"="document type"::"Audit Action" then begin
          ExaminationSetup.TestField("Assurance Department Report");
          if "Document No."='' then
            NoSeriesMgt.InitSeries(ExaminationSetup."Assurance Department Report",ExaminationSetup."Assurance Department Report",0D,"Document No.",ExaminationSetup."Assurance Department Report");
        end;
        if "Document Type"="document type"::"Audit Report" then begin
          ExaminationSetup.TestField("Assurance Report Nos.");
          if "Document No."='' then
            NoSeriesMgt.InitSeries(ExaminationSetup."Assurance Report Nos.",ExaminationSetup."Assurance Report Nos.",0D,"Document No.",ExaminationSetup."Assurance Report Nos.");
        end;
        "Created By":=UserId;
        "Created On":=CurrentDatetime;
        "Document Date":=Today;
    end;

    var
        ExamAuditLines: Record "Exam Audit Lines";
        ExaminationSetup: Record "Examination Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

