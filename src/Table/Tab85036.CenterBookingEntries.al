#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85036 "Center Booking Entries"
{
    DrillDownPageID = "Center Booking Entries";
    LookupPageID = "Center Booking Entries";

    fields
    {
        field(1;"Header No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Center Booking Header";
        }
        field(2;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;"Student Reg No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Examination Account" where ("Course ID"=field("Examination Id"));
        }
        field(4;"Student Name";Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Examination Id";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;

            trigger OnValidate()
            var
                TXT001: label 'The selected center %1,does not offer the exam %2';
            begin
                if Courses.Get("Examination Id") then
                  begin
                    CenterCourseCapacity.Reset;
                    CenterCourseCapacity.SetRange("Course Id","Examination Id");
                    if not CenterCourseCapacity.FindSet then
                      Error(TXT001,"Center Name","Examination Id") else
                    "Examination Description":=Courses.Description;
                  end;
            end;
        }
        field(6;"Examination Description";Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(7;Region;Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(8;Zone;Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Exam Center Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Examination Centres";

            trigger OnValidate()
            begin
                if ExamCenter.Get("Exam Center Code") then begin
                  "Center Name":=ExamCenter.Name;

                 end
            end;
        }
        field(10;"Center Name";Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Examination Sitting";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exam Sitting Cycle";
        }
        field(12;Year;Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Maximum Capacity";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Available Capacity";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Subject Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Papers;

            trigger OnValidate()
            begin
                if Papers.Get("Subject Code") then
                  "Subject Name":=Papers.Description;
            end;
        }
        field(16;"Subject Name";Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(17;"Re-Allocation Center Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Examination Centres";

            trigger OnValidate()
            begin
                if ExamCenter.Get("Exam Center Code") then begin
                  "Center Name":=ExamCenter.Name;

                 end
            end;
        }
        field(18;"Re-Allocation Center Name";Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(19;Status;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Allocated,Re-allocated,Cancelled';
            OptionMembers = Allocated,"Re-allocated",Cancelled;
        }
        field(20;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
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
    }

    keys
    {
        key(Key1;"Header No.","Line No.","Student Reg No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnModify()
    begin
        "Last Date Modified":=Today;
        "Last Modified Date Time":=CurrentDatetime;
    end;

    var
        ExamCenter: Record "Examination Centres";
        CenterCourseCapacity: Record "Center Course Capacity";
        Courses: Record Courses;
        Papers: Record Papers;
}

