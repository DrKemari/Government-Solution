#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85031 "Bulk Processing Lines"
{

    fields
    {
        field(1; "Line No."; Integer)
        {
            AutoIncrement = true;
            Editable = false;
            NotBlank = false;
        }
        field(2; "Bulk Header No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bulk Processing Header";
        }
        field(3; "Document Type"; Option)
        {
            OptionMembers = Registration,Exemption,Withdrawal,Defferment;
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
                    "Student Name" := Cust.Name;
                    "First Name" := Cust."First Name";
                    "Middle Name" := Cust."Middle Name";
                    Surname := Cust."Last Name";
                    Address := Cust.Address;
                    "Post Code" := Cust."Post Code";
                    City := Cust.City;
                    "Currency Code" := Cust."Currency Code";
                    "NCPWD No." := Cust."NCPWD No.";
                    County := Cust.County;
                    "Phone No." := Cust."Phone No.";
                    Email := Cust."E-Mail";

                end;
                Validate("Student Name");
            end;
        }
        field(5; "Student Name"; Text[40])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                NameBreakdown;
            end;
        }
        field(6; "First Name"; Text[30])
        {
            Caption = 'First Name';
            DataClassification = ToBeClassified;
        }
        field(7; "Middle Name"; Text[30])
        {
            Caption = 'Middle Name';
            DataClassification = ToBeClassified;
        }
        field(8; Surname; Text[30])
        {
            Caption = 'Surname';
            DataClassification = ToBeClassified;
        }
        field(9; "ID Number"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(10; "Course ID"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;

            trigger OnValidate()
            begin
                Rate := 1;
                //get conversion rate

                BulkProcessingHeader.Reset;
                BulkProcessingHeader.SetRange("No.", "Bulk Header No.");
                if BulkProcessingHeader.FindSet then begin
                    Resource.Reset;
                    Resource.SetRange("Course ID", "Course ID");
                    Resource.SetRange("No.", BulkProcessingHeader."Work Type");
                    if Resource.FindSet then begin
                        ResourcePrice.Reset;
                        ResourcePrice.SetRange(Code, Resource."No.");
                        ResourcePrice.SetRange("Work Type Code", BulkProcessingHeader."Type Code");
                        if ResourcePrice.FindSet then begin
                            Amount := ResourcePrice."Unit Price";
                            "Amount LCY" := Amount * Rate;
                        end;
                    end;

                end;
            end;
        }
        field(11; "Course Description"; Text[50])
        {
            CalcFormula = lookup(Courses.Description where(Code = field("Course ID")));
            FieldClass = FlowField;
        }
        field(12; "Training Institution Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Customer";
        }
        field(13; "Training Institution"; Text[50])
        {
            CalcFormula = lookup("Examination Centres".Name where(Code = field("Training Institution Code")));
            FieldClass = FlowField;
        }
        field(14; "Highest Academic QCode"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Student Qualifications";
        }
        field(15; "Highest Academic Qualification"; Text[50])
        {
            CalcFormula = lookup("Student Qualifications"."Qualification Description" where(Code = field("Highest Academic QCode")));
            FieldClass = FlowField;
        }
        field(16; Gender; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Male,Female,Other;
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
            end;
        }
        field(31; County; Text[30])
        {
            CaptionClass = '5,1,' + "Country/Region Code";
            Caption = 'County';
            DataClassification = ToBeClassified;
        }
        field(32; Email; Text[70])
        {
            DataClassification = ToBeClassified;
        }
        field(33; "No. Series"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(34; Created; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(36; "Reason for Rejection"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(37; "Examination Cyce"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exam Sitting Cycle"."Exam Sitting Cycle" where("Examination Project ID" = field("Examination Project Code"));
        }
        field(38; Passed; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(39; Amount; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(40; "Registration No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Examination Account";

            trigger OnValidate()
            begin
                if ExaminationAccount.Get("Registration No.") then begin
                    "Course ID" := ExaminationAccount."Course ID";
                    Validate("Course ID");
                    "Student No." := ExaminationAccount."Student Cust No.";
                    Validate("Student No.");

                end
            end;
        }
        field(41; "Preferred Exam Center"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Examination Centres";
        }
        field(42; "Amount LCY"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(43; "Subject Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Papers;

            trigger OnValidate()
            begin
                if Papers.Get("Subject Code") then begin
                    Subject := Papers.Description;
                end
            end;
        }
        field(44; Subject; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(45; Age; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(46; Image; MediaSet)
        {
            Caption = 'Image';
            DataClassification = ToBeClassified;
            ExtendedDatatype = Person;
        }
        field(47; "Examination Project Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job;

            trigger OnValidate()
            begin
                if Job.Get("Examination Project Code") then begin
                    "Examination Project Name" := Job.Description;
                end;
            end;
        }
        field(48; "Examination Project Name"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(49; Section; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Section where(Course = field("Course ID"),
                                           Part = field(Part));

            trigger OnValidate()
            begin
                /*Rate:=1;
                //get conversion rate
                StudentPHeader.RESET;
                StudentPHeader.SETRANGE("No.","Booking Header No.");
                IF StudentPHeader.FINDSET THEN BEGIN
                Resource.RESET;
                Resource.SETRANGE("Course ID",StudentPHeader."Course ID");
                Resource.SETRANGE("No.",StudentPHeader."Work Type");
                IF Resource.FINDSET THEN BEGIN
                  //IF TYPE IS Section
                  IF "Booking Type"="Booking Type"::Section THEN BEGIN
                    CountPapers:=0;
                    Papers.RESET;
                    Papers.SETRANGE(Section,Section);
                    IF Papers.FINDSET THEN BEGIN
                    REPEAT
                  CountPapers:=CountPapers+1;
                   ResourcePrice.RESET;
                  ResourcePrice.SETRANGE(Code,Resource."No.");
                  ResourcePrice.SETRANGE("Work Type Code",StudentPHeader."Type Code");
                  IF ResourcePrice.FINDSET THEN BEGIN
                    Amount:=ResourcePrice."Unit Price"*CountPapers;
                    "Amount LCY":=Amount*Rate;
                  END;
                
                    UNTIL Papers.NEXT=0;
                    END END
                    END
                    END
                */

            end;
        }
        field(50; "Part"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Level where(Course = field("Course ID"));
            trigger OnValidate()
            var
                Lines: Record "Student Processing Lines";
                TXT001: label 'You are not allowed to select papers in different Levels';
                ResourcePrice: Record "Resource Price";
                ResourceCost: Record "Resource Cost";
                StudentPHeader: Record "Student Processing Header";
                Resource: Record Resource;
                Rate: Decimal;
                CountPapers: Integer;
                Papers: Record Papers;
                Sections: Record Section;
                Parts: Record Level;
            begin
                Rate := 1;


                Resource.Reset;
                Resource.SetRange("Course ID", "Course ID");
                Resource.SetRange("No.", BulkProcessingHeader."Work Type");
                if Resource.FindSet then begin
                    if "Booking Type" = "booking type"::Part then begin
                        //get part name
                        if Parts.Get(Part) then begin
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
                                ResourcePrice.SetRange("Work Type Code", BulkProcessingHeader."Type Code");
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
            // trigger OnValidate()
            // begin
            //     /*Rate:=1;
            //     //get conversion rate
            //     StudentPHeader.RESET;
            //     StudentPHeader.SETRANGE("No.","Booking Header No.");
            //     IF StudentPHeader.FINDSET THEN BEGIN
            //     Resource.RESET;
            //     Resource.SETRANGE("Course ID",StudentPHeader."Course ID");
            //     Resource.SETRANGE("No.",StudentPHeader."Work Type");
            //     IF Resource.FINDSET THEN BEGIN
            //      IF "Booking Type"="Booking Type"::Part THEN BEGIN
            //         CountPapers:=0;
            //         Papers.RESET;
            //         Papers.SETRANGE(Part,Part);
            //         IF Papers.FINDSET THEN BEGIN
            //         REPEAT
            //           CountPapers:=CountPapers+1;
            //           ResourcePrice.RESET;
            //       ResourcePrice.SETRANGE(Code,Resource."No.");
            //       ResourcePrice.SETRANGE("Work Type Code",StudentPHeader."Type Code");
            //       IF ResourcePrice.FINDSET THEN BEGIN
            //          Amount:=ResourcePrice."Unit Price"*CountPapers;
            //         "Amount LCY":=Amount*Rate;
            //       END;

            //         UNTIL Papers.NEXT=0;
            //         END END ELSE BEGIN
            //       ResourcePrice.RESET;
            //       ResourcePrice.SETRANGE(Code,Resource."No.");
            //       ResourcePrice.SETRANGE("Work Type Code",StudentPHeader."Type Code");
            //       IF ResourcePrice.FINDSET THEN BEGIN
            //         Amount:=ResourcePrice."Unit Price";
            //         "Amount LCY":=Amount*Rate;
            //       END;
            //       END;
            //     END;

            //     END;
            //     */

            // end;
        }
        field(51; Paper; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Papers where(Course = field("Course ID"),
                                          Level = field(Part),
                                          Section = field(Section));

            trigger OnValidate()
            var

            begin
                BulkProcessingHeader.Reset;
                BulkProcessingHeader.SetRange("No.", "Bulk Header No.");
                if BulkProcessingHeader.FindFirst then begin

                    if "Booking Type" = "booking type"::Paper then begin
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
                                    ResourcePrice.SetRange("Currency Code", BulkProcessingHeader."Currency Code");
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
            end;

            // trigger OnValidate()
            // begin
            //     /*StudentPHeader.RESET;
            //     StudentPHeader.SETRANGE("No.","Booking Header No.");
            //     IF StudentPHeader.FINDFIRST THEN BEGIN
            //     //check if the subject has been exempted
            //     ExemptionEntries.RESET;
            //     ExemptionEntries.SETRANGE("Course Id","Course Id");
            //     ExemptionEntries.SETRANGE("Stud. Reg. No",StudentPHeader."Student Reg. No.");
            //     ExemptionEntries.SETRANGE("No.",Paper);
            //     IF ExemptionEntries.FINDFIRST THEN
            //       ERROR(TXT001,ExemptionEntries."No.");
            //     END;
            //     */

            // end;
        }
        field(52; Description; Text[100])
        {
            CalcFormula = lookup(Papers.Description where(Code = field(Paper)));
            FieldClass = FlowField;
        }
        field(53; "Booking Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Paper,Section,Part';
            OptionMembers = Paper,Section,"Part";
        }
        field(54; "Last Modified Date Time"; DateTime)
        {
            Caption = 'Last Modified Date Time';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(55; "Last Date Modified"; Date)
        {
            Caption = 'Last Date Modified';
            DataClassification = ToBeClassified;
            Editable = false;
        }

        field(56; "Preferred Exam Mode"; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Physical,Online;
        }
    }

    keys
    {
        key(Key1; "Line No.", "Bulk Header No.")
        {
            Clustered = true;
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
        Cust: Record Customer;
        PostCode: Record "Post Code";
        PhoneNoCannotContainLettersErr: label 'The phone cannot contain letters';
        ExaminationSetup: Record "Examination Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        ExaminationAccount: Record "Examination Account";
        Papers: Record Papers;
        HRDates: Codeunit "HR Dates";
        Rate: Decimal;
        BulkProcessingHeader: Record "Bulk Processing Header";
        Resource: Record Resource;
        ResourcePrice: Record "Resource Price";
        Job: Record Job;

    local procedure NameBreakdown()
    var
        NamePart: array[30] of Text[100];
        TempName: Text[250];
        FirstName250: Text[250];
        i: Integer;
        NoOfParts: Integer;
    begin
        TempName := "Student Name";
        while StrPos(TempName, ' ') > 0 do begin
            if StrPos(TempName, ' ') > 1 then begin
                i := i + 1;
                NamePart[i] := CopyStr(TempName, 1, StrPos(TempName, ' ') - 1);
            end;
            TempName := CopyStr(TempName, StrPos(TempName, ' ') + 1);
        end;
        i := i + 1;
        NamePart[i] := CopyStr(TempName, 1, MaxStrLen(NamePart[i]));
        NoOfParts := i;

        "First Name" := '';
        "Middle Name" := '';
        Surname := '';
        for i := 1 to NoOfParts do
            if (i = NoOfParts) and (NoOfParts > 1) then
                Surname := CopyStr(NamePart[i], 1, MaxStrLen(Surname))
            else
                if (i = NoOfParts - 1) and (NoOfParts > 2) then
                    "Middle Name" := CopyStr(NamePart[i], 1, MaxStrLen("Middle Name"))
                else begin
                    FirstName250 := DelChr("First Name" + ' ' + NamePart[i], '<', ' ');
                    "First Name" := CopyStr(FirstName250, 1, MaxStrLen("First Name"));
                end;
    end;
}

