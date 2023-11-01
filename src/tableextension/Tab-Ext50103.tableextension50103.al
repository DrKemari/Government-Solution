#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50103 "tableextension50103" extends "Employee Qualification" 
{
    fields
    {

        //Unsupported feature: Property Insertion (AutoIncrement) on ""Line No."(Field 2)".


        //Unsupported feature: Property Modification (Data type) on ""Qualification Code"(Field 3)".

        field(14;Year;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(15;Specialization;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(69600;"Specialized Domain Area";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Domain Area";
        }
        field(69601;"Qualification Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ',Academic,Professional,Skills & Competencies,Experience,Ethics & Integrity,Physical Attributes';
            OptionMembers = ,Academic,Professional,"Skills & Competencies",Experience,"Ethics & Integrity","Physical Attributes";
        }
    }
    keys
    {

        //Unsupported feature: Deletion (KeyCollection) on ""Qualification Code"(Key)".

    }
}

