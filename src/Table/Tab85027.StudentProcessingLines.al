#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85027 "Student Processing Lines"
{

    fields
    {
        field(1; "Booking Header No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Line No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3; "Course Id"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;

            trigger OnValidate()
            begin
                if "Document Type" = "document type"::Confirmation then begin
                    if Courses.Get("Course Id") then begin
                        Description := Courses.Description;
                    end;
                    ExaminationSetup.Get;
                    "Amount LCY" := ExaminationSetup."Default Confirmation Fees";
                    Amount := ExaminationSetup."Default Confirmation Fees";
                end;
            end;
        }
        field(4; Section; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Section where(Course = field("Course Id"),
                                           Part = field(Part));

            trigger OnValidate()
            begin
                Rate := 1;
                //get conversion rate
                StudentPHeader.Reset;
                StudentPHeader.SetRange("No.", "Booking Header No.");
                if StudentPHeader.FindSet then begin
                    Resource.Reset;
                    Resource.SetRange("Course ID", StudentPHeader."Examination ID");
                    Resource.SetRange("No.", StudentPHeader."Fee Type");
                    if Resource.FindSet then begin
                        //IF TYPE IS Section
                        if "Booking Type" = "booking type"::Section then begin
                            //get section name
                            if Sections.Get(Section) then begin
                                Description := Sections.Description;
                            end;
                            CountPapers := 0;
                            Papers.Reset;
                            Papers.SetRange(Section, Section);
                            if Papers.FindSet then begin
                                repeat
                                    CountPapers := CountPapers + 1;
                                    ResourcePrice.Reset;
                                    ResourcePrice.SetRange(Code, Resource."No.");
                                    ResourcePrice.SetRange("Work Type Code", StudentPHeader."Type Code");
                                    if ResourcePrice.FindSet then begin
                                        Amount := ResourcePrice."Unit Price" * CountPapers;
                                        "Amount LCY" := Amount * Rate;
                                    end;

                                until Papers.Next = 0;
                            end
                        end
                    end
                end
            end;
        }
        field(5; "Part"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Level where(Course = field("Course Id"));

            trigger OnValidate()
            var
                Lines: Record "Student Processing Lines";
                TXT001: label 'You are not allowed to select papers in different Levels';
            begin
                Rate := 1;
                //get conversion rate
                StudentPHeader.Reset;
                StudentPHeader.SetRange("No.", "Booking Header No.");
                if StudentPHeader.FindSet then begin
                    if ((StudentPHeader."Document Type" = StudentPHeader."document type"::Booking)
                      and (StudentPHeader."Manual Input" = false))
                    then begin
                        Lines.Reset;
                        Lines.SetRange("Booking Header No.", StudentPHeader."No.");
                        Lines.SetFilter("Line No.", '<>%1', Lines."Line No.");
                        if Lines.FindFirst then begin
                            // IF Lines.Part<>Part THEN
                            //  ERROR(TXT001);
                        end;
                    end;

                    Resource.Reset;
                    Resource.SetRange("Course ID", StudentPHeader."Examination ID");
                    Resource.SetRange("No.", StudentPHeader."Fee Type");
                    if Resource.FindSet then begin
                        if "Booking Type" = "booking type"::Part then begin
                            //get part name
                            if Parts.Get(Part, StudentPHeader."Examination ID") then begin
                                Description := Parts.Description;
                            end;
                            CountPapers := 0;
                            Papers.Reset;
                            Papers.SetRange(Level, Part);
                            if Papers.FindSet then begin
                                repeat
                                    CountPapers := CountPapers + 1;
                                    ResourcePrice.Reset;
                                    ResourcePrice.SetRange(Code, Resource."No.");
                                    ResourcePrice.SetRange("Work Type Code", StudentPHeader."Type Code");
                                    if ResourcePrice.FindSet then begin
                                        Amount := ResourcePrice."Unit Price" * CountPapers;
                                        "Amount LCY" := Amount * Rate;
                                    end;

                                until Papers.Next = 0;
                            end
                        end else begin
                            //get the cost per paper based on part

                        end;
                    end;

                end;
            end;
        }
        field(6; Paper; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Papers where(Course = field("Course Id"),
                                          Level = field(Part));

            trigger OnValidate()
            begin
                StudentPHeader.Reset;
                StudentPHeader.SetRange("No.", "Booking Header No.");
                if StudentPHeader.FindFirst then begin
                    //check if the subject has been exempted
                    ExemptionEntries.Reset;
                    ExemptionEntries.SetRange("Course Id", "Course Id");
                    ExemptionEntries.SetRange("Stud. Reg. No", StudentPHeader."Student Reg. No.");
                    ExemptionEntries.SetRange("No.", Paper);
                    //added to filter entries that have not been removed
                    ExemptionEntries.SetRange(Deleted, false);
                    if ExemptionEntries.FindFirst then
                        if ExemptionEntries."Stud. Reg. No" <> '' then
                            Error(TXT001, ExemptionEntries."No.", ExemptionEntries."Stud. Reg. No");

                    //get booking amount

                    if ("Document Type" = "document type"::Defferment) or ("Document Type" = "document type"::Withdrawal) then begin
                        ExamBookingEntries.Reset;
                        ExamBookingEntries.SetRange(Examination, "Course Id");
                        ExamBookingEntries.SetRange("Student Reg No.", StudentPHeader."Student Reg. No.");
                        ExamBookingEntries.SetRange(Paper, Paper);
                        if ExamBookingEntries.FindFirst then begin
                            Amount := ExamBookingEntries."Fee Amount";
                            "Amount LCY" := ExamBookingEntries."Fee Amount"
                        end
                    end;
                    if "Document Type" = "document type"::Remarking then begin
                        ExamBookingEntries.Reset;
                        ExamBookingEntries.SetRange("Student Reg No.", StudentPHeader."Student Reg. No.");
                        ExamBookingEntries.SetRange(Paper, Paper);
                        if not ExamBookingEntries.FindSet then
                            Error(TXT002);
                    end;
                    if "Document Type" = "document type"::Booking then begin
                        Papers.Reset;
                        Papers.SetRange(Code, Paper);//get paper ppart
                        if Papers.FindFirst then begin

                            Resource.Reset;
                            Resource.SetRange("Course ID", "Course Id");
                            Resource.SetRange("Part ID", Papers.Level);//Get the fee type code
                            if Resource.FindSet then begin
                                repeat

                                    ResourcePrice.Reset;
                                    ResourcePrice.SetRange("Document Type", ResourcePrice."document type"::Booking);
                                    ResourcePrice.SetRange("Currency Code", StudentPHeader."Currency Code");
                                    ResourcePrice.SetRange(Code, Resource."No.");
                                    if ResourcePrice.FindFirst then begin//get the price

                                        Amount := ResourcePrice."Unit Price";
                                        "Amount LCY" := ResourcePrice."Unit Price";
                                    end;
                                until Resource.Next = 0;
                            end;
                        end;
                    end;
                end;
                if Papers.Get(Paper) then
                    Description := Papers.Description;
            end;
        }
        field(7; Description; Text[100])
        {
        }
        field(8; "Currency Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Currency;
        }
        field(9; Amount; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Amount LCY"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Registration No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Examination Account" where("Student Cust No." = field("Student No."));

            trigger OnValidate()
            begin
                if ExaminationAccount.Get("Registration No.") then begin
                    Name := ExaminationAccount."First Name" + ' ' + ExaminationAccount."Middle Name" + ' ' + ExaminationAccount.Surname;
                    "Course Id" := ExaminationAccount."Course ID";
                    Validate("Course Id");

                    if "Document Type" = "document type"::Renewal then begin
                        ExaminationSetup.Get;
                        Amount := ExaminationSetup."Renewal Fee" * ExaminationAccount."Renewal Pending";
                        "Amount LCY" := Amount * 1;
                    end;

                end;
            end;
        }
        field(12; Name; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(13; "Preferred Exam Center"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Examination Centres";
        }
        field(14; "Sitting Cycle"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(15; Year; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(16; Blocked; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(17; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Booking,Withdrawal;
        }
        field(18; Exempted; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(19; "Booking Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Paper,Section,Part,Renewal';
            OptionMembers = Paper,Section,"Part",Renewal;
        }
        field(20; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Registration,Booking,Exemption,Withdrawal,Defferment,Disciplinary,Reinstatement,Collection,Remarking,Renewal,Re-Activation,Confirmation,Institution Confirmation';
            OptionMembers = Registration,Booking,Exemption,Withdrawal,Defferment,Disciplinary,Reinstatement,Collection,Remarking,Renewal,"Re-Activation",Confirmation,"Institution Confirmation";
        }
        field(21; "Paper Marks"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(22; "Marker No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Marker Task Allocation"."Resource No" where("Paper ID" = field(Paper));

            trigger OnValidate()
            var
                Resource: Record Resource;
            begin
                Resource.Reset;
                Resource.SetRange("No.", "Marker No");
                if Resource.FindFirst then begin
                    "Marker Name" := Resource.Name;
                end
            end;
        }
        field(23; "Marker Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(24; "Checker No"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource;

            trigger OnValidate()
            begin
                Resource.Reset;
                Resource.SetRange("No.", "Checker No");
                if Resource.FindFirst then begin
                    "Checker Name" := Resource.Name;
                end
            end;
        }
        field(25; "Checker Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(26; "Student No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer where("Customer Type" = filter(Student));
        }
        field(27; "Last Modified Date Time"; DateTime)
        {
            Caption = 'Last Modified Date Time';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(28; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(29; "Transaction Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Booking,Renewal,Reinstatement';
            OptionMembers = Booking,Renewal,Reinstatement;
        }
        field(30; Selected; Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Booking Header No.", "Line No.", "Course Id", "Document Type", "Student No.", Paper)
        {
            Clustered = true;
        }
        key(Key2; "Amount LCY")
        {
        }
        key(Key3; "Amount LCY", "Booking Header No.", "Document Type")
        {
            SumIndexFields = "Amount LCY";
        }
        key(Key4; "Amount LCY", "Booking Header No.", Type, "Document Type")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnModify()
    begin
        "Last Date Modified" := Today;
        "Last Modified Date Time" := CurrentDatetime;
    end;

    var
        ExaminationAccount: Record "Examination Account";
        ResourcePrice: Record "Resource Price";
        ResourceCost: Record "Resource Cost";
        StudentPHeader: Record "Student Processing Header";
        Resource: Record Resource;
        Rate: Decimal;
        ExemptionEntries: Record "Exemption Entries";
        TXT001: label 'The subject %1,is already exempted for %2';
        CountPapers: Integer;
        Papers: Record Papers;
        Sections: Record Section;
        Parts: Record Level;
        StudentHeader: Record "Student Processing Header";
        Cust: Record Customer;
        ExaminationSetup: Record "Examination Setup";
        ExamBookingEntries: Record "Exam Booking Entries";
        TXT002: label 'The paper selected has not been sat by the candidate';
        Courses: Record Courses;
}

