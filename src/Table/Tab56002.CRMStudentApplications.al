#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56002 "CRM Student Applications"
{

    fields
    {
        field(1;"Application No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"First Name";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Middle Name";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Last Name";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5;Initials;Text[10])
        {
            DataClassification = ToBeClassified;
        }
        field(6;Address;Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(7;Address2;Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(8;City;Text[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Post Code";
        }
        field(9;"Post Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Post Code";
        }
        field(10;County;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Phone No.";Text[30])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = PhoneNo;
        }
        field(12;"Mobile Phone No.";Text[30])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = PhoneNo;
        }
        field(13;Email;Text[30])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = EMail;
        }
        field(14;Picture;Media)
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Birth Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(16;Gender;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Male,Female,Other';
            OptionMembers = Male,Female,Other;
        }
        field(17;"Country/Region Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Country/Region";
        }
        field(18;"ID Number";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(19;"Passport Number";Code[15])
        {
            DataClassification = ToBeClassified;
        }
        field(20;"Tax Registration (PIN) No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(21;"Marital Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Single,Married,Widowed,Separated,Divorced';
            OptionMembers = Single,Married,Widowed,Separated,Divorced;
        }
        field(22;Religion;Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(23;"Document ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Document Type"=filter("Job Application")) "CRM Vacancies"
                            else if ("Document Type"=filter(Training)) "CRM Training";
        }
        field(24;"Student No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer where ("Customer Type"=filter(Student));

            trigger OnValidate()
            begin
                Customer.Reset;
                Customer.SetRange("No.","Student No.");
                if Customer.FindSet then begin
                  "First Name":=Customer."First Name";
                  "Middle Name":=Customer."Middle Name";
                  "Last Name":=Customer."Last Name";
                  Gender:=Customer.Gender;
                  Address:=Customer.Address;
                  Address2:=Customer."Address 2";
                  "ID Number":=Customer."ID. No.";
                  "Birth Date":=Customer."Date of Birth";
                end
            end;
        }
        field(25;"No. Series";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(26;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Job Application,Training';
            OptionMembers = "Job Application",Training;
        }
    }

    keys
    {
        key(Key1;"Application No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        HumanResourcesSetup.Get();
        if "Document Type"="document type"::"Job Application" then begin
        HumanResourcesSetup.TestField("CRM Applicants");
            if "Application No."='' then begin
                NoSeriesMgt.InitSeries(HumanResourcesSetup."CRM Training Nos.",xRec."No. Series",0D,"Application No.","No. Series");
            end;
            end;
        if "Document Type"="document type"::Training then begin
          HumanResourcesSetup.TestField("CRM Attendees");
             if "Application No."='' then begin
                NoSeriesMgt.InitSeries(HumanResourcesSetup."CRM Attendees",xRec."No. Series",0D,"Application No.","No. Series");
            end;
        end
    end;

    var
        Customer: Record Customer;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        HumanResourcesSetup: Record "Human Resources Setup";
}

