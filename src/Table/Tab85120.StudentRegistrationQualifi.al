table 85120 "Student Registration Qualifi"
{
    Caption = 'Student Registration Qualifications';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Line No"; Integer)
        {
            Caption = 'Line No';
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2; "Application No"; Code[50])
        {
            Caption = 'Application No';
            DataClassification = ToBeClassified;
        }
        field(3; "Student No"; Code[50])
        {
            Caption = 'Student Number';
            DataClassification = ToBeClassified;
        }
        field(4; From; Date)
        {
            Caption = 'From';
            DataClassification = ToBeClassified;
        }
        field(5; "To"; Date)
        {
            Caption = 'To';
            DataClassification = ToBeClassified;
        }
        field(6; Institution; Text[250])
        {
            Caption = 'Institution';
            DataClassification = ToBeClassified;
        }
        field(7; "Qualification Earned"; Text[250])
        {
            Caption = 'Qualification Earned';
            DataClassification = ToBeClassified;
        }
        field(8; "Main Field of Study"; Text[250])
        {
            Caption = 'Main Field of Study';
            DataClassification = ToBeClassified;
        }
        field(9; "Id Number"; Code[50])
        {
            Caption = 'Id';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Line No", "Application No")
        {
            Clustered = true;
        }
    }
}
