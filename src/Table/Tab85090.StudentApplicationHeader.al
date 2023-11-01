#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85090 "Student Application Header"
{
    DrillDownPageID = "Cash Recipt Lines";
    LookupPageID = "Cash Recipt Lines";

    fields
    {
        field(1;"No.";Code[20])
        {

            trigger OnValidate()
            begin
                if "No."<>xRec."No." then
                NoSeriesMgt.TestManual(ExaminationSetup."Payment Application Nos.");
            end;
        }
        field(2;Date;Date)
        {
        }
        field(3;"Pay Mode";Code[20])
        {
            TableRelation = "Pay Mode";
        }
        field(4;"Reference No.";Code[20])
        {
        }
        field(5;"Application Date";Date)
        {
        }
        field(6;"Amount To Apply";Decimal)
        {
            CalcFormula = sum("Student Application Lines".Amount where ("Header No."=field("No.")));
            FieldClass = FlowField;
        }
        field(7;"Amount(LCY)";Decimal)
        {
            CalcFormula = sum("Receipt Lines1"."Amount (LCY)" where ("Receipt No."=field("No.")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(8;"Student No.";Code[20])
        {
            TableRelation = Customer;

            trigger OnValidate()
            var
                Customer: Record Customer;
                CustLedgerEntry: Record "Cust. Ledger Entry";
                TotalAmount: Decimal;
            begin
                Customer.Reset;
                Customer.SetRange("No.","Student No.");
                if Customer.FindFirst then begin
                  "Student Name":=Customer.Name;
                  CustLedgerEntry.Reset;
                  CustLedgerEntry.SetRange("Customer No.","Student No.");
                  CustLedgerEntry.SetRange(Open,true);
                  CustLedgerEntry.SetRange(Positive,false);
                  if CustLedgerEntry.FindSet then begin
                    repeat
                       CustLedgerEntry.CalcFields("Remaining Amt. (LCY)");
                      TotalAmount:=TotalAmount+CustLedgerEntry."Remaining Amt. (LCY)";
                    until CustLedgerEntry.Next=0;
                  end;
                 "Total Unapplied Amount":=TotalAmount*-1;
                end
            end;
        }
        field(9;"Student Name";Text[70])
        {
        }
        field(10;"On Behalf Of";Text[70])
        {
        }
        field(11;Cashier;Code[50])
        {
        }
        field(12;Posted;Boolean)
        {
        }
        field(13;"Posted Date";Date)
        {
        }
        field(14;"Posted Time";Time)
        {
        }
        field(15;"Posted By";Code[30])
        {
        }
        field(16;"No. Series";Code[20])
        {
            TableRelation = "No. Series";
        }
        field(17;"Total Unapplied Amount";Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(Key1;"No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin

        //No. series
        if "No." = '' then begin
          ExaminationSetup.Get;
          ExaminationSetup.TestField("Payment Application Nos.");
          NoSeriesMgt.InitSeries(ExaminationSetup."Payment Application Nos.",xRec."No. Series",0D,"No.","No. Series");
        end;
        Date:=Today;
        Cashier:=UserId;
    end;

    var
        NoSeriesMgt: Codeunit NoSeriesManagement;
        GLSetup: Record "General Ledger Setup";
        ExaminationSetup: Record "Examination Setup";
        DimMgt: Codeunit DimensionManagement;
        Text051: label 'You may have changed a dimension.\\Do you want to update the lines?';
        MissingExchangeRatesQst: label 'There are no exchange rates for currency %1 and date %2. Do you want to add them now? Otherwise, the last change you made will be reverted.', Comment='%1 - currency code, %2 - posting date';
        Text022: label 'Do you want to update the exchange rate?';
}

