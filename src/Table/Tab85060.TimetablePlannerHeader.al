#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85060 "Timetable Planner Header"
{

    fields
    {
        field(1;"Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Exam ID";Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = Courses;
        }
        field(3;"Exam Sitting ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exam Sitting Cycle";

            trigger OnValidate()
            begin
                ExamSittingCycle.Reset;
                ExamSittingCycle.SetRange("Exam Sitting Cycle","Exam Sitting ID");
                if ExamSittingCycle.FindFirst then begin
                  "Exam Start Date":=ExamSittingCycle."Exam Start Date";
                  "Exam End Date":=ExamSittingCycle."Exam End Date";
                  "Examination  Project Code":=ExamSittingCycle."Examination Project ID";

                  Description:='Timetable planner for'+' '+ExamSittingCycle."Project Description";
                 end
            end;
        }
        field(4;"Document Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Financial Year Code";Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6;Description;Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Corporate Strategic Plan ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Corporate Strategic Plans";
        }
        field(8;"Financial Budget ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Budget Name";
        }
        field(9;"Exam Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Exam End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Total Candidature";Integer)
        {
            CalcFormula = count("Exam Booking Entries" where ("Exam Sitting"=field("Exam Sitting ID"),
                                                              Status=filter(Open)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(12;"Approval Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(13;Posted;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Created By";Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(15;"Created On";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16;"Created Time";Time)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(17;"No. Series";Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(18;Published;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(19;"Published By";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(20;"Published On";DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(21;"Examination  Project Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job where ("Record Type"=filter(Examination));
        }
        field(22;"Examination  Project";Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Code","Exam ID","Exam Sitting ID")
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
        ExaminationSetup.TestField("Timetable Planner Nos.");
        if Code='' then
          NoSeriesMgt.InitSeries(ExaminationSetup."Timetable Planner Nos.",xRec."No. Series",0D,Code,"No. Series");
        "Created By":=UserId;
        "Created On":=Today;
        "Created Time":=Time;
    end;

    var
        ExamSittingCycle: Record "Exam Sitting Cycle";
        ExaminationSetup: Record "Examination Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

