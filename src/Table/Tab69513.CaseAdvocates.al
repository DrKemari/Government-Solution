#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69513 "Case Advocates"
{
    DrillDownPageID = "Case Advocates";
    LookupPageID = "Case Advocates";

    fields
    {
        field(1;"Code";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Names;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(3;Contacts;Code[255])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Email;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Firm Code";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Contact."No.";

            trigger OnValidate()
            begin
                contact.Reset;
                contact.SetRange("No.","Firm Code");
                if contact.Find('-') then
                  "Firm name":=contact.Name;
            end;
        }
        field(6;"Firm name";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Second name";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(8;Address;Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(9;City;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Postal Code";Code[10])
        {
            DataClassification = ToBeClassified;
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
        fieldgroup(LooKUp;Names)
        {
        }
        fieldgroup(DrillDown;Contacts)
        {
        }
    }

    var
        contact: Record Contact;
}

