#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69200 "HR Disciplinary Cases"
{
    DrillDownPageID = "HR Disciplinary Cases SF";
    LookupPageID = "HR Disciplinary Cases SF";

    fields
    {
        field(1;"Case Number";Code[20])
        {
        }
        field(3;"Date of Complaint";Date)
        {
        }
        field(4;"Type of Disciplinary Case";Code[20])
        {
            NotBlank = true;
            TableRelation = if (Type=const(Disciplinary)) "HR Models".Code where (Type=const("Disciplinary Case"))
                            else if (Type=const(Grievance)) "HR Models".Code where (Type=const("Grievance Cause"));

            trigger OnValidate()
            begin
                HRModels.Reset;
                HRModels.SetRange(Code,"Type of Disciplinary Case");
                if HRModels.FindSet then begin
                  "Case Description":=HRModels.Description;
                  end;
            end;
        }
        field(5;"Recommended Action";Code[20])
        {
            TableRelation = "HR Models".Code where (Type=const("Disciplinary Action"));
        }
        field(6;"Case Description";Text[2000])
        {
        }
        field(7;Accuser;Code[10])
        {
            Caption = 'Originator';
            TableRelation = if ("Accuser Is Staff"=const(true)) Employee."No.";
        }
        field(8;"Witness #1";Code[20])
        {
            TableRelation = if ("Witness#1 Staff"=const(true)) Employee."No.";
        }
        field(9;"Witness #2";Code[20])
        {
            TableRelation = if ("Witness#2 Staff"=const(true)) Employee."No.";
        }
        field(10;"Action Taken";Code[20])
        {
            TableRelation = if (Type=const(Disciplinary)) "Disciplinary Status Table"."Disciplinary Status"
                            else if (Type=const(Grievance)) "HR Models".Code where (Type=const("Grievance Outcome"));

            trigger OnValidate()
            begin
                DisciplinaryStatusTable.Reset;
                DisciplinaryStatusTable.SetRange("Disciplinary Status","Action Taken");
                if DisciplinaryStatusTable.FindSet then
                  "HR/Payroll Implications":=DisciplinaryStatusTable."Deduction Code";
            end;
        }
        field(11;"Date To Discuss Case";Date)
        {
        }
        field(12;"Document Link";Text[200])
        {
        }
        field(13;"Disciplinary Remarks";Code[2000])
        {
        }
        field(14;Comments;Text[250])
        {
        }
        field(15;"Case Discussion";Boolean)
        {
        }
        field(16;"Body Handling The Complaint";Code[250])
        {
            Caption = 'Body Handling The Case';
            TableRelation = "HR Discplinary Bodies".Code;
        }
        field(17;Recomendations;Code[250])
        {
        }
        field(18;"HR/Payroll Implications";Code[20])
        {
        }
        field(19;"Support Documents";Option)
        {
            OptionMembers = Yes,No;
        }
        field(20;"Policy Guidlines In Effect";Text[2000])
        {
        }
        field(21;Status;Option)
        {
            OptionMembers = Open,Submitted,Closed,Appealed;
        }
        field(22;"Mode of Lodging the Complaint";Code[20])
        {
            Caption = 'Mode of Lodging the Case';
            TableRelation = "Mode of Lodging Case".Code;
        }
        field(23;"No. Series";Code[20])
        {
        }
        field(24;"Employee No";Code[30])
        {
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                Employee.Reset;
                Employee.SetRange("No.","Employee No");
                if Employee.FindSet then begin
                  "Employee Name":=Employee."First Name"+' '+Employee."Middle Name"+' '+Employee."Last Name";
                  end;
            end;
        }
        field(25;Selected;Boolean)
        {
        }
        field(26;"Closed By";Code[100])
        {
        }
        field(27;"Case Severity";Option)
        {
            Caption = 'Offence Type';
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Minor,Major,Gross';
            OptionMembers = " ",Minor,Major,Gross;
        }
        field(28;"Handled By";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',HCA,HOD/HOU,Committee,Court,Board';
            OptionMembers = ,HCA,"HOD/HOU",Committee,Court,Board;
        }
        field(29;"Disciplinary Commitee";Code[30])
        {
            Caption = 'Commitee Membership';
            DataClassification = ToBeClassified;
            TableRelation = "Commitee Appointment Voucher"."Document No.";

            trigger OnValidate()
            begin
                // IF "Handled By"<>"Handled By"::Committee THEN BEGIN
                //  ERROR('Handled by must be a committee for you to specify committee');
                //  END;
            end;
        }
        field(30;"Employee Name";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(31;"Created By";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(32;"Document Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(33;"Non Staff Witness #1";Text[250])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Witness#1 Staff"=true then
                  Error('Witness # 1 must not be a member of staff');
            end;
        }
        field(34;"Non Staff Witness #2";Text[250])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Witness#2 Staff"=true then
                  Error('Witness # 2 must not be a member of staff');
            end;
        }
        field(35;"Non Staff Originator";Text[250])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Accuser Is Staff"=true then
                  Error('Originator must not be a member of staff');
            end;
        }
        field(3963;"Responsibility Center";Code[10])
        {
            TableRelation = "Responsibility Center".Code where ("Blocked?"=const(false));
        }
        field(3964;"Accuser Is Staff";Boolean)
        {
            Caption = 'Originator Is Staff';
        }
        field(3965;"Witness#1 Staff";Boolean)
        {
        }
        field(3966;"Witness#2 Staff";Boolean)
        {
        }
        field(3967;"Disciplinary status";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Disciplinary Status Table"."Disciplinary Status";
        }
        field(3968;"Case Created";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(3969;"Legal Case No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Case Register"."No.";
        }
        field(3970;"Legal Case Recommendation";Text[250])
        {
            CalcFormula = lookup("Case Register"."Verdict Summary" where ("No."=field("Legal Case No.")));
            FieldClass = FlowField;
        }
        field(3971;Brief;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3972;"Disciplinary Case Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',New,Appeal';
            OptionMembers = ,New,Appeal;
        }
        field(3973;"End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(3974;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Disciplinary,Grievance';
            OptionMembers = ,Disciplinary,Grievance;
        }
        field(3975;"Appealed case No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Employee No","Case Number")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        //GENERATE NEW NUMBER FOR THE DOCUMENT
        if "Case Number" = '' then begin
          HRSetup.Get;
          HRSetup.TestField(HRSetup."Disciplinary Cases Nos.");
          NoSeriesMgt.InitSeries(HRSetup."Disciplinary Cases Nos.",xRec."No. Series",0D,"Case Number","No. Series");
        end;
        "Document Date":=Today;
        "Created By":=UserId;
    end;

    trigger OnModify()
    begin
          // IF Status=Status::Submitted THEN
         //   ERROR('You cannot modify a closed case');
    end;

    var
        HRSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        HRModels: Record "HR Models";
        Employee: Record Employee;
        DisciplinaryStatusTable: Record "Disciplinary Status Table";
}

