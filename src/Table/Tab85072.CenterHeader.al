#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85072 "Center  Header"
{

    fields
    {
        field(1;"Document No.";Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2;Description;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Project No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job;

            trigger OnValidate()
            begin
                if Job.Get("Project No.") then begin
                  "Project Name":=Job.Description;
                  "Sitting Cycle":=Job."Examination Sitting Cycle";
                  Validate("Sitting Cycle");
                  end
            end;
        }
        field(4;"Project Name";Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5;"Sitting Cycle";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exam Sitting Cycle";

            trigger OnValidate()
            begin
                ExamSittingCycle.Reset;
                ExamSittingCycle.SetRange("Exam Sitting Cycle","Sitting Cycle");
                if ExamSittingCycle.FindFirst then begin
                "Examination Start Date":=ExamSittingCycle."Exam Start Date";
                "Examination End Date":=ExamSittingCycle."Exam End Date";
                end
            end;
        }
        field(6;"Center Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Examination Centres" where (Blocked=filter(false));

            trigger OnValidate()
            begin
                if ExamCenter.Get("Center Code") then begin
                  "Center Name":=ExamCenter.Name;

                  end
            end;
        }
        field(7;"Center Name";Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8;"Approval Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(9;"Document Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Dispatched,Closed';
            OptionMembers = Open,Dispatched,Closed;
        }
        field(10;"Created By";Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11;"Created On";DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12;Posted;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Posted On";DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Posted By";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(15;"No. Series";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Examination Start Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(17;"Examination End Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(18;"Total Candidature";Integer)
        {
            CalcFormula = count("Exam Booking Entries" where ("Exam Sitting"=field("Sitting Cycle"),
                                                              Status=filter(Open),
                                                              Blocked=filter(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(19;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Examination Center,Marking Center,Marking Material,Script Receipt,Marking Tally';
            OptionMembers = "Examination Center","Marking Center","Marking Material","Script Receipt","Marking Tally";
        }
        field(20;"Marking Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(21;"Marking End Date";Date)
        {
            DataClassification = ToBeClassified;
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
        if "Document Type"="document type"::"Marking Tally" then begin
          ExaminationSetup.TestField("Marker Tally  Nos");
          if "Document No."='' then
          NoSeriesMgt.InitSeries(ExaminationSetup."Marker Tally  Nos",xRec."No. Series",0D,"Document No.","No. Series");
        end;
        if "Document Type"="document type"::"Script Receipt" then begin
          ExaminationSetup.TestField("Script Receipt Nos");
          if "Document No."='' then
          NoSeriesMgt.InitSeries(ExaminationSetup."Script Receipt Nos",xRec."No. Series",0D,"Document No.","No. Series");
        end else begin
        ExaminationSetup.TestField("Dispatch Header Nos.");
        if "Document No."='' then begin
          NoSeriesMgt.InitSeries(ExaminationSetup."Dispatch Header Nos.",xRec."No. Series",0D,"Document No.","No. Series");
        end;
        end;
        "Created By":=UserId;
        "Created On":=CurrentDatetime;
    end;

    var
        ExaminationSetup: Record "Examination Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        ExamCenter: Record "Examination Centres";
        Job: Record Job;
        ExamSittingCycle: Record "Exam Sitting Cycle";
}

