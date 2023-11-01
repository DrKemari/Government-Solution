#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80239 "Employee to be Notified-Policy"
{

    fields
    {
        field(1;"Document No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Employee No";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                Employee.Reset;
                Employee.SetRange("No.","Employee No");
                if Employee.Find('-') then begin
                   "Employee Name":=Employee.FullName;
                   "Email Address":=Employee."E-Mail";
                end;

                BusinessResearchSurvey.Reset;
                BusinessResearchSurvey.SetRange("Document No.","Document No.");
                if BusinessResearchSurvey.Find('-') then begin
                   "Policy Description":=BusinessResearchSurvey.Description;
                end;
            end;
        }
        field(3;"Employee Name";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Email Address";Text[255])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Policy Description";Text[255])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No.","Employee No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Employee: Record Employee;
        BusinessResearchSurvey: Record "Business Research Survey";
}

