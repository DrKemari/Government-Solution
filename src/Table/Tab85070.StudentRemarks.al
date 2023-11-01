#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85070 "Student Remarks"
{

    fields
    {
        field(1;"Entry No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Source Document";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Details;Text[340])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Student No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer;
        }
        field(5;"Last Modified Date Time";DateTime)
        {
            Caption = 'Last Modified Date Time';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6;"Last Date Modified";Date)
        {
            Caption = 'Last Date Modified';
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7;"Remark Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Remarks Setup";

            trigger OnValidate()
            var
                RemarksSetup: Record "Remarks Setup";
            begin
                RemarksSetup.Reset;
                RemarksSetup.SetRange(Code,"Remark Code");
                if RemarksSetup.FindSet then begin
                  "Remark Description":=RemarksSetup.Description;
                  Disciplinary:=RemarksSetup.Disciplinary;
                  end
            end;
        }
        field(8;"Remark Description";Text[200])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9;"Registration No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Examination Account";

            trigger OnValidate()
            begin
                ExaminationAccount.Reset;
                ExaminationAccount.SetRange("Registration No.","Registration No.");
                if ExaminationAccount.FindFirst then begin
                  "Student No.":=ExaminationAccount."Student Cust No.";
                end
            end;
        }
        field(10;Disciplinary;Boolean)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Entry No.","Student No.")
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
        ExaminationAccount: Record "Examination Account";
}

