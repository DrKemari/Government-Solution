#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50035 "tableextension50035" extends Job 
{
    fields
    {

        //Unsupported feature: Property Insertion (ValidateTableRelation) on ""Bill-to Customer No."(Field 5)".


        //Unsupported feature: Property Insertion (NotBlank) on ""Bill-to Customer No."(Field 5)".


        //Unsupported feature: Code Modification on ""No."(Field 1).OnValidate".

        //trigger "(Field 1)()
        //Parameters and return type have not been exported.
        //>>>> ORIGINAL CODE:
        //begin
            /*
            IF "No." <> xRec."No." THEN BEGIN
              JobsSetup.GET;
              NoSeriesMgt.TestManual(JobsSetup."Job Nos.");
              "No. Series" := '';
            END;
            */
        //end;
        //>>>> MODIFIED CODE:
        //begin
            /*
            IF "Document Type"="Document Type"::Job THEN BEGIN
            #1..5
            END;

            IF "Document Type"="Document Type"::Project THEN BEGIN
            IF "No." <> xRec."No." THEN BEGIN
              RMSetup.GET;
              NoSeriesMgt.TestManual(RMSetup."Section Nos");
              "No. Series" := '';
            END;
            END;
            */
        //end;


        //Unsupported feature: Code Insertion on ""Person Responsible"(Field 20)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
            /*
            IF Res.GET("Person Responsible") THEN BEGIN
              "Principle Investigator Name":=Res.Name;
              END;
            */
        //end;
        field(50000;"Project Budget";Decimal)
        {
            CalcFormula = sum("Job Planning Line"."Total Cost (LCY)" where ("Job No."=field("No."),
                                                                            "Line Type"=const(Budget)));
            Caption = 'Total Project Budget';
            Description = '//Daudi changed from schedule to budget as per the new 2017';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50001;"Actual Project Costs";Decimal)
        {
            CalcFormula = sum("Job Ledger Entry"."Total Cost (LCY)" where ("Job No."=field("No."),
                                                                           "Entry Type"=const(Usage)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50002;"Budget Commitments";Decimal)
        {
            Caption = 'Total Budget Commitments';
        }
        field(50003;"Available Funds";Decimal)
        {
        }
        field(50006;"Last Invoice Date";Date)
        {
            CalcFormula = max("Job Ledger Entry"."Posting Date" where ("Job No."=field("No."),
                                                                       "Entry Type"=const(Sale)));
            FieldClass = FlowField;
        }
        field(50007;"Prior Period Turnover";Decimal)
        {
        }
        field(50008;"Prior Period Costs";Decimal)
        {
        }
        field(50009;"Current Period Turnover";Decimal)
        {
        }
        field(50010;"Current Period Costs";Decimal)
        {
        }
        field(50011;"Later Period Turnover";Decimal)
        {
        }
        field(50012;"Later Period Costs";Decimal)
        {
        }
        field(50020;"Shortcut Dimension 3 Code";Code[20])
        {
            CaptionClass = '1,1,3';
            Caption = 'Shorstcut Dimension 3 Code';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(3));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(3,"Shortcut Dimension 3 Code");
            end;
        }
        field(50021;"Shortcut Dimension 4 Code";Code[20])
        {
            CaptionClass = '1,1,4';
            Caption = 'Shortcut Dimension 4 Code';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(4));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(4,"Shortcut Dimension 4 Code");
            end;
        }
        field(50022;"Shortcut Dimension 5 Code";Code[20])
        {
            CaptionClass = '1,1,5';
            Caption = 'Shortcut Dimension 5 Code';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(5));

            trigger OnValidate()
            begin
                ValidateShortcutDimCode(5,"Shortcut Dimension 5 Code");
            end;
        }
        field(50050;"Last Invoice Entry Date";Date)
        {
            CalcFormula = max("Job Ledger Entry"."Posting Date" where ("Job No."=field("No."),
                                                                       "Entry Type"=const(Sale)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50051;"Last Usage Entry Date";Date)
        {
            CalcFormula = max("Job Ledger Entry"."Posting Date" where ("Job No."=field("No."),
                                                                       "Entry Type"=const(Usage)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(52000;"Road Project No";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Roads Projects"."Project  No";
        }
        field(52001;"Year Code";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Roads Funding Lines"."Year Code" where ("Project No."=field("Road Project No"));
        }
        field(57000;"No. Of Project Imprest Memos";Integer)
        {
            CalcFormula = count("Imprest Memo" where (Project=field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(57001;"PO Commitments";Decimal)
        {
            CalcFormula = sum("Purchase Line"."Line Amount" where ("Document Type"=filter(Order),
                                                                   Status=filter(Released),
                                                                   "Job No."=field("No.")));
            Caption = 'Purchase Order Commitments';
            Editable = false;
            FieldClass = FlowField;
        }
        field(57002;"PRN Commitments";Decimal)
        {
            CalcFormula = sum("Purchase Line"."Line Amount" where ("Document Type"=filter("Purchase Requisition"),
                                                                   Status=filter(Released),
                                                                   "Job No."=field("No."),
                                                                   Ordered=filter(false)));
            Caption = 'Purchase Requisition(PRN) Commitments';
            Editable = false;
            FieldClass = FlowField;
        }
        field(57003;"Store Requisition Commitments";Decimal)
        {
            CalcFormula = sum("Purchase Line"."Line Amount" where ("Document Type"=filter("Store Requisition"),
                                                                   Status=filter(Released),
                                                                   "Job No."=field("No."),
                                                                   "Quantity To  Issue"=filter(>0)));
            Caption = 'Store Requisition(S11) Commitments';
            Editable = false;
            FieldClass = FlowField;
        }
        field(57004;"Imprest Application Commitment";Decimal)
        {
            CalcFormula = sum("Imprest Lines".Amount where (Project=field("No."),
                                                            Status=filter(Released),
                                                            "Payment Type"=filter(<>"Imprest Surrender")));
            Caption = 'Imprest Applications Commitments';
            Editable = false;
            FieldClass = FlowField;
        }
        field(57005;"Opportunity Reference";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Funding Oportunity".No;

            trigger OnValidate()
            begin
                if FundOp.Get("Opportunity Reference") then begin
                  "Fund Opportunity Name":=FundOp.Name;
                  "Grant Amount":=FundOp.Amount;
                end;
            end;
        }
        field(57006;"Grant Amount";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(57007;"Fund Opportunity Name";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(57008;"Research Center";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where ("Operating Unit Type"=const("Department/Center"),
                                                           "Research Center?"=const(true));
        }
        field(57009;"Research Program";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Research Program";
        }
        field(57010;"Research Project Area";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Research Project Area" where ("Research Program ID"=field("Research Program"));
        }
        field(57011;"Grant Type";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Classes";
        }
        field(57012;"Researcher Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource where ("Researcher?"=filter(true));
        }
        field(65000;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            Description = 'Start of Grants Module';
            OptionCaption = 'Job,Project,Budget';
            OptionMembers = Job,Project,Budget;
        }
        field(65001;"Grant Applications ID";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Grant Funding Application" where ("Application Status"=const(Won));

            trigger OnValidate()
            begin
                GFA.Reset;
                GFA.SetRange("Application No","Grant Applications ID");
                if GFA.Find('-') then begin
                   GFA.CalcFields("Principal Investigator");
                   "Bill-to Customer No.":=GFA."Grantor No.";
                   "Bill-to Name":=GFA."Grantor Name";
                   "Research Center":=GFA."Research Center";
                   "Person Responsible":=GFA."Principal Investigator";
                   "Currency Code":=GFA."Currency Code";
                  // "Project Manager":=
                  end;
            end;
        }
        field(65002;"Grantor Admin Contact ID";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Contact;
        }
        field(65003;"Grantor Admin Name";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(65004;"Grantor Financial Contact ID";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Contact;
        }
        field(65005;"Grantor Financial Contact Name";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(65006;"Grantor Authorized Official ID";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(65007;"Grantor Authorized Official";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(65008;"Approval Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending Approval,Released,Rejected';
            OptionMembers = Open,"Pending Approval",Released,Rejected;
        }
        field(65009;"Created By";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(65010;"Creation Date/Time";DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(65011;"Notice of Award No.";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(65012;"External Grant Reference No.";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(65013;"CFDA No.";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(65014;"Award Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(65015;"Assistance Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Grant,Cooperative Agreement';
            OptionMembers = Grant,"Cooperative Agreement";
        }
        field(65016;"Budget Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(65017;"Budget End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(65018;"Project Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(65019;"Project End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(65020;"Primary Funding Sponsor ID";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer where ("Funding Class"=const(Grant));

            // trigger OnValidate()
            // begin
            //     Cust.Reset;
            //     Cust.SetRange("No.","Primary Funding Sponsor ID");
            //     if Cust.Find('-') then begin
            //        "Primary Sponsor Name":=Cust.Name;
            //       end;
            // end;
        }
        field(65021;"Primary Sponsor Name";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(65022;"Project Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Time and Material,Fixed-Price';
            OptionMembers = "Time and Material","Fixed-Price";
        }
        field(65024;"Total Billed Amount";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(65025;"Grantee Name";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(65026;"Grantee Address";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(65027;"Grantee Address 2";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(65028;"Grantee Post Code";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(65029;"Grantee City";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(65030;"Grantee Country/Region";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(65031;"Grantee Project Director Name";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(65032;"Grantee Financial Contact ID";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Contact;
        }
        field(65033;"Grantee Financial Contact Name";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(65034;"Grantee Authorized Official ID";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Contact;
        }
        field(65035;"Grantee Authorized Official";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(65036;"Grantee Project Director ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Contact;
        }
        field(65037;"Award Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Prime Recipient,Sub-Recipient';
            OptionMembers = "Prime Recipient","Sub-Recipient";
        }
        field(65038;"Project Funding Contract No";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Project Contract Header"."Project Contract No";
        }
        field(65039;"Country Entry Code";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Contract Funding Lines"."Year Code" where ("Project Contract No."=field("Project Funding Contract No"));
        }
        field(65040;"Grantee Admin Contact ID";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Contact;
        }
        field(65041;"Grantee Admin Contact Name";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(65042;"Total Approved Direct Costs";Decimal)
        {
            CalcFormula = sum("Job Planning Line"."Direct Unit Cost (LCY)" where ("Job No."=field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(65043;"Total Approved Indirect Costs";Decimal)
        {
            CalcFormula = sum("Job Planning Line"."Direct Unit Cost (LCY)" where ("Job No."=field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(65044;"Indirect Cost (%)";Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(65045;"Total Approved Budget";Decimal)
        {
            CalcFormula = sum("Job Planning Line"."Total Cost (LCY)" where ("Job No."=field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(65046;"Total Actual Costs";Decimal)
        {
            CalcFormula = sum("Job Ledger Entry"."Total Cost (LCY)" where ("Job No."=field("No."),
                                                                           "Entry Type"=const(Usage)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(65047;"Total Billable Amount";Decimal)
        {
            CalcFormula = sum("Job Planning Line"."Line Amount (LCY)" where ("Job No."=field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(65048;"Total Invoiced Amount";Decimal)
        {
            CalcFormula = sum("Job Ledger Entry"."Line Discount Amount" where ("Job No."=field("No."),
                                                                               "Entry Type"=const(Sale)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(65049;"Completed (%)";Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(65050;"Invoiced (%)";Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(65051;"Project No";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No." where ("Document Type"=const(Project));
        }
        field(65052;"Budget Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Original,Revised,Suplementary';
            OptionMembers = Original,Revised,Suplementary;
        }
        field(65053;"Principle Investigator Name";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(69000;"Posting Group Filter";Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = "Employee Posting GroupX";
        }
        field(69001;"Pay Period Filter";Date)
        {
            FieldClass = FlowFilter;
            TableRelation = "Payroll PeriodX";
        }
        field(69002;"Total deductions";Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where (Type=const(Deduction),
                                                                  "Posting Group Filter"=field("Posting Group Filter"),
                                                                  "Payroll Period"=field("Pay Period Filter"),
                                                                  "Job No"=field("No."),
                                                                  Honoraria=const(false),
                                                                  "Employee No"=field("Employee Filter"),
                                                                  Code=field("Deduction Code Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(69003;"Total Earnings";Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X".Amount where (Type=const(Payment),
                                                                  "Posting Group Filter"=field("Posting Group Filter"),
                                                                  "Payroll Period"=field("Pay Period Filter"),
                                                                  "Job No"=field("No."),
                                                                  Honoraria=const(false),
                                                                  "Non-Cash Benefit"=const(false),
                                                                  "Employee No"=field("Employee Filter"),
                                                                  Code=field("Earning Code Filter")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(69004;"Total Employer";Decimal)
        {
            CalcFormula = sum("Assignment Matrix-X"."Employer Amount" where (Type=const(Payment),
                                                                             "Posting Group Filter"=field("Posting Group Filter"),
                                                                             "Payroll Period"=field("Pay Period Filter"),
                                                                             "Job No"=field("No."),
                                                                             Honoraria=const(false),
                                                                             "Non-Cash Benefit"=const(false)));
            Editable = false;
            FieldClass = FlowField;
        }
        field(69005;"Earning Code Filter";Code[50])
        {
            FieldClass = FlowFilter;
            TableRelation = EarningsX;
        }
        field(69006;"Deduction Code Filter";Code[50])
        {
            FieldClass = FlowFilter;
            TableRelation = DeductionsX;
        }
        field(69007;"Employee Filter";Code[20])
        {
            FieldClass = FlowFilter;
            TableRelation = Employee;
        }
        field(70018;"Directorate Code";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where ("Operating Unit Type"=const(Directorate));
        }
        field(70019;Division;Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where ("Operating Unit Type"=const("Division/Section"));
        }
        field(70020;exchequer;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70021;Commitments;Decimal)
        {
            CalcFormula = sum("Commitment Entries1".Amount where (Job=field("No."),
                                                                  Type=const(Committed)));
            FieldClass = FlowField;
        }
        field(70022;"Road Length(KM)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70023;"Funding Source";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Funding Source";
        }
        field(70024;"Project Category";Option)
        {
            DataClassification = ToBeClassified;
            InitValue = Normal;
            OptionCaption = ' ,Normal,Road';
            OptionMembers = " ",Normal,Road;
        }
        field(70025;"Road Project Sub-Category";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Project Type".Code where (Blocked=filter(false),
                                                            Category=field("Road Project Type"));
        }
        field(70026;"Road Project Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Construction,Maintenance,Studies_Surveys_Designs,ICT Project';
            OptionMembers = " ",Construction,Maintenance,Studies_Surveys_Designs,"ICT Project";
        }
        field(85000;"Record Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Job,Examination;
        }
        field(85001;"Examination Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;

            trigger OnValidate()
            begin
                if Courses.Get("Examination Code") then begin
                  Examination:=Courses.Description;
                  end
            end;
        }
        field(85002;Examination;Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(85003;"Financial Year";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Annual Reporting Codes";
        }
        field(85004;"Examination BOQ Template";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Boq Template  Header";
        }
        field(85005;"Staff Appointment Voucher";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Appointment Header";
        }
        field(85006;"No. of Registered students";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(85007;"Examination Planner No";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exam Material Planner Header";

            trigger OnValidate()
            begin
                if ExamMaterialPlannerHeader.Get("Examination Planner No") then
                  "Examination Planner":=ExamMaterialPlannerHeader.Description;
            end;
        }
        field(85008;"Examination Planner";Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(85009;"Examination Representative";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource;

            trigger OnValidate()
            begin
                if Res.Get("Examination Representative") then
                  "Representative Name":=Res.Name;
            end;
        }
        field(85010;"Representative Name";Text[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(85011;"Examination Sitting Cycle";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exam Sitting Cycle";
        }
    }
    keys
    {
        key(Key1;"Research Center")
        {
        }
    }


    //Unsupported feature: Code Modification on "OnInsert".

    //trigger OnInsert()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        JobsSetup.GET;

        IF "No." = '' THEN BEGIN
          JobsSetup.TESTFIELD("Job Nos.");
          NoSeriesMgt.InitSeries(JobsSetup."Job Nos.",xRec."No. Series",0D,"No.","No. Series");
        END;

        IF GETFILTER("Bill-to Customer No.") <> '' THEN
          IF GETRANGEMIN("Bill-to Customer No.") = GETRANGEMAX("Bill-to Customer No.") THEN
        #10..21
        DimMgt.UpdateDefaultDim(
          DATABASE::Job,"No.",
          "Global Dimension 1 Code","Global Dimension 2 Code");
        InitWIPFields;

        "Creation Date" := TODAY;
        "Last Date Modified" := "Creation Date";

        IF ("Project Manager" <> '') AND (Status = Status::Open) THEN
          AddToMyJobs("Project Manager");
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
         IF Usersetup.GET(USERID) THEN BEGIN
          IF NOT Usersetup."Create New Job" THEN
            ERROR(PemissionDenied);
         END ELSE BEGIN
          ERROR(UserNotFound,USERID);
         END;

        JobsSetup.GET;
        IF "Document Type"="Document Type"::Job THEN BEGIN
        #3..6
        END;


        JobsSetup.GET;
        IF "Document Type"="Document Type"::Budget THEN BEGIN
        IF "No." = '' THEN BEGIN
          JobsSetup.TESTFIELD("Budget Plan Nos");
          NoSeriesMgt.InitSeries(JobsSetup."Budget Plan Nos",xRec."No. Series",0D,"No.","No. Series");
        END;
        END;

        IF (("Document Type"="Document Type"::Project) AND ("Project Category" <> "Project Category"::Road)) THEN BEGIN
        IF "No." = '' THEN BEGIN
          RMSetup.GET;
          RMSetup.TESTFIELD("Section Nos");
          NoSeriesMgt.InitSeries(RMSetup."Section Nos",xRec."No. Series",0D,"No.","No. Series");
        END;
        END;

        //Roads Construction Projects
        IF "No." = '' THEN BEGIN
        IF ((("Document Type" = "Document Type"::Project) AND ("Project Category" = "Project Category"::Road) AND ("Road Project Type" = "Road Project Type"::Construction))) THEN BEGIN
          RMSetup.GET;
          RMSetup.TESTFIELD("Construction Projects Nos");
          NoSeriesMgt.InitSeries(RMSetup."Construction Projects Nos",xRec."No. Series",0D,"No.","No. Series");
          END;
          END;

        //Road Maintance projects
        IF "No." = '' THEN BEGIN
        IF ((("Document Type" = "Document Type"::Project) AND ("Project Category" = "Project Category"::Road) AND ("Road Project Type" = "Road Project Type"::Maintenance))) THEN BEGIN
          RMSetup.GET;
          RMSetup.TESTFIELD("Maintenance Projects Nos");
          NoSeriesMgt.InitSeries(RMSetup."Maintenance Projects Nos",xRec."No. Series",0D,"No.","No. Series");
          END;
          END;

        //Road surveys,Studies & Designs
        IF "No." = '' THEN BEGIN
        IF ((("Document Type" = "Document Type"::Project) AND ("Project Category" = "Project Category"::Road) AND ("Road Project Type" = "Road Project Type"::Studies_Surveys_Designs))) THEN BEGIN
          RMSetup.GET;
          RMSetup.TESTFIELD("Surveys_Studies_Designs Nos");
          NoSeriesMgt.InitSeries(RMSetup."Surveys_Studies_Designs Nos",xRec."No. Series",0D,"No.","No. Series");
          END;
          END;
        #7..24
        //update JOB Dimensin

        #25..31
        */
    //end;


    //Unsupported feature: Code Modification on "OnModify".

    //trigger OnModify()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        "Last Date Modified" := TODAY;

        IF (("Project Manager" <> xRec."Project Manager") AND (xRec."Project Manager" <> '')) OR (Status <> Status::Open) THEN
          RemoveFromMyJobs;

        IF ("Project Manager" <> '') AND (xRec."Project Manager" <> "Project Manager") THEN
          IF Status = Status::Open THEN
            AddToMyJobs("Project Manager");
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
         IF Usersetup.GET(USERID) THEN BEGIN
          IF NOT Usersetup."Update Job Status" THEN
            ERROR(PemissionDenied);
         END ELSE BEGIN
          ERROR(UserNotFound,USERID);
         END;

        #1..8
        */
    //end;

    procedure FnMetricsComputation()
    begin
        /*IF  ("Total Approved Budget"<>0) THEN BEGIN
            "Indirect Cost (%)":=ROUND("Total Approved Direct Costs"/"Total Approved Budget",0.01,'=');
            "Completed (%)":=ROUND("Total Actual Costs"/"Total Approved Budget",0.01,'=');
          END;
        IF ("Total Billable Amount"<>0) THEN BEGIN
          "Invoiced (%)":=ROUND("Total Invoiced Amount"/"Total Billable Amount",0.01,'=');
          END;
        
        MODIFY;*/

    end;

    //Unsupported feature: Property Deletion (LookupPageID).


    //Unsupported feature: Property Deletion (DrillDownPageID).


    var
        FundOp: Record "Funding Oportunity";
        GrantsSetup: Record "Grants Setup";
        GFA: Record "Grant Funding Application";
        Res: Record Resource;
        PemissionDenied: label 'User Account is not Setup for Project Creation. Contact System Administrator.';
        UserNotFound: label 'User Setup %1 not found.';
        PemissionDeniedd: label 'User Account is not Setup for Project Modification. Contact System Administrator.';
        Usersetup: Record "User Setup";
        RMSetup: Record "Roads Management Setup";
        Courses: Record Courses;
        ExamMaterialPlannerHeader: Record "Exam Material Planner Header";
        BoqTemplateHeader: Record "Boq Template  Header";
}

