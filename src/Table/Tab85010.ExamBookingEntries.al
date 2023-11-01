#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85010 "Exam Booking Entries"
{
    DrillDownPageID = "Examination Appointments";
    LookupPageID = "Examination Appointments";

    fields
    {
        field(1;"Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Entry No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;"Student Reg No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Examination Account";

            trigger OnValidate()
            begin
                if ExaminationAccount.Get("Student Reg No.") then begin
                  "Stud. Cust No.":=ExaminationAccount."Student Cust No.";
                  "Student Name":=ExaminationAccount."First Name"+' '+ExaminationAccount."Middle Name"+' '+ExaminationAccount.Surname;
                  Examination:=ExaminationAccount."Course ID";
                  Validate(Examination);
                  Description:=ExaminationAccount."Course Description";
                  end
            end;
        }
        field(4;"Student Name";Text[200])
        {
            DataClassification = ToBeClassified;
        }
        field(5;Examination;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;
        }
        field(6;Section;Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Part";Code[30])
        {
            Caption = 'Level';
            DataClassification = ToBeClassified;
            TableRelation = Level.Code;
        }
        field(8;Paper;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Papers where (Course=field(Examination),
                                          Level=field(Part));

            trigger OnValidate()
            begin
                if Papers.Get(Paper) then begin
                   Description:=Papers.Description;
                end;
            end;
        }
        field(9;Description;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Currency Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Fee Amount";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Fee Amount LCY";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Exam Center";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Examination Centres";

            trigger OnValidate()
            begin
                if ExamCenter.Get("Exam Center") then
                  "Center Name":=ExamCenter.Name;
            end;
        }
        field(14;"Center Name";Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Exam Sitting";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exam Sitting Cycle";

            trigger OnValidate()
            begin
                ExamSittingCycle.Reset;
                ExamSittingCycle.SetRange("Exam Sitting Cycle","Exam Sitting");
                if ExamSittingCycle.FindFirst then begin
                  Year:= Format(Date2dmy(ExamSittingCycle."Exam Start Date",3));
                  "Project Code":=ExamSittingCycle."Examination Project ID"
                end
            end;
        }
        field(16;Year;Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(17;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(18;"Stud. Cust No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer;
        }
        field(19;"Project Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job;
        }
        field(20;Status;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Ongoing,Withdrawn,Defered,Closed,Failed,Cancelled,Passed,Under Disciplinary,Abeyance';
            OptionMembers = Open,Ongoing,Withdrawn,Defered,Closed,Failed,Cancelled,Passed,"Under Disciplinary",Abeyance;
        }
        field(21;"Last Modified Date Time";DateTime)
        {
            Caption = 'Last Modified Date Time';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(22;"Last Date Modified";Date)
        {
            Caption = 'Last Date Modified';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(23;More;Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(24;"To Delete";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(25;Cancel;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(26;Cancelled;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(27;"Cancelled Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(28;"Cancelled By";Code[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Entry No.","Student Reg No.")
        {
            Clustered = true;
        }
        key(Key2;"Exam Center",Paper,Status)
        {
        }
        key(Key3;Status,"Student Reg No.")
        {
        }
        key(Key4;Status,Cancelled,"Student Reg No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        "Last Date Modified":=Today;
        "Last Modified Date Time":=CurrentDatetime;
    end;

    trigger OnModify()
    begin
        "Last Date Modified":=Today;
        "Last Modified Date Time":=CurrentDatetime;
    end;

    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        ExaminationSetup: Record "Examination Setup";
        UserSetup: Record "User Setup";
        Employee: Record Employee;
        ExaminationAccount: Record "Examination Account";
        Courses: Record Courses;
        ExamCenter: Record "Examination Centres";
        ExamSittingCycle: Record "Exam Sitting Cycle";
        Papers: Record Papers;

    local procedure SetLastModifiedDateTime()
    begin
        //"Last Modified Date Time" := CURRENTDATETIME;
        //"Last Date Modified" := TODAY;
    end;
}

