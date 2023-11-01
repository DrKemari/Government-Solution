#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 80212 "Research Survey Type"
{

    fields
    {
        field(1;"Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;Description;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Business Research Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Employee Experience,Customer Experience,Project Survey,Custom Survey';
            OptionMembers = "Employee Experience","Customer Experience","Post-Project Survey","Custom Survey";
        }
        field(4;"Target Respondent Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Customers,Employees,Contacts,Vendors';
            OptionMembers = Customers,Employees,Contacts,Vendors;
        }
        field(5;"Primary Directorate";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where ("Operating Unit Type"=const(Directorate));
        }
        field(6;"Primary Department";Code[50])
        {
            Caption = 'Primary Division';
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where ("Operating Unit Type"=const("Department/Center"));

            trigger OnValidate()
            begin
                // IF ResponsibilityCenter.FIND('-') THEN BEGIN
                //   "Primary Directorate":=ResponsibilityCenter."Direct Reports To";
                // END;
            end;
        }
        field(7;"No. of BR Templates";Integer)
        {
            CalcFormula = count("Business Research Template" where ("Survey Type"=field(Code)));
            FieldClass = FlowField;
        }
        field(8;"No. of BR Surveys";Integer)
        {
            CalcFormula = count("Business Research Survey" where ("Survey Type"=field(Code)));
            FieldClass = FlowField;
        }
        field(9;"No. of Survey Responses";Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10;"No. of BR Final Reports";Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11;Blocked;Boolean)
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
    }

    var
        ResponsibilityCenter: Record "Responsibility Center";
}

