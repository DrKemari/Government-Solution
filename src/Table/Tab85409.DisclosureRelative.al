#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85409 "Disclosure Relative"
{

    fields
    {
        field(1; "Document No."; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Line No."; Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3; "Interest Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Relative,Other';
            OptionMembers = Relative,Other;
        }
        field(4; "Institution Code"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer."No." where("Customer Type" = const(Institution));

            trigger OnValidate()
            begin
                Customer.Reset;
                Customer.SetRange("No.", "Institution Code");
                if Customer.FindFirst then begin
                    "Institution Name" := Customer.Name
                end
            end;
        }
        field(5; "Institution Name"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Name of Relative"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(7; Relationship; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Son,Daughter,Nephew,Niece,Father,Mother,Cousin,Spouse,Other';
            OptionMembers = Son,Daughter,Nephew,Niece,Father,Mother,Cousin,Spouse,Other;
        }
        field(8; Course; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Courses;
        }
        field(9; Level; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Level;
        }
        field(10; "Nature of Interest"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(11; "Student Reg No."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Examination Account"."Registration No.";

            trigger OnValidate()
            begin
                ExaminationAccount.Reset;
                ExaminationAccount.SetRange("Registration No.", "Student Reg No.");
                if ExaminationAccount.FindSet then begin
                    Course := ExaminationAccount."Course ID";
                    "Name of Relative" := ExaminationAccount.Name;
                end;
            end;
        }
        field(12; "Document Type"; Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Setter Disclosure Form,Reviewers Comments,CEO Comments';
            OptionMembers = "Setter Disclosure Form","Reviewers Comments","CEO Comments";
        }
    }

    keys
    {
        key(Key1; "Document No.", "Line No.", "Document Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Customer: Record Customer;
        ExaminationAccount: Record "Examination Account";
}
