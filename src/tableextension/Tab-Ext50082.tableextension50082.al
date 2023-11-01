#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50082 "tableextension50082" extends "Job Planning Line" 
{
    fields
    {

        //Unsupported feature: Property Modification (Editable) on ""Unit Cost (LCY)"(Field 12)".

        field(65001;"Budget Type";Option)
        {
            DataClassification = ToBeClassified;
            Description = 'Added for Project Procurement Plan';
            OptionCaption = 'Original,Revised,Suplementary';
            OptionMembers = Original,Revised,Suplementary;
        }
        field(65002;"Job Budget Templates";Code[100])
        {
            DataClassification = ToBeClassified;
            Description = 'Added for Project Procurement Plan';
            TableRelation = "Job Budget Templates";
        }
        field(70014;"Department Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where ("Operating Unit Type"=const("Department/Center"),
                                                           "Direct Reports To"=field("Directorate Code"));
        }
        field(70018;"Directorate Code";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where ("Operating Unit Type"=const(Directorate));
        }
        field(70019;Division;Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center" where ("Operating Unit Type"=const("Division/Section"),
                                                           "Direct Reports To"=field("Department Code"));
        }
        field(70020;"Road Activity Categories";Code[50])
        {
            DataClassification = ToBeClassified;
            // TableRelation = "Road Activity categories
            //                 ";
        }
        field(70021;"Road Activity Sub-Category";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Road Activities";
        }
        field(70022;"Unit of Measure";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure".Code;
        }
        field(70023;"Planned Rate Amount";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70024;"Bid Amount";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70025;"Bid Quantity";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(70026;"Bid Rate";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(70027;"Labour (%)";Integer)
        {
            DataClassification = ToBeClassified;
        }
    }
}

