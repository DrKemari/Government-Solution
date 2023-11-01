#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50043 "tableextension50043" extends "Resource Price" 
{
    fields
    {

        //Unsupported feature: Code Insertion on ""Work Type Code"(Field 4)".

        //trigger OnValidate()
        //Parameters and return type have not been exported.
        //begin
            /*
            WorkType.RESET;
            WorkType.SETRANGE(Code,"Work Type Code");
            IF WorkType.FINDFIRST THEN
              Description:=WorkType.Description;
            */
        //end;
        field(85000;"Discount Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Rate %,Amount';
            OptionMembers = "Rate %",Amount;
        }
        field(85001;"Discount Value";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(85002;"Discount Amount";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(85003;"Effective Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(85004;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Registration,Booking,Exemption,Withdrawal,Defferment,Disciplinary,Reinstatement,Collection,Remarking,Renewal,Re-Activation,Confirmation';
            OptionMembers = Registration,Booking,Exemption,Withdrawal,Defferment,Disciplinary,Reinstatement,Collection,Remarking,Renewal,"Re-Activation",Confirmation;
        }
        field(85005;Course;Code[20])
        {
            CalcFormula = lookup(Resource."Course ID" where ("No."=field(Code)));
            FieldClass = FlowField;
        }
        field(85006;Description;Text[100])
        {
            Caption = 'Description';
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        // Unsupported feature: Key containing base fields
        // key(Key1;"Code")
        // {
        // }
    }

    //Unsupported feature: Insertion (FieldGroupCollection) on "(FieldGroup: DropDown)".


    var
        WorkType: Record "Work Type";
}

