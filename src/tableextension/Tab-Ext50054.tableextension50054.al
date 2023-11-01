#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50054 "tableextension50054" extends "Bank Account Ledger Entry" 
{
    fields
    {

        //Unsupported feature: Property Insertion (ValidateTableRelation) on ""Statement No."(Field 56)".


        //Unsupported feature: Property Modification (Data type) on ""External Document No."(Field 63)".


        //Unsupported feature: Property Deletion (TableRelation) on ""Statement Line No."(Field 57)".

        field(50070;"Statement Date";Date)
        {
            CalcFormula = lookup("Bank Account Statement"."Statement Date" where ("Bank Account No."=field("Bank Account No."),
                                                                                  "Statement No."=field("Statement No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(50071;"Fee Account Entries";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50072;"Actual Trans Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(50073;"Payment Reference No.";Code[50])
        {
            Caption = 'Payment Reference No.';
            DataClassification = ToBeClassified;
        }
        field(50074;PaymentRef;Code[50])
        {
            DataClassification = ToBeClassified;
        }
    }
}

