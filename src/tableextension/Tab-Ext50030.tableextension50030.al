#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50030 "tableextension50030" extends "Purch. Inv. Header" 
{
    fields
    {

        //Unsupported feature: Property Modification (Editable) on ""Currency Code"(Field 32)".

        field(50000;"Debit Note";Boolean)
        {
        }
        field(50001;"Remaining Amount LCY";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = -sum("Detailed Vendor Ledg. Entry".Amount where ("Document No."=field("No.")));
            Caption = 'Remaining Amount';
            Editable = false;
            FieldClass = FlowField;
        }
    }
}

