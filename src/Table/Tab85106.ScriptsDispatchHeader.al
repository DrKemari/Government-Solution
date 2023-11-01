#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85106 "Scripts Dispatch Header"
{

    fields
    {
        field(1;"Document No.";Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2;Description;Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3;"Project No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job;

            trigger OnValidate()
            begin
                if Job.Get("Project No.") then begin
                  "Project Name":=Job.Description;
                  "Sitting Cycle":=Job."Examination Sitting Cycle";
                  Validate("Sitting Cycle");
                  end
            end;
        }
        field(4;"Project Name";Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5;"Sitting Cycle";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exam Sitting Cycle";

            trigger OnValidate()
            var
                CenterHeader: Record "Center  Header";
            begin
                ExamSittingCycle.Reset;
                ExamSittingCycle.SetRange("Exam Sitting Cycle","Sitting Cycle");
                if ExamSittingCycle.FindFirst then begin
                "Examination Start Date":=ExamSittingCycle."Exam Start Date";
                "Examination End Date":=ExamSittingCycle."Exam End Date";
                  CenterHeader.Reset;
                  CenterHeader.SetRange("Sitting Cycle","Sitting Cycle");
                  CenterHeader.SetRange("Document Type",CenterHeader."document type"::"Marking Center");
                  if CenterHeader.FindFirst then begin
                    "Marking Start Date":=CenterHeader."Marking Start Date";
                    "Marking End Date":=CenterHeader."Marking End Date";
                  end;
                end
            end;
        }
        field(6;"Center Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Examination Centres" where (Blocked=filter(false));

            trigger OnValidate()
            begin
                if ExamCenter.Get("Center Code") then begin
                  "Center Name":=ExamCenter.Name;

                  end
            end;
        }
        field(7;"Center Name";Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8;"Approval Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(9;"Document Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Dispatched,Closed';
            OptionMembers = Open,Dispatched,Closed;
        }
        field(10;"Created By";Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11;"Created On";DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12;Posted;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Posted On";DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Posted By";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(15;"No. Series";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Examination Start Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(17;"Examination End Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(18;"Total Candidature.00";Integer)
        {
            CalcFormula = count("Exam Booking Entries" where ("Exam Center"=field("Center Code")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(19;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Script Dispatch Voucher,Team Leader Sampling Voucher,Marker Claim Voucher,Checker Work Ticket,Marker Attendance,Checker Attendance,Script Re-allocation,Marking Center Checklist,Marker Tally,Dummy Form,Staff Attendance,Marking Progress Form,Checker Claim Voucher,Team Leader Reports';
            OptionMembers = "Script Dispatch Voucher","Team Leader Sampling Voucher","Marker Claim Voucher","Checker Work Ticket","Marker Attendance","Checker Attendance","Script Re-allocation","Marking Center Checklist","Marker Tally","Dummy Form","Staff Attendance","Marking Progress Form","Checker Claim Voucher","Team Leader Reports";
        }
        field(20;"Marking Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(21;"Marking End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(22;Examination;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;

            trigger OnValidate()
            begin
                if Courses.Get(Examination) then begin
                  "Examination Name":=Courses.Description;

                end;
            end;
        }
        field(23;"Paper Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Papers where (Course=field(Examination));

            trigger OnValidate()
            var
                Papers: Record Papers;
            begin
                Papers.Reset;
                Papers.SetRange(Code,"Paper Code");
                if Papers.FindFirst then begin
                  "Paper Name":=Papers.Description;
                 end
            end;
        }
        field(24;"Paper Name";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(25;"Marker No";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Document Type"=filter("Script Dispatch Voucher")) "Marker Task Allocation"."Resource No" where ("Paper ID"=field("Paper Code"),
                                                                                                                                 Blocked=const(false))
                                                                                                                                 else if ("Document Type"=filter("Team Leader Sampling Voucher")) "Marker Task Allocation"."Resource No" where (Role=filter("Team Leader"),
                                                                                                                                                                                                                                                "Paper ID"=field("Paper Code"),
                                                                                                                                                                                                                                                Blocked=const(false))
                                                                                                                                                                                                                                                else if ("Document Type"=filter("Marker Claim Voucher"|"Checker Work Ticket")) Resource."No." where ("Exam Task Type"=filter(Invigilator|Marker),
                                                                                                                                                                                                                                                                                                                                                     Blocked=const(false))
                                                                                                                                                                                                                                                                                                                                                     else if ("Document Type"=filter("Checker Claim Voucher")) Resource."No." where ("Exam Task Type"=filter(Checker),
                                                                                                                                                                                                                                                                                                                                                                                                                                     Blocked=const(false));

            trigger OnValidate()
            begin
                if Resources.Get("Marker No") then begin
                  "Marker Name":=Resources.Name;
                  "Bank Account No.":=Resources."Bank Account No.";
                  "Bank Branch No.":=Resources."Bank Branch No.";
                  "Bank Code":=Resources."Bank Code";
                  "Bank Name":=Resources."Bank Name";
                  "Branch Name":=Resources."Branch Name";
                  "M-Pesa Number":=Resources."M-Pesa Number";
                  Email:=Resources.Email;
                  "ID/Passport No":=Resources."ID/Passport No";
                  Address:=Resources.Address;
                  "Address 2":=Resources."Address 2";
                  end;
                //  IF ("Document Type"="Document Type"::"Script Dispatch Voucher") AND ("Marker No"<>'')THEN BEGIN
                //    ScriptsDispatch.RESET;
                //    ScriptsDispatch.SETRANGE("Document Type",ScriptsDispatch."Document Type"::"Script Dispatch Voucher");
                //    ScriptsDispatch.SETFILTER("Document No.",'<>%1',"Document No.");
                //    ScriptsDispatch.SETRANGE("Marker No","Marker No");
                //    ScriptsDispatch.SETRANGE("Paper Code","Paper Code");
                //    IF ScriptsDispatch.FINDFIRST THEN BEGIN
                //      ERROR('Error!, There already exists a voucher No %1 for this Marker, Kindly reuse it',ScriptsDispatch."Document No.")
                //      END;
                //    END;
                 if ("Document Type"="document type"::"Marker Claim Voucher") then begin
                CalcFields("Total Days Present");
                ExaminationSetup.Get;
                "Total Lunch Allowance":="Total Days Present"*ExaminationSetup."Default Lunch Amount";
                "Dummy Amount":=ExaminationSetup."Default Dummy Amount";
                Modify(true);
                end;
            end;
        }
        field(26;"Marker Name";Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(27;"Document Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(28;"Examination Name";Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(29;"Bank Name";Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(30;"Branch Name";Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(31;"Bank Branch No.";Text[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Employee Bank AccountX"."Bank Branch No.";

            trigger OnValidate()
            begin
                EmployeeBankAccountX.Reset;
                EmployeeBankAccountX.SetRange("Bank Branch No.","Bank Branch No.");
                if EmployeeBankAccountX.FindSet then begin
                  "Branch Name":=EmployeeBankAccountX."Branch Name";
                end;
            end;
        }
        field(32;"Bank Account No.";Text[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(33;"Bank Code";Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Employee Bank AccountX";

            trigger OnValidate()
            begin
                EmployeeBankAccountX.Reset;
                EmployeeBankAccountX.SetRange(Code,"Bank Code");
                if EmployeeBankAccountX.FindSet then begin
                  "Bank Name":=EmployeeBankAccountX."Bank Name";
                end;
            end;
        }
        field(34;"M-Pesa Number";Text[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(35;Email;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(36;"ID/Passport No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(37;"KRA PIN NO";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(38;"Phone No";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(39;Address;Text[100])
        {
            Caption = 'Address';
        }
        field(40;"Address 2";Text[50])
        {
            Caption = 'Address 2';
        }
        field(41;"Checker No";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource."No." where (Type=const(Person),
                                                  "Exam Task Type"=const(Checker));

            trigger OnValidate()
            begin
                if Resources.Get("Checker No") then begin
                  "Checker Name":=Resources.Name;
                  "Bank Account No.":=Resources."Bank Account No.";
                  "Bank Branch No.":=Resources."Bank Branch No.";
                  "Bank Code":=Resources."Bank Code";
                  "Bank Name":=Resources."Bank Name";
                  "Branch Name":=Resources."Branch Name";
                  "M-Pesa Number":=Resources."M-Pesa Number";
                  Email:=Resources.Email;
                  "ID/Passport No":=Resources."ID/Passport No";
                  Address:=Resources.Address;
                  "Address 2":=Resources."Address 2";
                  end;
            end;
        }
        field(42;"Checker Name";Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(43;"Total Marking Amount";Decimal)
        {
            CalcFormula = sum("Markers Claim Lines".Amount where ("Document No."=field("Document No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(44;"Total Lunch Allowance";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(45;"Total Days Present";Integer)
        {
            CalcFormula = count("Checkers Ticket Lines" where ("Examination Sitting"=field("Sitting Cycle"),
                                                               "Marker No"=field("Marker No")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(46;"Dummy Amount";Decimal)
        {
            Caption = 'Other Amount';
            DataClassification = ToBeClassified;
        }
        field(47;"Marks Distribution";Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                //TESTFIELD("Marksheet Returned");
            end;
        }
        field(48;"Marking Scheme";Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                //TESTFIELD("Marks Distribution");
            end;
        }
        field(49;"Examiner Report";Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                //TESTFIELD("Marking Scheme");
            end;
        }
        field(50;"Solution Amount";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(51;Role;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Marker,Team Leader';
            OptionMembers = " ",Marker,"Team Leader";
        }
        field(52;"Team Leader Amount";Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                TestField(Role,Role::"Team Leader");
            end;
        }
        field(53;Solution;Boolean)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                // IF Present=FALSE THEN
                //  ERROR(TXT001);
            end;
        }
        field(54;"Dummy A";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(55;"Dummy B";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(56;"Dummy C";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(57;"Total Scripts Before Marking";Integer)
        {
            CalcFormula = sum("Scripts Dispatch Lines"."No. of Envelope Scripts" where ("Document No."=field("Document No."),
                                                                                        Examination=field(Examination),
                                                                                        "Paper Code"=field("Paper Code"),
                                                                                        "Examination Sitting"=field("Sitting Cycle")));
            FieldClass = FlowField;
        }
        field(58;"Total Scripts After Marking";Integer)
        {
            CalcFormula = sum("Scripts Dispatch Lines"."No. of Scripts Returned" where ("Document No."=field("Document No."),
                                                                                        Examination=field(Examination),
                                                                                        "Paper Code"=field("Paper Code"),
                                                                                        "Examination Sitting"=field("Sitting Cycle")));
            FieldClass = FlowField;
        }
        field(59;"No. of Scripts Checked";Integer)
        {
            CalcFormula = sum("Checkers Ticket Lines"."No. of Scripts Before" where ("Document No"=field("Document No.")));
            Description = 'Checkers Ticket Lines';
            FieldClass = FlowField;
        }
        field(60;"No. of Scripts Compared";Integer)
        {
            CalcFormula = sum("Checkers Ticket Lines"."No. of Scripts After" where ("Document No"=field("Document No.")));
            FieldClass = FlowField;
        }
        field(61;"Checker Action Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Checking,Comparison';
            OptionMembers = Checking,Comparison;
        }
        field(62;"Attendance Generation Day";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(63;"Conflict of Interest Form";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(64;"Signed Declaration";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(65;"Checking Amount";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(66;"Total Checking Amount";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(67;Allowances;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(68;"Total Checker Entitlements";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(69;Fetched;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(70;"Fetched On";DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(71;"Fetched By";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(72;"Payment Schedule No";Code[50])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        Error('Error!, This is not allowed');
    end;

    trigger OnInsert()
    var
        CenterHeader: Record "Center  Header";
    begin
        UserSetup.Reset;
        UserSetup.SetRange("User ID",UserId);
        UserSetup.SetRange("Exam Processing",false);
        if UserSetup.FindFirst then begin
          Error('Error! You have not been assigned the necessary rights on Exam Processing');
          end;

        ExaminationSetup.Get;
         if "Document Type"="document type"::"Team Leader Sampling Voucher" then begin
         ExaminationSetup.TestField("Sampling Voucher Nos");
         if "Document No."='' then begin
          NoSeriesMgt.InitSeries(ExaminationSetup."Sampling Voucher Nos",xRec."No. Series",0D,"Document No.","No. Series");
         end;
         "Created By":=UserId;
         "Created On":=CurrentDatetime;
         Description:='Team Leader Sampling Voucher';
         end;

          if "Document Type"="document type"::"Marker Claim Voucher" then begin
          ExaminationSetup.TestField("Markers Claim Voucher Nos");
          if "Document No."='' then begin
           NoSeriesMgt.InitSeries(ExaminationSetup."Markers Claim Voucher Nos",xRec."No. Series",0D,"Document No.","No. Series");
          end;
          "Created By":=UserId;
          "Created On":=CurrentDatetime;
          Description:='Marker Claim Voucher';
          end;

          if "Document Type"="document type"::"Checker Work Ticket" then begin
          ExaminationSetup.TestField("Checkers Work Ticket Nos");
          if "Document No."='' then begin
           NoSeriesMgt.InitSeries(ExaminationSetup."Checkers Work Ticket Nos",xRec."No. Series",0D,"Document No.","No. Series");
          end;
          Description:='Checker Work ticket';
          end;

        if "Document Type"="document type"::"Script Dispatch Voucher" then begin
          ExaminationSetup.TestField("Script Dispatch Nos");
          if "Document No."='' then begin
           NoSeriesMgt.InitSeries(ExaminationSetup."Script Dispatch Nos",xRec."No. Series",0D,"Document No.","No. Series");
          end;
          Description:='Scripts Dispatch';

        end;
        if "Document Type"="document type"::"Marker Attendance" then begin
          ExaminationSetup.TestField("Marker Attendance Nos");
          if "Document No."='' then begin
           NoSeriesMgt.InitSeries(ExaminationSetup."Marker Attendance Nos",xRec."No. Series",0D,"Document No.","No. Series");
          end;
          Description:='Markers Attendance Register';

        end;
        if "Document Type"="document type"::"Checker Attendance" then begin
          ExaminationSetup.TestField("Checker Attendance Reg  Nos.");
          if "Document No."='' then begin
           NoSeriesMgt.InitSeries(ExaminationSetup."Checker Attendance Reg  Nos.",xRec."No. Series",0D,"Document No.","No. Series");
          end;
          Description:='Checkers Attendance Register';

        end;
        if "Document Type"="document type"::"Script Re-allocation" then begin
          ExaminationSetup.TestField("Script Re-Allocation Vouch Nos");
          if "Document No."='' then begin
           NoSeriesMgt.InitSeries(ExaminationSetup."Script Re-Allocation Vouch Nos",xRec."No. Series",0D,"Document No.","No. Series");
          end;
          Description:='Script Re-Allocation';

        end;
        if "Document Type"="document type"::"Marking Center Checklist" then begin
          ExaminationSetup.TestField("Marker Center Checklist  Nos");
          if "Document No."='' then begin
           NoSeriesMgt.InitSeries(ExaminationSetup."Marker Center Checklist  Nos",xRec."No. Series",0D,"Document No.","No. Series");
          end;
          Description:='Marking Center Checklist';

        end;
        if "Document Type"="document type"::"Marker Tally" then begin
          ExaminationSetup.TestField("Marker Center Checklist  Nos");
          if "Document No."='' then begin
           NoSeriesMgt.InitSeries(ExaminationSetup."Marker Center Checklist  Nos",xRec."No. Series",0D,"Document No.","No. Series");
          end;
          Description:='Marking Center Checklist';

        end;
        if "Document Type"="document type"::"Dummy Form" then begin
          ExaminationSetup.TestField("Dummy Forms Nos");
          if "Document No."='' then begin
           NoSeriesMgt.InitSeries(ExaminationSetup."Dummy Forms Nos",xRec."No. Series",0D,"Document No.","No. Series");
          end;
          Description:='Dummy Forms';

        end;
        if "Document Type"="document type"::"Staff Attendance" then begin
          ExaminationSetup.TestField("Staff Attendance Nos.");
          if "Document No."='' then begin
           NoSeriesMgt.InitSeries(ExaminationSetup."Staff Attendance Nos.",xRec."No. Series",0D,"Document No.","No. Series");
          end;
          Description:='Staff Attendance Register';

        end;
        if "Document Type"="document type"::"Marking Progress Form" then begin
          ExaminationSetup.TestField("Marker Progress Forms  No");
          if "Document No."='' then begin
           NoSeriesMgt.InitSeries(ExaminationSetup."Marker Progress Forms  No",xRec."No. Series",0D,"Document No.","No. Series");
          end;
          Description:='Marker Progress Form';

        end;
        if "Document Type"="document type"::"Checker Claim Voucher" then begin
          ExaminationSetup.TestField("Checker Claim Nos");
          if "Document No."='' then begin
           NoSeriesMgt.InitSeries(ExaminationSetup."Checker Claim Nos",xRec."No. Series",0D,"Document No.","No. Series");
          end;
          Description:='Checker Claim Voucher';

        end;
        if "Document Type"="document type"::"Team Leader Reports" then begin
          ExaminationSetup.TestField("Team Leader Reports Nos");
          if "Document No."='' then begin
           NoSeriesMgt.InitSeries(ExaminationSetup."Team Leader Reports Nos",xRec."No. Series",0D,"Document No.","No. Series");
          end;
          Description:='Team Leader Reports';

        end;


          "Created By":=UserId;
          "Created On":=CurrentDatetime;

        "Document Date":=Today;
    end;

    trigger OnModify()
    begin
        UserSetup.Reset;
        UserSetup.SetRange("User ID",UserId);
        UserSetup.SetRange("Exam Processing",false);
        if UserSetup.FindFirst then begin
          Error('Error! You have not been assigned the necessary rights on Exam Processing');
          end;
    end;

    var
        ExaminationSetup: Record "Examination Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        ExamCenter: Record "Examination Centres";
        Job: Record Job;
        ExamSittingCycle: Record "Exam Sitting Cycle";
        Resources: Record Resource;
        Courses: Record Courses;
        EmployeeBankAccountX: Record "Employee Bank AccountX";
        ScriptsDispatch: Record "Scripts Dispatch Header";
        UserSetup: Record "User Setup";
}
