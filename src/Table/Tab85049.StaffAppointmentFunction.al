#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85049 "Staff Appointment Function"
{

    fields
    {
        field(1;"Entry No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Header No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Staff Role Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4;Description;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Resource No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Resource;

            trigger OnValidate()
            begin
                if Resource.Get("Resource No.") then begin
                  Name:=Resource.Name;
                  Email:=Resource.Address;
                  end
            end;
        }
        field(6;Name;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(7;Email;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Project Manager";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Staff Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Management/Executive Staff,Technical Staff,Consultant,Project Mgt Staff,Site/Delivery Staff,Support Staff,Other';
            OptionMembers = "Management/Executive Staff","Technical Staff",Consultant,"Project Mgt Staff","Site/Delivery Staff","Support Staff",Other;
        }
        field(10;Designation;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Effective Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Expiry Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Termination Details";Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Termination Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Termination Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Normal Staff Exit,Contract Expiry,Project Demobilization';
            OptionMembers = "Normal Staff Exit","Contract Expiry","Project Demobilization";
        }
        field(16;"Posting Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(17;"Posted By";Code[30])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Entry No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Resource: Record Resource;
}

