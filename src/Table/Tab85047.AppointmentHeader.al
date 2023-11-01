#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85047 "Appointment Header"
{

    fields
    {
        field(1;"Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Appointment,Termination,Int Examination Appointment,Ext Examination Appointment';
            OptionMembers = Appointment,Termination,"Int Examination Appointment","Ext Examination Appointment";
        }
        field(3;"Document Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Project Staff Template ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Staffing Template" where (Examination=field(Examination));

            trigger OnValidate()
            begin
                StaffingTemplate.Reset;
                StaffingTemplate.SetRange("Template ID","Project Staff Template ID");
                if StaffingTemplate.FindSet then begin
                  StaffingTemplate.CalcFields("Total Resources");
                  "Minimum Required No.":=StaffingTemplate."Total Resources";
                end
            end;
        }
        field(5;"Project ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job;

            trigger OnValidate()
            begin
                if Job.Get("Project ID") then begin
                  Examination:=Job."Examination Code";
                  "Project Name":=Job.Description;
                  "Examination Start Date":=Job."Starting Date";
                  "Sitting Cycle":=Job."Examination Sitting Cycle";
                end
            end;
        }
        field(6;Examination;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;

            trigger OnValidate()
            begin
                if Courses.Get(Examination) then begin
                  "Examination Name":=Courses.Description;
                  end
            end;
        }
        field(7;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Appointing Authority";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Project Name";Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10;"Examination Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Examination End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Region Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where ("Operating Unit Type"=filter(Region));

            trigger OnValidate()
            begin
                if ResponsibilityCenter.Get("Region Code") then
                Region:=ResponsibilityCenter.Name
            end;
        }
        field(13;"Directorate Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where ("Operating Unit Type"=filter(Directorate));

            trigger OnValidate()
            begin
                if ResponsibilityCenter.Get("Directorate Code") then
                Directorate:=ResponsibilityCenter.Name
            end;
        }
        field(14;"Department Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where ("Operating Unit Type"=filter("Department/Center"));

            trigger OnValidate()
            begin
                if ResponsibilityCenter.Get("Department Code") then
                Department:=ResponsibilityCenter.Name
            end;
        }
        field(15;Region;Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where ("Operating Unit Type"=filter(Region));
        }
        field(16;Directorate;Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where ("Operating Unit Type"=filter(Directorate));
        }
        field(17;Department;Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where ("Operating Unit Type"=filter("Department/Center"));
        }
        field(18;"Created By";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(19;"Created On";DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(20;Status;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(21;Posted;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(22;"Posted By";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(23;"Posted On";DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(24;"No. Series";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(25;"Minimum Required No.";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(26;"Actual No.";Integer)
        {
            CalcFormula = count("Staff Appointment Line" where ("Header No."=field(Code)));
            FieldClass = FlowField;
        }
        field(27;"Appointment Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Appointment Header";

            trigger OnValidate()
            begin
                if AppointmentHeader.Get("Appointment Code") then
                  begin
                "Project Staff Template ID":=AppointmentHeader."Project Staff Template ID";
                "Project ID":=AppointmentHeader."Project ID";
                Examination:=AppointmentHeader.Examination;
                "Appointing Authority":=AppointmentHeader."Appointing Authority";
                "Project Name":=AppointmentHeader."Project Name";
                "Examination Start Date":=AppointmentHeader."Examination Start Date";
                "Examination End Date":=AppointmentHeader."Examination End Date";
                "Region Code":=AppointmentHeader."Region Code";
                Validate("Region Code");
                "Department Code":=AppointmentHeader."Department Code";
                Validate("Department Code");
                "Directorate Code":=AppointmentHeader."Directorate Code";
                Validate("Directorate Code");
                end
            end;
        }
        field(28;"Examination Center";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Examination Centres";

            trigger OnValidate()
            begin
                ExamCenter.Reset;
                ExamCenter.SetRange(Code,"Examination Center");
                if ExamCenter.FindFirst then begin
                  "Center Name":=ExamCenter.Name;
                  end
            end;
        }
        field(29;"Center Name";Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(30;"Examination Name";Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(31;"Sitting Cycle";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exam Sitting Cycle";

            trigger OnValidate()
            begin
                // ExamSittingCycle.RESET;
                // ExamSittingCycle.SETRANGE("Exam Sitting Cycle","Sitting Cycle");
                // IF ExamSittingCycle.FINDFIRST THEN BEGIN
                // "Examination Start Date":=ExamSittingCycle."Exam Start Date";
                // "Examination End Date":=ExamSittingCycle."Exam End Date";
                // END
            end;
        }
        field(32;MarkCenterDocNo;Code[30])
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
        ExaminationSetup.Get;
        if "Document Type"="document type"::Appointment then begin
        ExaminationSetup.TestField("Staff Appointment Nos.");
        if Code='' then
          NoSeriesMgt.InitSeries(ExaminationSetup."Staff Appointment Nos.",xRec."No. Series",0D,Code,"No. Series");
        end;
        if "Document Type"="document type"::Termination then begin
        ExaminationSetup.TestField("Staff Termination Nos.");
        if Code='' then
          NoSeriesMgt.InitSeries(ExaminationSetup."Staff Termination Nos.",xRec."No. Series",0D,Code,"No. Series");
        end;
        if "Document Type"="document type"::"Int Examination Appointment" then begin
        ExaminationSetup.TestField("Internal Exam Appointment Nos.");
        if Code='' then
          NoSeriesMgt.InitSeries(ExaminationSetup."Internal Exam Appointment Nos.",xRec."No. Series",0D,Code,"No. Series");
        end;
        if "Document Type"="document type"::"Ext Examination Appointment" then begin
        ExaminationSetup.TestField("External Exam Appointment Nos.");
        if Code='' then
          NoSeriesMgt.InitSeries(ExaminationSetup."External Exam Appointment Nos.",xRec."No. Series",0D,Code,"No. Series");
        end;

        "Created By":=UserId;
        "Created On":=CurrentDatetime;
    end;

    var
        ExaminationSetup: Record "Examination Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Job: Record Job;
        ResponsibilityCenter: Record "Responsibility Center";
        StaffingTemplate: Record "Staffing Template";
        AppointmentHeader: Record "Appointment Header";
        ExamCenter: Record "Examination Centres";
        Courses: Record Courses;
}

