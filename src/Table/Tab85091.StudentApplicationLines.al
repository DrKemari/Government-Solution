#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85091 "Student Application Lines"
{

    fields
    {
        field(1;"Line No";Integer)
        {
            AutoIncrement = true;
        }
        field(2;"Header No.";Code[30])
        {
        }
        field(3;"Process Type";Option)
        {
            OptionCaption = 'Registration,Booking,Exemption,Withdrawal,Defferment,Disciplinary,Reinstatement,Collection,Remarking,Renewal,Re-Activation,Confirmation';
            OptionMembers = Registration,Booking,Exemption,Withdrawal,Defferment,Disciplinary,Reinstatement,Collection,Remarking,Renewal,"Re-Activation",Confirmation;
        }
        field(4;"Applies to Doc. No";Code[20])
        {
            DataClassification = ToBeClassified;

            trigger OnLookup()
            begin
                "Applies to Doc. No":='';
                  Amt:=0;
                 CustLedger.Reset;
                 CustLedger.SetCurrentkey(CustLedger."Customer No.",Open,"Document No.");
                 CustLedger.SetRange(CustLedger."Customer No.","Student No.");
                 CustLedger.SetRange(Open,true);
                 CustLedger.SetRange(Positive,true);
                 CustLedger.CalcFields(CustLedger."Remaining Amt. (LCY)");//25
                 if Page.RunModal(25,CustLedger) = Action::LookupOK then begin
                "Applies to Doc. No":=CustLedger."Document No.";
                   Amount:=CustLedger."Remaining Amt. (LCY)";
                   "Amount (LCY)":=CustLedger."Remaining Amt. (LCY)";
                 Validate("Applies to Doc. No");
                end;
            end;

            trigger OnValidate()
            var
                TXT001: label 'The invoice selected relates to %1,kindly update the process type';
            begin
                //get the examination
                SalesHeader.Reset;
                SalesHeader.SetRange("No.","Applies to Doc. No");
                if SalesHeader.FindFirst then begin

                StudentHeader.Reset;
                StudentHeader.SetRange("No.",SalesHeader."External Document No.");
                if StudentHeader.FindFirst then begin
                  if StudentHeader."Document Type"<>"Process Type" then
                    Error(TXT001,StudentHeader."Document Type");
                  StudentHeader.CalcFields("Examination Description");
                  Examination:=StudentHeader."Examination Description";
                  Description:=Examination+' '+Format("Process Type");
                end

                end
            end;
        }
        field(5;Examination;Text[70])
        {
            Editable = false;
        }
        field(6;Description;Text[70])
        {
        }
        field(7;Amount;Decimal)
        {
        }
        field(8;"Global Dimension 1 Code";Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(1));
        }
        field(9;"Global Dimension 2 Code";Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(2));
        }
        field(10;"Currency Code";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = Currency;
        }
        field(11;"Currency Factor";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Amount (LCY)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Dimension Set ID";Integer)
        {
            Caption = 'Dimension Set ID';
            DataClassification = ToBeClassified;
            Editable = false;
            Enabled = false;
            TableRelation = "Dimension Set Entry";
        }
        field(14;"Shortcut Dimension 3 Code";Code[20])
        {
            CaptionClass = '1,2,3';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(3));
        }
        field(15;"Student No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Customer;
        }
    }

    keys
    {
        key(Key1;"Header No.","Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        //insert student no
         ApplicationHeader.Reset;
         ApplicationHeader.SetRange("No.","Header No.");
         if ApplicationHeader.FindFirst then begin
          "Student No.":=ApplicationHeader."Student No.";
         end
    end;

    var
        Amt: Decimal;
        CustLedger: Record "Cust. Ledger Entry";
        CustLedger1: Record "Cust. Ledger Entry";
        ApplicationHeader: Record "Student Application Header";
        StudentHeader: Record "Student Processing Header";
        SalesHeader: Record "Sales Invoice Header";

    procedure ValidateShortcutDimCode(FieldNumber: Integer;var ShortcutDimCode: Code[20])
    begin
    end;

    procedure LookupShortcutDimCode(FieldNumber: Integer;var ShortcutDimCode: Code[20])
    begin
        //DimMgt.LookupDimValueCode(FieldNumber,ShortcutDimCode);
        //ValidateShortcutDimCode(FieldNumber,ShortcutDimCode);
    end;

    procedure ShowShortcutDimCode(var ShortcutDimCode: array [8] of Code[20])
    begin
        //DimMgt.GetShortcutDimensions("Dimension Set ID",ShortcutDimCode);
    end;

    local procedure ValidateAmount(ShouldCheckPaymentTolerance: Boolean)
    var
        GLSetup: Record "General Ledger Setup";
    begin
        // GLSetup.GET;
        // "Amount (LCY)":=ROUND(
        //      CurrExchRate.ExchangeAmtFCYToLCY(
        //        TODAY,"Currency Code",
        //        Amount,"Currency Factor"),
        //      GLSetup."Unit-Amount Rounding Precision");
    end;

    local procedure GetCurrency()
    begin
    end;
}

