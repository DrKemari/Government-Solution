#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 85003 "Student Accounts Import"
{
    Direction = Both;
  //  Encoding = UTF8;
    Format = VariableText;
    FormatEvaluate = Legacy;
    TextEncoding = WINDOWS;

    schema
    {
        textelement(Root)
        {
            tableelement(Customer;Customer)
            {
                AutoUpdate = true;
                XmlName = 'StudentData';
                SourceTableView = where("Customer Type"=const(Student));
                fieldelement(StudentRegNo;Customer."No.")
                {
                    FieldValidate = yes;
                }
                fieldelement(StudentName;Customer.Name)
                {
                    FieldValidate = yes;
                }
                fieldelement(Address;Customer.Address)
                {
                    FieldValidate = yes;
                }
                fieldelement(Address2;Customer."Address 2")
                {
                }
                fieldelement(City;Customer.City)
                {
                }
                fieldelement(Contact;Customer.Contact)
                {
                }
                fieldelement(PhoneNo;Customer."Phone No.")
                {
                }
                fieldelement(CustomerPG;Customer."Customer Posting Group")
                {
                }
                fieldelement(CurrencyCode;Customer."Currency Code")
                {
                }
                fieldelement(CountryCode;Customer."Country/Region Code")
                {
                }
                fieldelement(GenPostingGroup;Customer."Gen. Bus. Posting Group")
                {
                }
                fieldelement(PostCode;Customer."Post Code")
                {
                }
                fieldelement(County;Customer.County)
                {
                }
                fieldelement(Email;Customer."E-Mail")
                {
                }
                fieldelement(VATPostingGroup;Customer."VAT Bus. Posting Group")
                {
                }
                fieldelement(Type;Customer.Type)
                {
                }
                fieldelement(CustomerType;Customer."Customer Type")
                {
                }
                fieldelement(iDNo;Customer."ID. No.")
                {
                }
                fieldelement(FName;Customer."First Name")
                {
                }
                fieldelement(MName;Customer."Middle Name")
                {
                }
                fieldelement(LName;Customer."Last Name")
                {
                }
                fieldelement(PhysicalLocation;Customer."Physical Location")
                {
                }
                fieldelement(FundingClass;Customer."Funding Class")
                {
                    FieldValidate = no;
                }
                fieldelement(BirthCerificateNumber;Customer."Birth Certificate No.")
                {
                }
                fieldelement(Disabled;Customer.Disabled)
                {
                }
                fieldelement(NCWP;Customer."NCPWD No.")
                {
                }
                fieldelement(TrainingInstitution;Customer."Training Institution")
                {
                }
                fieldelement(DOB;Customer."Date of Birth")
                {
                    FieldValidate = no;
                }
                fieldelement(RegDate;Customer."Registration Date")
                {
                    FieldValidate = no;
                }
                fieldelement(Gender;Customer.Gender)
                {
                }
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    var
        HeaderNo: Code[30];
        CourseID: Code[30];
        HRDates: Codeunit "HR Dates";
        MarksheetLines: Record "Exam Marksheet Lines";
        MarksheetLines1: Record "Exam Marksheet Lines";
        SittingID: Code[30];
}

