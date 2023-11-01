#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 59071 "File Movement Line"
{

    fields
    {
        field(1;"Document No.";Code[20])
        {
        }
        field(2;"File Type";Code[20])
        {
            TableRelation = "File Types SetUp".Code;

            trigger OnValidate()
            begin
                /*Setup.RESET;
                Setup.SETRANGE(Code,"File Type");
                IF Setup.FIND('-') THEN BEGIN
                  "File Description":=Setup.Description;
                  END;*/

            end;
        }
        field(3;"Issue Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Account No.";Code[20])
        {
            Caption = 'Issued To';
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                FileMovementHeader.Reset;
                FileMovementHeader.SetRange("No.","Document No.");
                FileMovementHeader.SetRange("Account No.","Account No.");
                if not FileMovementHeader.FindSet then begin
                  Error('ERROR! This is not the requestor!');
                  end;
                Employee.Reset;
                Employee.SetRange("No.","Account No.");
                if Employee.FindSet then
                  "Issued To Name":=Employee."First Name"+' '+Employee."Last Name";
                "Department Name":=Employee."Department Code";
                "Issue Date":=Today;
                /*
                
                CASE "Account Type" OF
                  "Account Type"::"G/L Account":
                    IF GlAccount.GET("Account No.") THEN BEGIN
                        "Account Name":=GlAccount.Name;
                      END;
                  "Account Type"::Customer:
                   IF Customer.GET("Account No.") THEN BEGIN
                        "Account Name":=Customer.Name;
                      END;
                  "Account Type"::Vendor:
                    IF Vendor.GET("Account No.") THEN BEGIN
                        "Account Name":=Vendor.Name;
                      END;
                  "Account Type"::Employee:
                    IF Employee.GET("Account No.") THEN BEGIN
                        "Account Name":=Employee."First Name"+' '+Employee."Middle Name"+' '+Employee."Last Name";
                      END;
                  "Account Type"::"Bank Account":
                   IF Bank.GET("Account No.") THEN BEGIN
                        "Account Name":=Bank.Name;
                      END;
                  "Account Type"::"Fixed Asset":
                  IF FixedAsset.GET("Account No.") THEN BEGIN
                        "Account Name":=FixedAsset.Description;
                      END;
                  "Account Type"::"IC Partner":
                   IF Partners.GET("Account No.") THEN BEGIN
                        "Account Name":=Partners.Name;
                      END;
                END;
                */

            end;
        }
        field(5;"Purpose/Description";Text[100])
        {
        }
        field(6;"Global Dimension 1 Code";Code[20])
        {
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=filter(1));

            trigger OnValidate()
            begin
                Dept.Reset;
                Dept.SetRange(Code,"Global Dimension 1 Code");
                if Dept.Find('-') then begin
                   "Department Name":=Dept.Name;
                  end;
            end;
        }
        field(7;"Global Dimension 2 Code";Code[20])
        {
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=filter(2));
        }
        field(8;"Issued To Name";Text[100])
        {
            Editable = false;
        }
        field(9;"File Number";Code[50])
        {
            TableRelation = "Registry File Creation"."File No" where ("File Type"=field("File Type"));

            trigger OnValidate()
            begin
                filec.Reset;
                filec.SetRange("File No","File Number");
                if filec.Find('-') then begin
                  "File Description":=filec.Description;
                  end;
            end;
        }
        field(10;"Line No.";Integer)
        {
            AutoIncrement = true;
        }
        field(11;"Destination File Location";Code[40])
        {
            TableRelation = "File Locations Setup".Location;
        }
        field(12;"Department Name";Code[100])
        {
            DataClassification = ToBeClassified;
        }
        field(13;"File Description";Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14;"Date Returned";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(15;Comments;Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Line No.","Document No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Vendor: Record Vendor;
        Customer: Record Customer;
        GlAccount: Record "G/L Account";
        Employee: Record Employee;
        Partners: Record Contact;
        Bank: Record "Bank Account";
        FixedAsset: Record "Fixed Asset";
        Dept: Record "Dimension Value";
        Setup: Record "File Types SetUp";
        filec: Record "Registry File Creation";
        FileMovementHeader: Record "File Movement Header";
}

