#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 95137 "Risk Incident Log Impact R"
{

    fields
    {
        field(1;"Incident No";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Line No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;"Impact Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Injury,Fatality (Death),Financial Loss,Schedule Delay/Service Disruption(Days)';
            OptionMembers = " ",Injury,"Fatality (Death)","Financial Loss","Schedule Delay/Service Disruption(Days)";
        }
        field(4;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Unit Of Measure";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(6;Quantity;Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Category of Party Affected";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Internal Employee,Contractor Employee,Subcontractor Employee,Visitor,Public,Anonymous,Other';
            OptionMembers = " ","Internal Employee","Contractor Employee","Subcontractor Employee",Visitor,Public,Anonymous,Other;
        }
        field(8;"Internal Employee No.";Code[20])
        {
            DataClassification = ToBeClassified;
            Description = 'Employee.No.';
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                Employee.Reset;
                Employee.SetRange("No.","Internal Employee No.");
                if Employee.FindSet then
                  Name:=Employee."First Name"+' '+Employee."Middle Name"+' '+Employee."Last Name";
            end;
        }
        field(9;Name;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Contact Details";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Additional Comments";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Police Report Reference No.";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Police Report Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Police Station";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Reporting Officer";Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Incident No","Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Employee: Record Employee;
}

