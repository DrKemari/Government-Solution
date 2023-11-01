#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85029 "Student Processing Header"
{

    fields
    {
        field(1; "No."; Code[35])
        {
            Editable = false;
            NotBlank = false;

            trigger OnValidate()
            begin
                if "Document Type" = "document type"::Registration then begin
                    if "No." <> xRec."No." then
                        NoSeriesMgt.TestManual(ExaminationSetup."Application Nos.");
                end;
                if "Document Type" = "document type"::Registration then begin
                    if "No." <> xRec."No." then
                        NoSeriesMgt.TestManual(ExaminationSetup."Examination Booking Nos.");
                end;
                if "Document Type" = "document type"::Exemption then begin
                    if "No." <> xRec."No." then
                        NoSeriesMgt.TestManual(ExaminationSetup."Exemption Nos.");
                end;
                if "Document Type" = "document type"::Withdrawal then begin
                    if "No." <> xRec."No." then
                        NoSeriesMgt.TestManual(ExaminationSetup."Withdrawal Nos.");
                end;
                if "Document Type" = "document type"::Defferment then begin
                    if "No." <> xRec."No." then
                        NoSeriesMgt.TestManual(ExaminationSetup."Defferment Nos.");
                end;
                if "Document Type" = "document type"::Disciplinary then begin
                    if "No." <> xRec."No." then
                        NoSeriesMgt.TestManual(ExaminationSetup."Disciplinary Nos.");
                end;
                if "Document Type" = "document type"::Reinstatement then begin
                    if "No." <> xRec."No." then
                        NoSeriesMgt.TestManual(ExaminationSetup."Reinstatement  Nos.");
                end;
                if "Document Type" = "document type"::Collection then begin
                    if "No." <> xRec."No." then
                        NoSeriesMgt.TestManual(ExaminationSetup."Collection Nos.");
                end;
                if "Document Type" = "document type"::Confirmation then begin
                    if "No." <> xRec."No." then
                        NoSeriesMgt.TestManual(ExaminationSetup."Confirmation Application Nos.");
                end;
                if "Document Type" = "document type"::Remarking then begin
                    if "No." <> xRec."No." then
                        NoSeriesMgt.TestManual(ExaminationSetup."Remarking Nos.");
                end;
            end;
        }
        field(2; Date; Date)
        {
            Editable = false;
        }
        field(3; "Document Type"; Option)
        {
            OptionCaption = 'Registration,Booking,Exemption,Withdrawal,Defferment,Disciplinary,Reinstatement,Collection,Remarking,Renewal,Re-Activation,Confirmation,Institution Confirmation';
            OptionMembers = Registration,Booking,Exemption,Withdrawal,Defferment,Disciplinary,Reinstatement,Collection,Remarking,Renewal,"Re-Activation",Confirmation,"Institution Confirmation";
        }
        field(4; "Student No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer where("Customer Type" = filter(Student));

            trigger OnValidate()
            begin
                Cust.Reset;
                Cust.SetRange("No.", "Student No.");
                if Cust.FindSet then begin
                    "Student Name" := UpperCase(Cust.Name);
                    "First Name" := UpperCase(Cust."First Name");
                    "Middle Name" := UpperCase(Cust."Middle Name");
                    Surname := UpperCase(Cust."Last Name");
                    Address := Cust.Address;
                    "Post Code" := Cust."Post Code";
                    City := Cust.City;
                    "Currency Code" := Cust."Currency Code";
                    "NCPWD No." := Cust."NCPWD No.";
                    County := Cust.County;
                    "Phone No." := Cust."Phone No.";
                    Email := Lowercase(Cust."E-Mail");
                    if Image.Hasvalue = false then
                        Image := Cust.Image;
                    "ID Number/Passport No." := Cust."ID. No.";
                    if Cust.Gender = Cust.Gender::Female then
                        Gender := Gender::Female;
                    if Cust.Gender = Cust.Gender::Male then
                        Gender := Gender::Male;
                    if Cust.Gender = Cust.Gender::Other then
                        Gender := Gender::" ";
                    "Date of Birth" := Cust."Date of Birth";
                    if "Document Type" = "document type"::Confirmation then begin
                        "Requestor No." := "Student No.";
                        "Requested By E-Mail" := Cust."E-Mail";

                    end;

                end;
                if "Document Type" = "document type"::Booking then begin
                    ExamSittingCycle.Reset;
                    ExamSittingCycle.SetRange("Sitting Status", ExamSittingCycle."sitting status"::Active);
                    ExamSittingCycle.SetRange(Closed, false);
                    if ExamSittingCycle.FindFirst then begin
                        "Examination Sitting" := ExamSittingCycle."Exam Sitting Cycle";
                        Validate("Examination Sitting");
                        "Examination Project Code" := ExamSittingCycle."Examination Project ID";
                        Validate("Examination Project Code");
                    end
                end;
                //get other details
                StudentHeader.Reset;
                StudentHeader.SetRange("Student No.", "Student No.");
                StudentHeader.SetRange("Document Type", StudentHeader."document type"::Registration);
                if StudentHeader.FindSet then begin
                    "Highest Academic QCode" := StudentHeader."Highest Academic QCode";
                    "Training Institution Code" := StudentHeader."Training Institution Code";
                    "Date of Birth" := StudentHeader."Date of Birth";
                    Gender := StudentHeader.Gender;
                    Disabled := StudentHeader.Disabled;
                    "Currency Code" := StudentHeader."Currency Code";
                    "ID Number/Passport No." := StudentHeader."ID Number/Passport No.";
                end;
            end;
        }
        field(5; "Student Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = true;
        }
        field(6; "First Name"; Text[50])
        {
            Caption = 'First Name';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "First Name" := UpperCase("First Name");
            end;
        }
        field(7; "Middle Name"; Text[50])
        {
            Caption = 'Middle Name';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Middle Name" := UpperCase("Middle Name");
            end;
        }
        field(8; Surname; Text[50])
        {
            Caption = 'Surname';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                Surname := UpperCase(Surname);
            end;
        }
        field(9; "ID Number/Passport No."; Code[25])
        {
            Caption = 'ID Number/Passport No./Birth Certificate';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            var
                ProcessingHeader: Record "Student Processing Header";
            begin
                //ensure no applicant can attempt twice

                ProcessingHeader.Reset;
                ProcessingHeader.SetRange("ID Number/Passport No.", "ID Number/Passport No.");
                ProcessingHeader.SetRange("Document Type", "Document Type");
                ProcessingHeader.SetRange(Posted, false);
                if ProcessingHeader.FindSet then begin
                    if ProcessingHeader."No." <> "No." then
                        Error(TXT002, ProcessingHeader."No.", ProcessingHeader."ID Number/Passport No.");
                end;


                if "Document Type" = "document type"::Registration then begin
                    ExamSittingCycle.Reset;
                    ExamSittingCycle.SetRange("Sitting Status", ExamSittingCycle."sitting status"::Active);
                    if ExamSittingCycle.FindFirst then begin
                        "Examination Sitting" := ExamSittingCycle."Exam Sitting Cycle";
                        Validate("Examination Sitting");
                        "Examination Project Code" := ExamSittingCycle."Examination Project ID";
                        Validate("Examination Project Code");
                    end
                end
            end;
        }
        field(10; "Examination ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Job Task"."Job Task No." where("Job No." = field("Examination Project Code"));

            trigger OnValidate()
            var
                TXT001: label 'The student %1,has an existing registration  for the examination %2';
                ProcessingHeader: Record "Student Processing Header";
                TXT002: label 'Professional courses are not open for registrations currently,Kindly await for further communication';
            begin
                if "Document Type" = "document type"::Registration then begin
                    //check the student does not have a registration with same course
                    StudentHeader.Reset;
                    StudentHeader.SetRange("ID Number/Passport No.", "ID Number/Passport No.");
                    StudentHeader.SetRange("Examination ID", "Examination ID");
                    StudentHeader.SetRange("Document Type", StudentHeader."document type"::Registration);
                    StudentHeader.SetRange(Submitted, true);
                    StudentHeader.SetRange("Approval Status", StudentHeader."approval status"::Open);
                    if StudentHeader.FindFirst then begin
                        Error(TXT001, StudentHeader."Student Name", "Examination Description");
                    end;
                    ExaminationAccount.Reset;
                    ExaminationAccount.SetRange("ID No.", "ID Number/Passport No.");
                    ExaminationAccount.SetRange("Course ID", "Examination ID");
                    if ExaminationAccount.FindFirst then begin
                        Error(TXT001, ExaminationAccount."Registration No.", "Examination Description");
                    end;
                    Courses.Reset();
                    Courses.SetRange(Code, "Examination ID");
                    if Courses.FindFirst() then begin
                        "Examination Description" := Courses.Description;
                    end;

                end;



                //check the fee type
            end;
        }
        field(11; "Examination Description"; Text[150])
        {
            CalcFormula = lookup(Courses.Description where(Code = field("Examination ID")));
            FieldClass = FlowField;
        }
        field(12; "Examination Center Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Examination Centres".Code where(Blocked = const(false));

            trigger OnValidate()
            var
                CenterCourse: Record "Center Course Capacity";
                TXT001: label 'The selected center does not offer the examination %2';
                TXT002: label 'The selected center is blocked';
            begin
                //validate center and exams

                if "Document Type" <> "document type"::Disciplinary then begin
                    CenterCourse.Reset;
                    CenterCourse.SetRange("Centre Code", "Examination Center Code");
                    CenterCourse.SetRange("Course Id", "Examination ID");
                    if CenterCourse.FindFirst then begin
                        if ExamCenter.Get("Examination Center Code") then begin
                            if ExamCenter.Blocked = true then
                                Error(TXT002);
                            "Examination Center" := ExamCenter.Name;
                            "Training Institution Code" := ExamCenter."Training Institution";
                            Validate("Training Institution Code");
                        end
                    end else
                        Error(TXT001, "Examination Center", "Examination Description");
                end
            end;
        }
        field(13; "Examination Center"; Text[200])
        {
            Editable = false;
        }
        field(14; "Highest Academic QCode"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Student Qualifications";
        }
        field(15; "Highest Academic Qualification"; Text[50])
        {
            FieldClass = Normal;
        }
        field(16; Gender; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ",Male,Female;
        }
        field(17; "Date of Birth"; Date)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                Age := HRDates.DetermineAge("Date of Birth", Today);
            end;
        }
        field(18; Disabled; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(19; "NCPWD No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(20; "Registration Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(21; "Created By"; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(22; "Created On"; DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(23; "Approval Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Rejected';
            OptionMembers = Open,Rejected;
        }
        field(24; "Currency Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Currency;
        }
        field(25; Address; Text[100])
        {
            Caption = 'Address';
            DataClassification = ToBeClassified;
        }
        field(26; "Address 2"; Text[50])
        {
            Caption = 'Address 2';
            DataClassification = ToBeClassified;
        }
        field(27; City; Text[30])
        {
            Caption = 'City';
            DataClassification = ToBeClassified;
            //This property is currently not supported
            //TestTableRelation = false;
            //The property 'ValidateTableRelation' can only be set if the property 'TableRelation' is set
            //ValidateTableRelation = false;

            trigger OnLookup()
            begin
                PostCode.LookupPostCode(City, "Post Code", County, "Country/Region Code");
            end;

            trigger OnValidate()
            begin
                PostCode.ValidateCity(City, "Post Code", County, "Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
            end;
        }
        field(28; "Country/Region Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Country/Region";

            trigger OnValidate()
            begin
                CountryRegion.Reset;
                CountryRegion.SetRange(Code, "Country/Region Code");
                if CountryRegion.FindFirst then begin
                    "Phone No." := DelChr("Phone No.", '<', '0');
                    "Phone No." := CountryRegion."Telephone Code" + "Phone No.";
                end
            end;
        }
        field(29; "Phone No."; Text[30])
        {
            Caption = 'Phone No.';
            DataClassification = ToBeClassified;
            ExtendedDatatype = PhoneNo;

            // trigger OnValidate()
            // var
            //     Char: dotnet Char;
            //     i: Integer;
            // begin
            //     for i := 1 to StrLen("Phone No.") do
            //       if Char.IsLetter("Phone No."[i]) then
            //         Error(PhoneNoCannotContainLettersErr);
            // end;
        }
        field(30; "Post Code"; Code[20])
        {
            Caption = 'Post Code';
            DataClassification = ToBeClassified;
            TableRelation = if ("Country/Region Code" = const('')) "Post Code"
            else
            if ("Country/Region Code" = filter(<> '')) "Post Code" where("Country/Region Code" = field("Country/Region Code"));
            //This property is currently not supported
            //TestTableRelation = false;
            ValidateTableRelation = false;

            trigger OnLookup()
            begin
                PostCode.LookupPostCode(City, "Post Code", County, "Country/Region Code");
            end;

            trigger OnValidate()
            begin
                PostCode.ValidatePostCode(City, "Post Code", County, "Country/Region Code", (CurrFieldNo <> 0) and GuiAllowed);
                Validate("Country/Region Code");
            end;
        }
        field(31; County; Text[30])
        {
            CaptionClass = '5,1,' + "Country/Region Code";
            Caption = 'County';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(32; Email; Text[80])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                Email := Lowercase(Email);
            end;
        }
        field(33; "No. Series"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(34; Created; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(35; Portal; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(36; "Reason for Rejection"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(37; Amount; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(38; "Examination Sitting"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exam Sitting Cycle" where("Sitting Status" = filter(Active),
                                                        Closed = filter(false | true));

            trigger OnValidate()
            var
                ExaminationResultsBuffer: Record "Fund Types";
                ExamSittingCycle: Record "Exam Sitting Cycle";
            begin
                if "Document Type" = "document type"::Remarking then begin
                    TestField("Student Reg. No.");
                    StudentBookingLines1.Reset;
                    StudentBookingLines1.SetRange("Booking Header No.", "No.");
                    if StudentBookingLines1.FindSet then begin
                        StudentBookingLines1.DeleteAll;
                    end;
                    if StudentBookingLines1.FindLast then begin
                        EntryNo := StudentBookingLines1."Line No.";
                    end;
                    StudentBookingLines1.Reset;
                    if StudentBookingLines1.FindLast then begin
                        EntryNo := StudentBookingLines1."Line No.";
                    end;
                    ExaminationResults.Reset;
                    ExaminationResults.SetRange("Student Reg No.", "Student Reg. No.");
                    ExaminationResults.SetRange("Examination Sitting ID", "Examination Sitting");
                    if ExaminationResults.FindSet then begin
                        repeat
                            //insert the lines
                            StudentBookingLines.Init;
                            StudentBookingLines."Line No." := EntryNo + 1;
                            StudentBookingLines."Booking Header No." := "No.";
                            StudentBookingLines."Course Id" := "Examination ID";
                            StudentBookingLines."Document Type" := "Document Type";
                            StudentBookingLines.Part := ExaminationResults.Part;
                            StudentBookingLines.Section := ExaminationResults.Section;
                            StudentBookingLines.Paper := ExaminationResults.Paper;
                            StudentBookingLines."Paper Marks" := ExaminationResults.Mark;
                            StudentBookingLines.Insert;
                            EntryNo += 1;
                        until ExaminationResults.Next = 0;
                        "Examination Center Code" := ExaminationResults."Examination Center";
                        Validate("Examination Center Code");
                    end;
                end;
                //get the project
                ExamSittingCycle.Reset;
                ExamSittingCycle.SetRange("Exam Sitting Cycle", "Examination Sitting");
                if ExamSittingCycle.FindFirst then begin
                    "Examination Project Code" := ExamSittingCycle."Examination Project ID";
                    Validate("Examination Project Code");
                end
            end;
        }
        field(39; Type; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = New,Existing;
        }
        field(40; "Registration Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(41; "Registration Receipt No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(42; "Booking Amount"; Decimal)
        {
            CalcFormula = sum("Student Processing Lines"."Amount LCY" where("Booking Header No." = field("No."),
                                                                             Type = filter(Booking),
                                                                             "Document Type" = filter(Booking)));
            FieldClass = FlowField;
        }
        field(43; "Booking Receipt No."; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Receipts Header1"."No.";
        }
        field(44; "Exemption Amount"; Decimal)
        {
            CalcFormula = sum("Exemption Lines"."Amount LCY" where("Header No." = field("No.")));
            FieldClass = FlowField;
        }
        field(45; "Exemption Receipt 6No."; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Receipts Header1"."No.";
        }
        field(46; "Registration Invoice No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(47; "Booking Invoice No."; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(48; "Exemption Invoice No."; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(49; "Student Reg. No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Document Type" = const(Collection)) "Examination Account"."Registration No." where(Issued = const(false),
                                                                                                                   Status = const(Graduate))
            else
            if ("Document Type" = filter(<> Collection)) "Examination Account";

            trigger OnValidate()
            var
                TXT001: label 'The student %1,has an outstanding renewal(s) totalling to of %2,which must be cleared first';
                RenewalBalance: Decimal;
                Customer: Record "Cust. Ledger Entry";
                ProcessingHeader: Record "Student Processing Header";
                ExaminationAccount: Record "Examination Account";
                TXT002: label 'Await for uploading of your result slips in order to book for any professional examinations';
                Date: Date;
                TXT003: label 'The student %1,has an existing %2 %3';
                TXT004: label 'The student account is inactive,Raise a Renewal application first to activate the student';
                ExamBookingEntries: Record "Exam Booking Entries";
                TXT005: label 'The student %1,has a processed booking %2';
            begin
                // //Temporary block of booking
                // IF "Document Type"="Document Type"::Booking THEN BEGIN
                //  ExaminationAccount.RESET;
                //  ExaminationAccount.SETRANGE("Registration No.","Student Reg. No.");
                //  IF ExaminationAccount.FINDFIRST THEN BEGIN
                //
                //    Courses.RESET;
                //    Courses.SETRANGE(Code,ExaminationAccount."Course ID");
                //          IF Courses.FINDFIRST THEN BEGIN
                //            //
                //                IF Courses.Type=Courses.Type::Professional THEN
                //                  ERROR(TXT002);
                //          END;
                //
                //  END
                // END;
                // //end temporary booking


                //check is student has another booking

                StudentHeader.Reset;
                StudentHeader.SetRange("Student Reg. No.", "Student Reg. No.");
                StudentHeader.SetRange("Document Type", "Document Type");
                StudentHeader.SetRange(Posted, false);
                if StudentHeader.FindFirst then begin
                    if Type <> Type::Existing then
                        Error(TXT003, "ID Number/Passport No.", "Document Type", StudentHeader."No.");
                end;
                if "Document Type" = "document type"::Booking then begin
                    ExaminationAccount.Reset;
                    ExaminationAccount.SetRange("Registration No.", "Student Reg. No.");
                    if ExaminationAccount.FindFirst then begin
                        if ExaminationAccount.Status <> ExaminationAccount.Status::Active then
                            Error(TXT004);
                    end;
                    //CHECK if student has open entries
                    if "Additional Exemption" = false then begin
                        ExamBookingEntries.Reset;
                        ExamBookingEntries.SetRange("Student Reg No.", "Student Reg. No.");
                        ExamBookingEntries.SetRange("Exam Sitting", "Examination Sitting");
                        ExamBookingEntries.SetRange(Status, ExamBookingEntries.Status::Open);
                        if ExamBookingEntries.FindFirst then begin
                            Error(TXT005, ExamBookingEntries."Student Reg No.", ExamBookingEntries.Code);
                        end;
                    end;
                end;
                ExaminationAccount.Reset;
                ExaminationAccount.SetRange("Registration No.", "Student Reg. No.");
                if ExaminationAccount.FindSet then begin
                    //IF ExaminationAccount.GET("Student Reg. No.") THEN BEGIN
                    Cust.Reset;
                    Cust.SetRange("No.", ExaminationAccount."Student Cust No.");
                    if Cust.FindSet then begin
                        "Student No." := Cust."No.";
                        "Student Name" := UpperCase(Cust.Name);
                        "First Name" := UpperCase(Cust."First Name");
                        "Middle Name" := UpperCase(Cust."Middle Name");
                        Surname := UpperCase(Cust."Last Name");
                        Address := Cust.Address;
                        "Post Code" := Cust."Post Code";
                        City := Cust.City;
                        "Currency Code" := Cust."Currency Code";
                        "NCPWD No." := Cust."NCPWD No.";
                        County := Cust.County;
                        "Phone No." := Cust."Phone No.";
                        Email := Cust."E-Mail";
                        Image := Cust.Image;
                        "Date of Birth" := Cust."Date of Birth";
                        "ID Number/Passport No." := Cust."ID. No.";

                        //VALIDATE("Student No.");
                    end;
                    "Old Streamer" := ExaminationAccount."Old Streamer";
                    "Examination ID" := ExaminationAccount."Course ID";
                    "Examination Description" := ExaminationAccount."Course Description";
                    //  "First Name":=ExaminationAccount."First Name";
                    //  "Middle Name":=ExaminationAccount."Middle Name";
                    //  Surname:=ExaminationAccount.Surname;
                    if "Document Type" = "document type"::Booking then begin
                        //get the training institution
                        ProcessingHeader.Reset;
                        ProcessingHeader.SetRange("Document Type", ProcessingHeader."document type"::Registration);
                        ProcessingHeader.SetRange("Student Reg. No.", "Student Reg. No.");
                        if ProcessingHeader.FindFirst then begin
                            "Training Institution Code" := ProcessingHeader."Training Institution";
                            Validate("Training Institution Code");
                        end;
                        RenewalBalance := 0;
                        if ExaminationAccount."Renewal Pending" > 0 then Message(TXT001, "Student Reg. No.", ExaminationAccount."Renewal Amount");
                    end;
                    //check if collectio voucher
                    if "Document Type" = "document type"::Collection then begin
                        RenewalBalance := 0;
                        if ExaminationAccount."Renewal Pending" > 0 then Error(TXT001, "Student Reg. No.", RenewalBalance);
                    end;
                end;
                if ("Document Type" = "document type"::Withdrawal) or ("Document Type" = "document type"::Defferment) then begin
                    ExamBookingEntries.Reset;
                    ExamBookingEntries.SetRange("Student Reg No.", "Student Reg. No.");
                    ExamBookingEntries.SetRange("Exam Sitting", "Examination Sitting");

                    EntryNo := 0;
                    StudentBookingLines.Reset;
                    if StudentBookingLines.FindLast then begin
                        EntryNo := StudentBookingLines."Line No.";
                    end;
                    if ExamBookingEntries.FindSet then begin

                        repeat

                            StudentBookingLines.Init;
                            StudentBookingLines."Line No." := EntryNo + 1;
                            StudentBookingLines."Document Type" := "Document Type";
                            StudentBookingLines."Booking Header No." := "No.";
                            if "Document Type" = "document type"::Withdrawal then begin
                                StudentBookingLines.Type := StudentBookingLines.Type::Withdrawal;
                            end;
                            StudentBookingLines."Course Id" := ExamBookingEntries.Examination;
                            StudentBookingLines.Part := ExamBookingEntries.Part;
                            StudentBookingLines.Validate(Part);
                            StudentBookingLines.Section := ExamBookingEntries.Section;
                            StudentBookingLines.Validate(Section);
                            StudentBookingLines.Paper := ExamBookingEntries.Paper;
                            StudentBookingLines.Validate(Paper);
                            StudentBookingLines.Amount := ExamBookingEntries."Fee Amount";
                            StudentBookingLines."Amount LCY" := ExamBookingEntries."Fee Amount";
                            StudentBookingLines.Description := ExamBookingEntries.Description;
                            StudentBookingLines.Insert;

                            //insert into withdrawal entries
                            EntryNo := EntryNo + 1;
                        until ExamBookingEntries.Next = 0;
                    end;
                end;
                Validate("Student No.");
            end;
        }
        field(50; Section; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Section where(Course = field("Examination ID"));
        }
        field(51; "Part"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Level where(Course = field("Examination ID"));
        }
        field(52; Paper; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Papers where(Course = field("Examination ID"));
        }
        field(53; "Fee Type"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Resource Price".Code where("Currency Code" = field("Currency Code"));

            trigger OnValidate()
            begin
                WorkType.Reset;
                WorkType.SetRange(Code, "Fee Type");
                if WorkType.FindSet then begin
                    "Type Code" := WorkType."Work Type Code";
                    Validate("Type Code");

                end;
            end;
        }
        field(54; Posted; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(55; "Type Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Work Type";

            trigger OnValidate()
            begin
                ExaminationSetup.Get;
                ResourcePrice.Reset;
                ResourcePrice.SetRange("Work Type Code", "Type Code");
                ResourcePrice.SetRange("Document Type", "Document Type");
                if ResourcePrice.FindFirst then begin
                    if "Document Type" = "document type"::Registration then begin
                        ResourcePrice.CalcFields(Course);
                        "Examination ID" := ResourcePrice.Course;
                        Validate("Examination ID");
                        if Disabled = true then begin
                            if ExaminationSetup."Disability Discount %" > 0 then begin
                                "Discount Amount" := (ResourcePrice."Unit Price" * ExaminationSetup."Disability Discount %") / 100;
                                "Application Amount" := ResourcePrice."Unit Price" - "Discount Amount";
                            end;

                        end else
                            "Application Amount" := ResourcePrice."Unit Price";
                    end;
                    if "Document Type" = "document type"::Reinstatement then begin
                        "Reinstatement Amount" := ResourcePrice."Unit Price";
                    end;
                end;
            end;
        }
        field(56; "Application Invoice"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(57; "Application Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(58; "Application Receipt"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Receipts Header1"."No.";
        }
        field(59; "Total Withdrawal Amount"; Decimal)
        {
            CalcFormula = sum("Student Processing Lines"."Amount LCY" where("Booking Header No." = field("No."),
                                                                             "Document Type" = field("Document Type")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(60; "Preferred Exam Center"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Examination Centres" where(Blocked = filter(false));

            trigger OnValidate()
            begin
                if ExamCenter.Get("Preferred Exam Center") then
                    "Preferred Exam Center Name" := ExamCenter.Name;
            end;
        }
        field(61; "Preferred Exam Center Name"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(62; "Withdrawal Application No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Student Processing Header" where("Student Reg. No." = field("Student Reg. No."));

            trigger OnValidate()
            begin
                if StudentHeader.Get("Withdrawal Application No.") then begin
                    Paper := StudentHeader.Paper;
                    "Booking Amount" := "Booking Amount";

                end;
            end;
        }
        field(63; Age; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(64; "Withdrawal Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Document Type" = filter(Defferment)) "Withdrawal Reasons" where("Reason Category" = filter(Defferement))
            else
            if ("Document Type" = filter(Withdrawal)) "Withdrawal Reasons" where("Reason Category" = filter(Withdrawal));

            trigger OnValidate()
            begin
                if WithdrawalReasons.Get("Withdrawal Code") then begin
                    "Withdrawal Reason" := WithdrawalReasons.Description;
                    CalcFields("Total Withdrawal Amount");
                    if "Total Withdrawal Amount" > 0 then begin
                        "Withdrawal Refund Amount" := (WithdrawalReasons."% of Refund" * "Total Withdrawal Amount") / 100;
                        "Administrative Fees" := (WithdrawalReasons."Administrative %" * "Total Withdrawal Amount") / 100;
                        //MESSAGE('%1',"Administrative Fees")
                    end;

                end;
            end;
        }
        field(65; "Withdrawal Reason"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(66; Image; Media)
        {
            Caption = 'Image';
            DataClassification = ToBeClassified;
            ExtendedDatatype = Person;
        }
        field(67; "Posted By"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "User Setup"."User ID";
        }
        field(68; "Posted On"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(69; "Examination Project Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job where("Record Type" = filter(Examination));

            trigger OnValidate()
            begin
                if Job.Get("Examination Project Code") then begin
                    "Examination Project Name" := Job.Description;
                end;
            end;
        }
        field(70; "Examination Project Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(71; "Withdrawal Refund Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(72; "Defferment Charge"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(73; "Training Institution Code"; Code[100])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer where("Customer Type" = filter(Institution));

            trigger OnValidate()
            begin
                if Customer.Get("Training Institution Code") then
                    "Training Institution" := Customer.Name;
            end;
        }
        field(74; "Training Institution"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(75; "Qualification Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Qualification Type" = const(Course)) Courses
            else
            if ("Qualification Type" = const(Diploma)) "Exemptions Qualifications" where("Qualification Type" = filter(Diploma))
            else
            if ("Qualification Type" = const(Degree)) "Exemptions Qualifications" where("Qualification Type" = filter(Degree));

            trigger OnValidate()
            begin
                if "Qualification Type" = "qualification type"::Course then begin
                    Courses.Reset;
                    Courses.SetRange(Code, "Qualification Code");
                    if Courses.FindFirst then begin
                        Qualification := Courses.Description;
                    end;
                end else begin
                    ExemptionsQualifications.Reset;
                    ExemptionsQualifications.SetRange(Code, "Qualification Code");
                    if ExemptionsQualifications.FindFirst then begin
                        Qualification := ExemptionsQualifications.Qualification;
                    end;
                end;
            end;
        }
        field(76; "Qualification Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Degree,Diploma,Course';
            OptionMembers = Degree,Diploma,Course;
        }
        field(77; Qualification; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(78; Remarks; Text[600])
        {
            DataClassification = ToBeClassified;
        }
        field(79; "Case Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Case Categories" where(Category = filter("Disciplinary Case"));

            trigger OnValidate()
            begin
                if CaseCategories.Get("Case Code") then begin
                    "Case Description" := CaseCategories.Description;
                end
            end;
        }
        field(80; "Case Description"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(81; "Case Verdict"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Case Categories" where(Category = filter(Verdict));

            trigger OnValidate()
            begin
                if CaseCategories.Get("Case Verdict") then begin
                    "Case Description" := CaseCategories.Description;
                end
            end;
        }
        field(82; "Verdict Description"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(83; "Disciplinary Commitee"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Disciplinary Commitee";

            trigger OnValidate()
            begin
                DisciplinaryCommitee.Reset;
                DisciplinaryCommitee.SetRange(Code, "Disciplinary Commitee");
                if DisciplinaryCommitee.FindFirst then begin
                    "Commitee Name" := DisciplinaryCommitee.Description;
                end
            end;
        }
        field(84; "Commitee Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(85; "Previous Case No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Student Processing Header" where("Document Type" = filter(Disciplinary),
                                                               "Case Status" = filter(Open));

            trigger OnValidate()
            begin
                StudentHeader.Reset;
                StudentHeader.SetRange("No.", "Previous Case No.");
                if StudentHeader.FindFirst then begin
                    "Student No." := StudentHeader."Student No.";
                    "Student Name" := StudentHeader."Student Name";
                    "ID Number/Passport No." := StudentHeader."ID Number/Passport No.";
                    Gender := StudentHeader.Gender;
                    "Date of Birth" := StudentHeader."Date of Birth";
                    Disabled := StudentHeader.Disabled;
                    "Highest Academic QCode" := StudentHeader."Highest Academic QCode";
                    "Highest Academic Qualification" := StudentHeader."Highest Academic Qualification";
                    "Disciplinary Commitee" := StudentHeader."Disciplinary Commitee";
                    "Commitee Name" := StudentHeader."Commitee Name";
                    "Verdict Description" := StudentHeader."Verdict Description";
                    "Case Code" := StudentHeader."Case Code";
                    "Case Description" := StudentHeader."Case Description";
                    "Examination ID" := StudentHeader."Examination ID";
                    "Examination Description" := StudentHeader."Examination Description";
                    "Examination Center Code" := StudentHeader."Examination Center Code";
                    "Examination Center" := StudentHeader."Examination Center";
                    "Examination Project Code" := StudentHeader."Examination Project Code";
                    "Examination Project Name" := StudentHeader."Examination Project Name";
                    "Examination Sitting" := StudentHeader."Examination Sitting";
                end
            end;
        }
        field(86; "Reinstatement Commitee"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Disciplinary Commitee";

            trigger OnValidate()
            begin
                DisciplinaryCommitee.Reset;
                DisciplinaryCommitee.SetRange(Code, "Reinstatement Commitee");
                if DisciplinaryCommitee.FindFirst then begin
                    "Reinstatement  Name" := DisciplinaryCommitee.Description;
                end
            end;
        }
        field(87; "Reinstatement  Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(88; "Case Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Closed';
            OptionMembers = Open,Closed;
        }
        field(89; "Collection Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(90; "Collected By Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(91; "Collected By ID No."; Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(92; "Collected By Email"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(93; "Issued By Officer"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee;

            trigger OnValidate()
            begin
                Employee.Reset;
                Employee.SetRange("No.", "Issued By Officer");
                if Employee.FindFirst then begin
                    "Issued By Officer Name" := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                    "Issued By User ID" := Employee."User ID";
                end
            end;
        }
        field(94; "Issued By Officer Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(95; "Certificate No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(96; "Issued By User ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = users;
        }
        field(97; "Certificate Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Original,Defaced,Corrected';
            OptionMembers = Original,Defaced,Corrected;
        }
        field(98; "Remark Amount"; Decimal)
        {
            CalcFormula = sum("Student Processing Lines"."Amount LCY" where("Booking Header No." = field("No."),
                                                                             "Document Type" = filter(Remarking)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(99; "Remark Receipt No."; Code[30])
        {
            Editable = false;
            FieldClass = Normal;
        }
        field(100; "Remark Invoice No."; Code[30])
        {
            Editable = false;
            FieldClass = Normal;
        }
        field(101; "Payment Reference No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(102; "Payment Evidence"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(103; "Administrative Fees"; Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(104; "Payment Created"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(105; "Pay Mode"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Pay Mode";
        }
        field(106; "Contact Full Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(107; "Contact Email"; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(108; "Contact Phone No."; Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(109; "Contact Relationship"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Parent,Guardian,Sibling,Spouse';
            OptionMembers = Parent,Guardian,Sibling,Spouse;
        }
        field(110; "Source of Information"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Source Categories";

            trigger OnValidate()
            var
                SourceCategories: Record "Source Categories";
            begin
                SourceCategories.Reset;
                SourceCategories.SetRange(Code, "Source of Information");
                if SourceCategories.FindFirst then begin
                    "Information Source Name" := SourceCategories.Description;
                end
            end;
        }
        field(111; "Information Source Name"; Text[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(112; "Birth Certificate No."; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(113; "Disability Type"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Disability Code";

            trigger OnValidate()
            var
                DisabilityCode: Record "Disability Code";
            begin
                DisabilityCode.Reset;
                DisabilityCode.SetRange(Code, "Disability Type");
                if DisabilityCode.FindFirst then begin
                    "Disability Name" := DisabilityCode.Description;
                end
            end;
        }
        field(114; "Disability Name"; Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(115; "Renewal Amount"; Decimal)
        {
            CalcFormula = sum("Student Processing Lines"."Amount LCY" where("Booking Header No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(116; "Renewal Receipt No."; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(117; "Renewal Invoice No."; Code[30])
        {
            Editable = true;
        }
        field(118; "Activation Amount"; Decimal)
        {
            CalcFormula = sum("Student Processing Lines"."Amount LCY" where("Booking Header No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(119; "Activation Receipt No."; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = true;
            TableRelation = "Receipts Header1"."No.";
        }
        field(120; "Activation Invoice No."; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(121; "Last Modified Date Time"; DateTime)
        {
            Caption = 'Last Modified Date Time';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(122; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(123; Submitted; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(124; "Commiitee Reference No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(125; "Certificate Dispatch Method"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'In-Person,By Post';
            OptionMembers = "In-Person","By Post";
        }
        field(126; "Reinstatement Amount"; Decimal)
        {
            CalcFormula = sum("Student Processing Lines"."Amount LCY" where("Booking Header No." = field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(127; "Reinstatement Receipt No."; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(128; "Reinstatement Invoice No."; Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(129; "Discount Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(130; Cancelled; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(131; "Payment Remaining Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(132; "Bank Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bank Account";
        }
        field(133; "County Code"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = County;

            trigger OnValidate()
            var
                CountyRec: Record County;
            begin
                CountyRec.Reset;
                CountyRec.SetRange(Code, "County Code");
                if CountyRec.FindFirst then begin
                    County := CountyRec.Description;
                end
            end;
        }
        field(134; "Posted Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(135; "Institution Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer where("Customer Type" = filter(Trade | Institution));

            trigger OnValidate()
            var
                Customer: Record Customer;
            begin
                Customer.Reset;
                Customer.SetRange("No.", "Institution Code");
                if Customer.FindFirst then begin
                    "Institution Name" := Customer.Name;
                end
            end;
        }
        field(136; "Institution Name"; Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(137; "Institution Reference No."; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(138; "Additional Exemption"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(139; Balance; Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = - sum("Detailed Cust. Ledg. Entry".Amount where("Customer No." = field("Student No.")));
            Caption = 'Balance';
            Editable = false;
            FieldClass = FlowField;
        }
        field(140; "Balance (LCY)"; Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = - sum("Detailed Cust. Ledg. Entry"."Amount (LCY)" where("Customer No." = field("Student No.")));
            Caption = 'Balance (LCY)';
            Editable = false;
            FieldClass = FlowField;
        }
        field(141; "Email Sent"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(142; "Manual Input"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(143; "Cancelled By"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(144; "Cancelled On"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(145; "Computer Based"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(146; "Prefered Examination Sitting"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exam Sitting Cycle";

            trigger OnValidate()
            var
                ExaminationResultsBuffer: Record "Fund Types";
                ExamSittingCycle: Record "Exam Sitting Cycle";
            begin
                if "Document Type" = "document type"::Remarking then begin
                    TestField("Student Reg. No.");
                    StudentBookingLines1.Reset;
                    StudentBookingLines1.SetRange("Booking Header No.", "No.");
                    if StudentBookingLines1.FindSet then begin
                        StudentBookingLines1.DeleteAll;
                    end;
                    if StudentBookingLines1.FindLast then begin
                        EntryNo := StudentBookingLines1."Line No.";
                    end;
                    StudentBookingLines1.Reset;
                    if StudentBookingLines1.FindLast then begin
                        EntryNo := StudentBookingLines1."Line No.";
                    end;
                    ExaminationResults.Reset;
                    ExaminationResults.SetRange("Student Reg No.", "Student Reg. No.");
                    ExaminationResults.SetRange("Examination Sitting ID", "Examination Sitting");
                    if ExaminationResults.FindSet then begin
                        repeat
                            //insert the lines
                            StudentBookingLines.Init;
                            StudentBookingLines."Line No." := EntryNo + 1;
                            StudentBookingLines."Booking Header No." := "No.";
                            StudentBookingLines."Course Id" := "Examination ID";
                            StudentBookingLines."Document Type" := "Document Type";
                            StudentBookingLines.Part := ExaminationResults.Part;
                            StudentBookingLines.Section := ExaminationResults.Section;
                            StudentBookingLines.Paper := ExaminationResults.Paper;
                            StudentBookingLines."Paper Marks" := ExaminationResults.Mark;
                            StudentBookingLines.Insert;
                            EntryNo += 1;
                        until ExaminationResults.Next = 0;
                        "Examination Center Code" := ExaminationResults."Examination Center";
                        Validate("Examination Center Code");
                    end;
                end;
                //get the project
                ExamSittingCycle.Reset;
                ExamSittingCycle.SetRange("Exam Sitting Cycle", "Examination Sitting");
                if ExamSittingCycle.FindFirst then begin
                    "Examination Project Code" := ExamSittingCycle."Examination Project ID";
                    Validate("Examination Project Code");
                end
            end;
        }
        field(147; Archived; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(148; "Archived On"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(149; "Archived By"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(150; "Exemption Letter Code"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(151; "Post Tracking No."; Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(152; "Date of Postage"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(153; "Certificate Level"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Level where(Code = field("Certificate Level"));
        }
        field(154; "Total Storage Fee"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(155; "Mode of Dispatch"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,In-Person,E-Mail';
            OptionMembers = " ","In-Person","E-Mail";
        }
        field(156; "Document Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Draft,Submitted';
            OptionMembers = " ",Draft,Submitted;
        }
        field(157; "Requested By Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(158; "Requested By E-Mail"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(159; "Requestor No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer;

            trigger OnValidate()
            begin
                // IF Cust.GET("Requestor No.") THEN
                //  "Requested By Name":=Cust.Name;
                // "Requested By E-Mail":=Cust."E-Mail";
            end;
        }
        field(160; "Old Streamer"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(161; "Cert Collect Invoice No."; Code[30])
        {
            Caption = 'Certificate Collection Invoice No.';
            DataClassification = ToBeClassified;
            Editable = true;
        }
        field(162; "Cert Collect  Receipt No."; Code[30])
        {
            Caption = 'Certificate Collection  Receipt No.';
            DataClassification = ToBeClassified;
        }
        field(163; Status; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Reported,Under Investigation,Resolved';
            OptionMembers = Reported,"Under Investigation",Resolved;
        }
        field(164; "Case Details"; Text[2000])
        {
            DataClassification = ToBeClassified;
        }
        field(165; "Is a Registered Student"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(166; "Student No(if not registered)"; Code[50])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                TestField("Is a Registered Student", false);
            end;
        }
        field(167; "Certificate Issuance Status"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = '...,Released,Suspended';
            OptionMembers = "...",Released,Suspended;
        }
        field(168; "Reason For Suspension"; Text[2000])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                TestField("Certificate Issuance Status", "certificate issuance status"::Suspended);
            end;
        }
        field(169; "Collection Identifcation No"; Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(170; "Reason For Recalling Certifica"; Text[2000])
        {
            DataClassification = ToBeClassified;
        }
        field(171; "Recalled By"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(172; "Recalled On"; DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(173; Exempted; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(174; "Confirmation Institution Name"; Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(175; "Confirmation Institution Email"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(176; "Confirmation Reason"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = '...,For Self,For Institution';
            OptionMembers = "...","For Self","For Institution";
        }
        field(177; "Recall Due Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown; "Examination ID", "Student Name")
        {
        }
    }

    trigger OnDelete()
    var
        TXT001: label 'You are not allowed to delete a record in this table,Kindly consult the system administrator';
    begin
        Error(TXT001);
    end;

    trigger OnInsert()
    var
        ERROR001: label 'Kindly re-use the document %1,before creating a new one';
    begin
        ExaminationSetup.Get;

        if "Document Type" = "document type"::Registration then begin
            ExaminationSetup.TestField("Application Nos.");
            if "No." = '' then
                "Registration Date" := Today;
            NoSeriesMgt.InitSeries(ExaminationSetup."Application Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
        if "Document Type" = "document type"::Renewal then begin
            ExaminationSetup.TestField("Renewal Nos.");
            if "No." = '' then
                NoSeriesMgt.InitSeries(ExaminationSetup."Renewal Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
        if "Document Type" = "document type"::"Re-Activation" then begin
            ExaminationSetup.TestField("Re-Activation Nos.");
            if "No." = '' then
                NoSeriesMgt.InitSeries(ExaminationSetup."Re-Activation Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
        if "Document Type" = "document type"::Booking then begin
            ExaminationSetup.TestField("Default Examination Sitting");
            ExaminationSetup.TestField("Examination Booking Nos.");
            if "No." = '' then
                NoSeriesMgt.InitSeries(ExaminationSetup."Examination Booking Nos.", xRec."No. Series", 0D, "No.", "No. Series");
            "Examination Sitting" := ExaminationSetup."Default Examination Sitting";
        end;
        if "Document Type" = "document type"::Exemption then begin
            ExaminationSetup.TestField("Exemption Nos.");
            if "No." = '' then
                NoSeriesMgt.InitSeries(ExaminationSetup."Exemption Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
        if "Document Type" = "document type"::Withdrawal then begin
            ExaminationSetup.TestField("Withdrawal Nos.");
            if "No." = '' then
                NoSeriesMgt.InitSeries(ExaminationSetup."Withdrawal Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
        if "Document Type" = "document type"::Defferment then begin
            ExaminationSetup.TestField("Defferment Nos.");
            if "No." = '' then
                NoSeriesMgt.InitSeries(ExaminationSetup."Defferment Nos.", xRec."No. Series", 0D, "No.", "No. Series");
        end;
        if "Document Type" = "document type"::Disciplinary then begin
            ExaminationSetup.TestField("Disciplinary Nos.");
            if "No." = '' then
                NoSeriesMgt.InitSeries(ExaminationSetup."Disciplinary Nos.", xRec."No. Series", 0D, "No.", "No. Series");
            Date := Today;
        end;
        if "Document Type" = "document type"::Reinstatement then begin
            ExaminationSetup.TestField("Reinstatement  Nos.");
            if "No." = '' then
                NoSeriesMgt.InitSeries(ExaminationSetup."Reinstatement  Nos.", xRec."No. Series", 0D, "No.", "No. Series");
            Date := Today;
        end;
        if "Document Type" = "document type"::Collection then begin
            ExaminationSetup.TestField("Collection Nos.");
            if "No." = '' then
                NoSeriesMgt.InitSeries(ExaminationSetup."Collection Nos.", xRec."No. Series", 0D, "No.", "No. Series");
            Date := Today;
        end;
        if "Document Type" = "document type"::Remarking then begin
            ExaminationSetup.TestField("Remarking Nos.");
            if "No." = '' then
                NoSeriesMgt.InitSeries(ExaminationSetup."Remarking Nos.", xRec."No. Series", 0D, "No.", "No. Series");
            Date := Today;
        end;
        if "Document Type" = "document type"::Confirmation then begin
            ExaminationSetup.TestField("Confirmation Application Nos.");
            if "No." = '' then
                NoSeriesMgt.InitSeries(ExaminationSetup."Confirmation Application Nos.", xRec."No. Series", 0D, "No.", "No. Series");
            Date := Today;

        end;
        if "Document Type" = "document type"::"Institution Confirmation" then begin
            ExaminationSetup.TestField("Inst. Confirmation Nos.");
            if "No." = '' then
                NoSeriesMgt.InitSeries(ExaminationSetup."Inst. Confirmation Nos.", xRec."No. Series", 0D, "No.", "No. Series");
            Date := Today;
            "Requestor No." := ExaminationSetup."Default Confirmation Account";
        end;
        if Portal = true then
            "Created By" := ExaminationSetup."Student Portal User"
        else
            "Created By" := UserId;
        "Created On" := CurrentDatetime;
        Date := Today;

        //check document open
        if ExaminationSetup."Enable Strict Document Reuse" = true then begin
            if Portal = false then begin
                Header.Reset;
                Header.SetRange("Document Type", "Document Type");
                Header.SetRange("Created By", "Created By");
                Header.SetRange(Posted, false);
                if Header.FindFirst then begin
                    Error(ERROR001, Header."No.");
                end
            end
        end;
    end;

    trigger OnModify()
    begin
        "Last Date Modified" := Today;
        "Last Modified Date Time" := CurrentDatetime;
    end;

    var
        Cust: Record Customer;
        PostCode: Record "Post Code";
        PhoneNoCannotContainLettersErr: label 'The phone cannot contain letters';
        ExaminationSetup: Record "Examination Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        WorkType: Record "Resource Price";
        ExaminationAccount: Record "Examination Account";
        StudentHeader: Record "Student Processing Header";
        HRDates: Codeunit "HR Dates";
        WithdrawalReasons: Record "Withdrawal Reasons";
        Job: Record Job;
        ExamBookingEntries: Record "Exam Booking Entries";
        StudentBookingLines: Record "Student Processing Lines";
        EntryNo: Integer;
        ExamCenter: Record "Examination Centres";
        Customer: Record Customer;
        ExemptionsQualifications: Record "Exemptions Qualifications";
        Courses: Record Courses;
        ResourcePrice: Record "Resource Price";
        CaseCategories: Record "Case Categories";
        DisciplinaryCommitee: Record "Disciplinary Commitee";
        Employee: Record Employee;
        ExaminationResults: Record "Examination Results";
        StudentBookingLines1: Record "Student Processing Lines";
        CountryRegion: Record "Country/Region";
        ExamSittingCycle: Record "Exam Sitting Cycle";
        TXT002: label 'Kindly re-use the document %1,you cannot have more than one application for %2 open';
        Header: Record "Student Processing Header";
}

