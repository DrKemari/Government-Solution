#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56062 "ICT Issuance Voucher Lines"
{

    fields
    {
        field(1;"No.";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "ICT Issuance Voucher"."No.";
        }
        field(2;"Code";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "ICT Inventory".Code;

            trigger OnValidate()
            begin
                ICTInventory.Reset;
                ICTInventory.SetRange(Code,Code);
                if ICTInventory.FindSet then begin
                  Description:=ICTInventory.Description;
                  "Serial No.":=ICTInventory."Serial No.";
                  "FA No":=ICTInventory."Sub Type No.";
                  "Dpt Current Assigned":=ICTInventory."Current Assigned Division/Unit";
                  "Current Assigned Employee":=ICTInventory."Current Assigned Employee";
                  end;
            end;
        }
        field(3;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Serial No.";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Duration of Use start date";DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Duration of Use end date";DateTime)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                "Duration of Use":="Duration of Use end date"-"Duration of Use start date";
            end;
        }
        field(7;"Duration of Use";Duration)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"FA No";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Fixed Asset"."No.";
        }
        field(9;"Reason For Movement";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(10;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Issuance,Movement';
            OptionMembers = Issuance,Movement;
        }
        field(11;"Dpt Current Assigned";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where ("Operating Unit Type"=const("Department/Center"));

            trigger OnValidate()
            begin
                Employee.SetRange("No.","Dpt Current Assigned");
                if Employee.FindSet then begin
                  "Current Assigned Employee":=Employee."First Name"+' '+Employee."Last Name";
                  end;
            end;
        }
        field(12;"Current Assigned Employee";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";
        }
        field(13;Comments;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Return Reason";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Return Condition";Text[250])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"No.",Type,"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ICTInventory: Record "ICT Inventory";
        Employee: Record Employee;
}

