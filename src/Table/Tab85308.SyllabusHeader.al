#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85308 "Syllabus Header"
{

    fields
    {
        field(1;"Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Course ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;

            trigger OnValidate()
            begin
                Courses.Reset;
                Courses.SetRange(Code,"Course ID");
                if Courses.FindFirst then begin
                  "Course Name":=Courses.Description;
                  end
            end;
        }
        field(3;Description;Text[450])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"External Document No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Project ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job;
        }
        field(6;"Course Name";Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7;Status;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Current,Under Review,Retired';
            OptionMembers = " ",Current,"Under Review",Retired;
        }
        field(8;"No. of Major Reviews";Integer)
        {
            CalcFormula = count(Employee);
            Editable = false;
            FieldClass = FlowField;
        }
        field(9;"No. of Minor Reviews";Integer)
        {
            CalcFormula = count(Employee);
            Editable = false;
            FieldClass = FlowField;
        }
        field(10;"Approval Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Document Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12;"Next Major Review Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Next Minor Review Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"No. of Units/Papers";Integer)
        {
            CalcFormula = count("Syllabus Papers" where ("Syllabus No."=field(Code)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(15;"Created By";Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16;"Created On";DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(17;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Syllabus,Draft,Version';
            OptionMembers = Syllabus,Draft,Version;
        }
        field(18;"No series";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(19;"Domain Code";Code[30])
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
        field(20;"Domain Name";Text[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(21;"Original Syllabus No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Syllabus Header";
        }
        field(22;"Version No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Code","Version No.")
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
         if "Document Type"="document type"::Draft then begin
        if Code = '' then begin
          ExaminationSetup.TestField("Draft Syllabus Nos.");
          NoSeriesMgt.InitSeries(ExaminationSetup."Draft Syllabus Nos.",xRec."No series",0D,Code,"No series");
        end;
        end;
        if "Document Type"="document type"::Syllabus then begin
        if Code = '' then begin
         ExaminationSetup.TestField("Syllabus Nos.");
          NoSeriesMgt.InitSeries(ExaminationSetup."Syllabus Nos.",xRec."No series",0D,Code,"No series");
        end;
        end;
    end;

    var
        Courses: Record Courses;
        ExaminationSetup: Record "Examination Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        DomainArea: Record "Domain Areas";
}

