#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 56071 "ICT Maintenance Lines"
{

    fields
    {
        field(1;"Document No";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Maintenance Area";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "ICT Maintenance Areas".Code;

            trigger OnValidate()
            begin
                ICTMaintenanceAreas.Reset;
                ICTMaintenanceAreas.SetRange(Code,"Maintenance Area");
                if ICTMaintenanceAreas.FindSet then
                  Description:=ICTMaintenanceAreas.Description;
                "Inventory Category":=ICTMaintenanceAreas."Inventory  Category";
            end;
        }
        field(3;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Inventory Category";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "ICT Asset subcategory".Code;
        }
        field(5;"Maintenance Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Preventive,Corrective';
            OptionMembers = Preventive,Corrective;
        }
        field(6;"Year Code";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Annual Reporting Codes".Code where ("Current Year"=const(true));
        }
        field(7;"No. of Planned Periods";Integer)
        {
            CalcFormula = count("Maintenance Periods" where ("Document No"=field("Document No"),
                                                             "Maintenance Code"=field("Maintenance Area")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(8;Quantity;Integer)
        {
            CalcFormula = count("ICT Maintenance Inventory" where ("Document No"=field("Document No"),
                                                                   "Mainatenance Code"=field("Maintenance Area")));
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Document No","Maintenance Area")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ICTMaintenanceAreas: Record "ICT Maintenance Areas";
}

