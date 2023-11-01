#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
TableExtension 50053 "tableextension50053" extends "Bank Account" 
{
    fields
    {

        //Unsupported feature: Property Modification (CalcFormula) on "Balance(Field 58)".

        field(50000;Test;Code[30])
        {
        }
        field(57000;Type;Option)
        {
            OptionCaption = 'Bank,Petty Cash';
            OptionMembers = Bank,"Petty Cash";
        }
        field(57001;"Bank Type";Option)
        {
            OptionMembers = Normal,Cash,"Fixed Deposit",SMPA,"Chq Collection";

            trigger OnValidate()
            begin

                //TestNoEntriesExist(FIELDCAPTION("Bank Type"));
            end;
        }
        field(57002;"Pending Voucher Amount";Decimal)
        {
        }
        field(57003;"Responsibility Center";Code[10])
        {
            Caption = 'Responsibility Center';

            trigger OnValidate()
            begin
                /*
                IF NOT UserMgt.CheckRespCenter(1,"Responsibility Center") THEN
                  ERROR(
                    Text005,
                    RespCenter.TABLECAPTION,UserMgt.GetPurchasesFilter);
                
                */

            end;
        }
        field(57004;"Bank Branch Name";Text[250])
        {
        }
        field(57005;"Cheque Numbers";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(57006;"Main Bank";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(57007;"Closed Entries Net Change";Decimal)
        {
            AutoFormatExpression = "Currency Code";
            AutoFormatType = 1;
            CalcFormula = sum("Bank Account Ledger Entry".Amount where ("Bank Account No."=field("No."),
                                                                        "Global Dimension 1 Code"=field("Global Dimension 1 Filter"),
                                                                        "Global Dimension 2 Code"=field("Global Dimension 2 Filter"),
                                                                        "Posting Date"=field("Date Filter"),
                                                                        "Fee Account Entries"=filter(true)));
            Caption = 'Net Change';
            Editable = false;
            FieldClass = FlowField;
        }
    }
}

