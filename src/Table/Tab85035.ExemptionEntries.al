#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85035 "Exemption Entries"
{

    fields
    {
        field(1;"Entry No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Exemption Voucher No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Course Id";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;
        }
        field(4;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Section,Paper';
            OptionMembers = Section,Paper;
        }
        field(5;"No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = if (Type=filter(Section)) Section
                            else if (Type=filter(Paper)) Papers;

            trigger OnValidate()
            begin
                if Section.Get("No.") then
                  Name:=Section.Description;
                if Papers.Get("No.") then begin
                  Name:=Papers.Description;
                  Level:=Papers.Level;
                end
            end;
        }
        field(6;Name;Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Currency Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Currency;
        }
        field(8;Amount;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Amount LCY";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Stud. Cust No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Stud. Reg. No";Code[30])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                ExaminationAccount.Reset;
                ExaminationAccount.SetRange("Registration No.","Stud. Reg. No");
                if ExaminationAccount.FindFirst then begin
                  "Stud. Cust No.":=ExaminationAccount."Student Cust No.";
                end
            end;
        }
        field(12;"Last Modified Date Time";DateTime)
        {
            Caption = 'Last Modified Date Time';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13;"Last Date Modified";Date)
        {
            Caption = 'Last Date Modified';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14;Level;Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Level.Code where (Course=field("Course Id"));
        }
        field(15;Flag;Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(16;Remove;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(17;"Deleted By";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(18;"Deleted On";DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(19;Deleted;Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Entry No.")
        {
            Clustered = true;
        }
        key(Key2;"Stud. Reg. No",Deleted)
        {
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
        Papers: Record Papers;
        Section: Record Section;
        ExaminationAccount: Record "Examination Account";
}

