#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85032 "Center Booking Header"
{

    fields
    {
        field(1;"Header No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Student Reg No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Examination Account" where ("Course ID"=field("Course Id"));
        }
        field(3;"Student Name";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Course Id";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;

            trigger OnValidate()
            begin
                if Courses.Get("Course Id") then begin
                  "Course Description":=Courses.Description;
                   end;
            end;
        }
        field(5;"Course Description";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(6;Region;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exam Regions";
        }
        field(7;Zone;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exam Zones" where ("Region Code"=field(Region));
        }
        field(8;"Exam Center Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Examination Centres" where (Blocked=filter(false));

            trigger OnValidate()
            begin
                if ExamCenter.Get("Exam Center Code") then begin
                  "Center Name":=ExamCenter.Name;
                  "Maximum Capacity":=ExamCenter."Maximum Capacity Per Session";
                
                
                end;/*
                CenterCourseCapacity.RESET;
                CenterCourseCapacity.SETRANGE("Center Code","Exam Center Code");
                CenterCourseCapacity.SETRANGE("Course Id","Course Id");
                IF CenterCourseCapacity.FINDFIRST THEN BEGIN
                
                 END
                 */
                 if Type=Type::"Re-Allocation" then begin
                 if "Initial Center Booking"="Exam Center Code" then
                  begin
                    Error('The initial center should not be the same as the new one');
                  end
                  end

            end;
        }
        field(9;"Center Name";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Examination Sitting";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exam Sitting Cycle";

            trigger OnValidate()
            var
                ExamSittingCycle: Record "Exam Sitting Cycle";
            begin
                ExamSittingCycle.Reset;
                ExamSittingCycle.SetRange("Exam Sitting Cycle","Examination Sitting");
                if ExamSittingCycle.FindFirst then begin
                  Job.Reset;
                  Job.SetRange("No.",ExamSittingCycle."Examination Project ID");
                  if Job.FindFirst then begin
                    "Sitting Description":=Job.Description;
                     Year:=Job."Financial Year";
                  end;
                end
            end;
        }
        field(11;Year;Code[10])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Annual Reporting Codes";
        }
        field(12;"Maximum Capacity";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Available Capacity";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Approval Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Open,"Pending Approval",Released,Closed;
        }
        field(15;"Created By";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Created On";DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(17;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Allocation,Re-Allocation,Cancellation';
            OptionMembers = Allocation,"Re-Allocation",Cancellation;
        }
        field(18;"No. Series";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(19;Posted;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(20;"Occupied Capacity";Integer)
        {
            CalcFormula = count("Center Booking Lines" where ("Exam Center Code"=field("Exam Center Code"),
                                                              "Header No."=field("Header No.")));
            FieldClass = FlowField;

            trigger OnValidate()
            begin
                CalcFields("Occupied Capacity");
                "Available Capacity":="Maximum Capacity"-"Occupied Capacity";
            end;
        }
        field(21;"Subject Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Papers;

            trigger OnValidate()
            begin
                if Papers.Get("Subject Code") then
                  "Subject Name":=Papers.Description;
            end;
        }
        field(22;"Subject Name";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(23;"Initial Center Booking";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Center Booking Header" where (Posted=filter(true));

            trigger OnValidate()
            begin
                if CenterBookingHeader.Get("Initial Center Booking") then begin
                  ExamCenter.Reset;
                  ExamCenter.SetRange(Code,CenterBookingHeader."Exam Center Code");
                  if ExamCenter.FindFirst then begin
                  "Initial Center Name":=ExamCenter.Name;

                  end;
                   "Initial Center Code":=CenterBookingHeader."Exam Center Code";
                  "Examination Sitting":=CenterBookingHeader."Examination Sitting";
                  Validate("Examination Sitting");

                  end;
                if "Initial Center Code"="Exam Center Code" then
                  begin
                    Error('The initial center should not be the same as the new one');
                  end
            end;
        }
        field(24;"Initial Center Name";Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(25;"Sitting Description";Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(26;"Initial Center Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Examination Centres";

            trigger OnValidate()
            begin
                if ExamCenter.Get("Initial Center Code") then begin
                  "Initial Center Name":=ExamCenter.Name;


                end;
                 if Type=Type::"Re-Allocation" then begin
                 if "Initial Center Code"="Exam Center Code" then
                  begin
                    Error('The initial center should not be the same as the new one');
                  end
                  end
            end;
        }
        field(27;Multiple;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(28;"Transfer Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Examination,Section';
            OptionMembers = Examination,Section;
        }
        field(29;"Transfer Examination";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;
        }
        field(30;"Transfer Section";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Section where (Course=field("Transfer Examination"));
        }
        field(31;"Last Modified Date Time";DateTime)
        {
            Caption = 'Last Modified Date Time';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(32;"Last Date Modified";Date)
        {
            Caption = 'Last Date Modified';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(33;"Rejection Reason";Text[800])
        {
            DataClassification = ToBeClassified;
        }
        field(34;"Total Students";Integer)
        {
            CalcFormula = count("Center Booking Lines" where ("Header No."=field("Header No.")));
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Header No.")
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
        if Type=Type::Allocation then begin
          ExaminationSetup.TestField("Allocation Nos.");
          if "Header No."='' then
          NoSeriesMgt.InitSeries(ExaminationSetup."Allocation Nos.",xRec."No. Series",0D,"Header No.","No. Series");
        end;
        if Type=Type::"Re-Allocation" then begin
          ExaminationSetup.TestField("RE-Allocation Nos.");
          if "Header No."='' then
          NoSeriesMgt.InitSeries(ExaminationSetup."RE-Allocation Nos.",xRec."No. Series",0D,"Header No.","No. Series");
        end;
        if Type=Type::Cancellation then begin
          ExaminationSetup.TestField("Cancellation Nos.");
          if "Header No."='' then
          NoSeriesMgt.InitSeries(ExaminationSetup."Cancellation Nos.",xRec."No. Series",0D,"Header No.","No. Series");
        end;
        "Created By":=UserId;
        "Created On":=CurrentDatetime;
    end;

    trigger OnModify()
    begin
        "Last Date Modified":=Today;
        "Last Modified Date Time":=CurrentDatetime;
    end;

    var
        ExaminationSetup: Record "Examination Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        ExamCenter: Record "Examination Centres";
        CenterCourseCapacity: Record "Center Course Capacity";
        Courses: Record Courses;
        Papers: Record Papers;
        Job: Record Job;
        CenterBookingHeader: Record "Center Booking Header";
}

