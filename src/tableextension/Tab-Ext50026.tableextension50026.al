#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50026 "tableextension50026" extends "General Ledger Setup" 
{
    fields
    {

        //Unsupported feature: Property Modification (CalcFormula) on ""Cust. Balances Due"(Field 44)".

        field(50009;"Posted Receipts No";Code[20])
        {
            Caption = 'Receipts No';
            DataClassification = ToBeClassified;
        }
        field(50146;"Bank Balances";Decimal)
        {
            AutoFormatType = 1;
            CalcFormula = sum("Bank Account Ledger Entry"."Amount (LCY)" where ("Global Dimension 1 Code"=field("Global Dimension 1 Filter"),
                                                                                "Global Dimension 2 Code"=field("Global Dimension 2 Filter"),
                                                                                "Posting Date"=field("Date Filter")));
            Caption = 'Bank Balances';
            Editable = false;
            FieldClass = FlowField;
        }
        field(50147;"Pending L.O.P";Decimal)
        {
            CalcFormula = sum("Purchase Line"."Outstanding Amount (LCY)" where ("Shortcut Dimension 1 Code"=field("Global Dimension 1 Filter"),
                                                                                "Shortcut Dimension 2 Code"=field("Global Dimension 2 Filter"),
                                                                                "Expected Receipt Date"=field("Date Filter"),
                                                                                Amount=filter(<>0),
                                                                                "Document Type"=filter(<>Quote)));
            FieldClass = FlowField;
        }
        field(50148;"Current Budget";Code[20])
        {
            TableRelation = "G/L Budget Name".Name;
        }
        field(59002;"Service Nos.";Code[10])
        {
            Caption = 'Service Nos.';
            TableRelation = "No. Series";
        }
        field(59003;"File Movement Nos";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(59004;"DMS Link";Text[70])
        {
            DataClassification = ToBeClassified;
        }
        field(59005;"Tax Rounding Precision (LCY)";Decimal)
        {
            AutoFormatType = 1;
            Caption = 'Tax Rounding Precision (LCY)';
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if "Amount Rounding Precision" <> 0 then
                  if "Inv. Rounding Precision (LCY)" <> ROUND("Inv. Rounding Precision (LCY)","Amount Rounding Precision") then
                    Error('',               FieldCaption("Inv. Rounding Precision (LCY)"),"Amount Rounding Precision");
            end;
        }
        field(59006;"Tax Rounding Type (LCY)";Option)
        {
            Caption = 'Tax Rounding Type (LCY)';
            DataClassification = ToBeClassified;
            OptionCaption = 'Nearest,Up,Down';
            OptionMembers = Nearest,Up,Down;
        }
        field(59007;"Budget Reallocation Nos.";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
    }
}

