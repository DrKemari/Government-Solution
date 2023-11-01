#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 98778 "Student Application"
{

    fields
    {
        field(1;FirstName;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;MiddleName;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;LastName;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Gender;Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Male," Female";
        }
        field(5;DateOfBirth;Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6;IDNumber;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(7;NameOfSchool;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(8;AdmissionNumber;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(9;Campus;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(10;Faculty;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(11;CourseOfStudy;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(12;ModeOfStudy;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(13;Class;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(14;YearMonthOfCompletion;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(15;PhoneNumber;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(16;PhysicalAddress;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(17;County;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(18;Ward;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(19;SubCounty;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(20;Location;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(21;sublocation;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(22;"code";Text[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;FirstName)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

