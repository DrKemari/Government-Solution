#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85026 "Exam Booking Header"
{

    fields
    {
        field(1;"Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Registration No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Examination Account";

            trigger OnValidate()
            begin
                if ExaminationAccount.Get("Registration No.") then begin
                  Name:=ExaminationAccount."First Name"+''+ExaminationAccount."Middle Name"+''+ExaminationAccount.Surname;
                end;
            end;
        }
        field(3;Name;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Examination Sitting";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exam Sitting Cycle";
        }
        field(5;Year;Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Course ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;
        }
        field(7;"Course Description";Text[30])
        {
            CalcFormula = lookup(Courses.Description where (Code=field("Course ID")));
            FieldClass = FlowField;
        }
        field(8;Region;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exam Regions";
        }
        field(9;Zone;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Exam Zones";
        }
        field(10;"Preferred Exam Center";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Examination Centres";
        }
        field(11;"Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Approval Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(14;"Created By";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Created Datetime";DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Receipt No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Receipts Header1";
        }
        field(17;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Student,School;
        }
        field(18;"No. Series";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(19;"Receipt Amount";Decimal)
        {
            CalcFormula = sum("Receipt Lines1".Amount where ("Receipt No."=field("Receipt No.")));
            FieldClass = FlowField;
        }
        field(20;"Total Amount";Decimal)
        {
            CalcFormula = sum("Student Processing Lines"."Amount LCY" where ("Booking Header No."=field(Code)));
            FieldClass = FlowField;
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
        key(Key1;"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        ExaminationSetup.Get();
        ExaminationSetup.TestField("Examination Booking Nos.");
        if Code='' then
          NoSeriesMgt.InitSeries(ExaminationSetup."Examination Booking Nos.",xRec."No. Series",0D,Code,"No. Series");
        "Created By":=UserId;
        "Created Datetime":=CurrentDatetime;
    end;

    var
        ExaminationAccount: Record "Examination Account";
        ExaminationSetup: Record "Examination Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

