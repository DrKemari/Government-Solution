#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85300 "Syllabus Review"
{

    fields
    {
        field(1;"Application No.";Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2;"Syllabus No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Syllabus Header" where (Status=filter("Under Review"|Current));

            trigger OnValidate()
            begin
                Courses.Reset;
                Courses.SetRange(Code,"Syllabus No.");
                if Courses.FindFirst then begin
                  "Syllabus Name":=Courses.Description;
                  "Domain Code":=Courses."Domain Code";
                  "Domain Name":=Courses."Domain Name";
                  end
            end;
        }
        field(3;"Syllabus Name";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Domain Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Domain Areas";

            trigger OnValidate()
            begin
                DomainArea.Reset;
                DomainArea.SetRange(Code,"Domain Code");
                if DomainArea.FindFirst then begin
                  "Domain Name":=DomainArea.Description;
                  end
            end;
        }
        field(5;"Domain Name";Text[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6;"Created On";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7;"Created By";Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8;"Type of Syllabus";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'New Syllabus,Minor Review,Major Review,Annual Review';
            OptionMembers = "New Syllabus","Minor Review","Major Review","Annual Review";
        }
        field(9;"Syllabus Type Name";Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10;"Date of Last Review";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11;New;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(14;Status;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'New,Stakeholder Views,1st Workshop,Consecutive Workshop,1st TaskForce,Consecutive TaskForce,ETS Approval,EC Approval,Board Approval,Completed,Terminated';
            OptionMembers = New,"Stakeholder Views","1st Workshop","Consecutive Workshop","1st TaskForce","Consecutive TaskForce","ETS Approval","EC Approval","Board Approval",Completed,Terminated;
        }
        field(15;"Approval Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(16;Description;Text[450])
        {
            DataClassification = ToBeClassified;
        }
        field(17;"Project No.";Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = Job;
        }
        field(18;"No series";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(19;"Person Responsible";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee;

            trigger OnValidate()
            begin
                Employee.Reset;
                Employee.SetRange("No.","Person Responsible");
                if Employee.FindFirst then begin
                  Name:=Employee."First Name"+' '+Employee."Middle Name"+' '+Employee."Last Name";
                  end
            end;
        }
        field(20;Name;Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(21;"Board Verdict";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = ,Pass,Fail;
        }
        field(22;"No. of Days";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(23;"Verdict Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(24;"Board Comments";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(25;"Termination Reason";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Time-Lapse","Request by StakeHolders","Complete Review";
        }
        field(26;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Institution,Programme';
            OptionMembers = Institution,Programme;
        }
        field(27;"Ordinal Number";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(28;"Letter of Termination";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(29;"Plan No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Curriculum Development Header";
        }
        field(30;"Plan Item";Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = if (New=filter(true)) "Development Plan Lines"."Line No." where ("Development Header"=field("Plan No."),
                                                                                             "Task Type"=filter("New Syllabus"))
                                                                                             else if (New=filter(false)) "Development Plan Lines"."Line No." where ("Development Header"=field("Plan No."),
                                                                                                                                                                    "Task Type"=filter(<>"New Syllabus"));

            trigger OnValidate()
            begin
                DevelopmentPlanLines.Reset;
                DevelopmentPlanLines.SetRange("Development Header","Plan No.");
                DevelopmentPlanLines.SetRange("Line No.","Plan Item");
                if DevelopmentPlanLines.FindFirst then begin
                  "Type of Syllabus":=DevelopmentPlanLines."Task Type";
                  "Syllabus Type Name":=Format(DevelopmentPlanLines."Task Type");
                  "Syllabus No.":=DevelopmentPlanLines."Syllabus ID";
                  "Syllabus Name":=DevelopmentPlanLines.Description;
                  "Start Date":=DevelopmentPlanLines."Planning Start Date";
                  "End Date":=DevelopmentPlanLines."Planning End Date";
                  "Person Responsible":=DevelopmentPlanLines."Responsible Officer";
                  Validate("Person Responsible");
                  end
            end;
        }
        field(31;"Stakeholders Review";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Original,Consecutive';
            OptionMembers = Original,Consecutive;
        }
        field(32;"Review Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'New,Stakeholder Views,1st Workshop,Consecutive Workshop,1st TaskForce,Consecutive TaskForce,ETS Approval,EC Approval,Board Approval,Completed,Terminated';
            OptionMembers = New,"Stakeholder Views","1st Workshop","Consecutive Workshop","1st TaskForce","Consecutive TaskForce","ETS Approval","EC Approval","Board Approval",Completed,Terminated;
        }
    }

    keys
    {
        key(Key1;"Application No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "Stakeholders Review"="stakeholders review"::Consecutive then begin
          if "Application No." = '' then begin
          ExaminationSetup.Get;
          ExaminationSetup.TestField("Consecutive Review  Nos.");
          NoSeriesMgt.InitSeries(ExaminationSetup."Consecutive Review  Nos.",xRec."No series",0D,"Application No.","No series");
        end;
        end;
        if New=true then begin
        if "Application No." = '' then begin
          ExaminationSetup.Get;
          ExaminationSetup.TestField("NewCurriculum Application Nos.");
          NoSeriesMgt.InitSeries(ExaminationSetup."NewCurriculum Application Nos.",xRec."No series",0D,"Application No.","No series");
        end;
        end else begin
        if "Application No." = '' then begin
          ExaminationSetup.Get;
          ExaminationSetup.TestField("Curriculum Application Nos.");
          NoSeriesMgt.InitSeries(ExaminationSetup."Curriculum Application Nos.",xRec."No series",0D,"Application No.","No series");
        end;
        end;
        "Created By":=UserId;
        "Created On":=Today;
    end;

    var
        ExaminationSetup: Record "Examination Setup";
        DomainArea: Record "Domain Areas";
        TypeOfSyllabus: Record "Type Of Syllabus";
        Courses: Record "Syllabus Header";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Employee: Record Employee;
        DevelopmentPlanLines: Record "Development Plan Lines";
}

