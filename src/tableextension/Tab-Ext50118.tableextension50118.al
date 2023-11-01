#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50118 "tableextension50118" extends "Maintenance Registration" 
{
    fields
    {
        field(50000;"Maintance Amount";Decimal)
        {
        }
        field(50001;"Driver in Charge";Text[30])
        {
        }
        field(50002;"Planned date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50003;"Description of activitty";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(50004;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Preventive, Condition-Based, Predictive, Corrective';
            OptionMembers = Preventive," Condition-Based"," Predictive"," Corrective";
        }
    }
}

