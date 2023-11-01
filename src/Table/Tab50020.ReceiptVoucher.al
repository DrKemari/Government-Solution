#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50020 "Receipt Voucher"
{
    DrillDownPageID = "Payroll Processing List";
    LookupPageID = "Payroll Processing List";

    fields
    {
        field(1;"No.";Code[30])
        {
            Editable = false;

            trigger OnValidate()
            begin


                if "No."<> xRec."No." then begin
                NoSetup.Get;
                NoSeriesMgt.TestManual(NoSetup."Salary Voucher Nos");
                "No. Series" := '';
                end;
            end;
        }
        field(2;"Document Date";Date)
        {
        }
        field(9;Posted;Boolean)
        {
        }
        field(10;"No. Series";Code[20])
        {
            Description = 'Stores the number series in the database';
        }
        field(13;Status;Option)
        {
            Editable = true;
            OptionCaption = 'Open,Pending Approval,Pending Prepayment,Released,Rejected';
            OptionMembers = Open,"Pending Approval","Pending Prepayment",Released,Rejected;
        }
        field(14;"Posted By";Code[100])
        {
        }
        field(15;"Time Posted";Time)
        {
        }
        field(16;Description;Text[50])
        {
        }
        field(39;"Acitvity Code";Code[10])
        {
            Editable = false;
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(1));
        }
        field(40;"Branch Code";Code[10])
        {
            Editable = false;
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(2));
        }
        field(42;"Global Dimension 1 Code";Code[20])
        {
            CaptionClass = '1,1,1';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(1));
        }
        field(43;"Global Dimension 2 Code";Code[20])
        {
            CaptionClass = '1,1,2';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(2));
        }
        field(44;"Shortcut Dimension 1 Code";Code[20])
        {
            CaptionClass = '1,2,1';
            Caption = 'Shortcut Dimension 1 Code';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(1));

            trigger OnValidate()
            begin
                TestField(Status,Status::Open);
                ValidateShortcutDimCode(1,"Shortcut Dimension 1 Code");
            end;
        }
        field(45;"Shortcut Dimension 2 Code";Code[20])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(2));

            trigger OnValidate()
            begin
                TestField(Status,Status::Open);
                ValidateShortcutDimCode(2,"Shortcut Dimension 2 Code");
                  //loans.setCurrentKey("Shortcut Dimension 2 Code");
                  //loans.GET("Shortcut Dimension 2 Code");
                  //custno:=loans."Client Code";
                 // message('%1',custno);
                // message('%1',"Loan No.");
                TestField(Status,Status::Open);
            end;
        }
        field(480;"Dimension Set ID";Integer)
        {
            Caption = 'Dimension Set ID';
            Editable = false;
            TableRelation = "Dimension Set Entry";

            trigger OnLookup()
            begin
                //ShowDimensions;

                ShowDocDim;
            end;
        }
        field(481;"Document Type";Option)
        {
            OptionCaption = 'Contribution,Transfer-Ins,Interest,Payroll';
            OptionMembers = Contribution,"Transfer-Ins",Interest,Payroll;
        }
        field(482;"Channel ID";Code[30])
        {
            TableRelation = "Salesperson/Purchaser".Code;
        }
        field(484;Currency;Code[30])
        {
            TableRelation = Currency;
        }
        field(485;"Created By";Code[100])
        {
        }
        field(486;"Date Created";Date)
        {
        }
        field(487;"Time Created";Time)
        {
        }
        field(488;"Date Filter";Date)
        {
            FieldClass = FlowFilter;
        }
        field(489;Type;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Consolidated,Split';
            OptionMembers = Consolidated,Split;
        }
        field(490;"Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(491;"End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(492;"Currency Code";Code[10])
        {
            Caption = 'Currency Code';
            DataClassification = ToBeClassified;
            TableRelation = "Pos- nav Currency Relation";

            trigger OnValidate()
            begin
                //UpdateCurrencyId;
            end;
        }
        field(493;"Bank Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Bank Account"."No.";
        }
        field(494;"Payment Modes";Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Payment Modes".Code;

            trigger OnValidate()
            begin
                if PaymentModes.Get("Payment Modes") then begin
                  "Bank Code":=PaymentModes."Related Bank";
                end;
            end;
        }
        field(495;"Date Posted";Date)
        {
            DataClassification = ToBeClassified;
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


        if "No." = '' then begin
          NoSetup.Get;
          NoSetup.TestField(NoSetup."Salary Voucher Nos");
          NoSeriesMgt.InitSeries(NoSetup."Salary Voucher Nos",xRec."No. Series",0D,"No.","No. Series");
        end;


         GenLedgerSetup.Get;
        "Shortcut Dimension 1 Code":=GenLedgerSetup."Global Dimension 1 Code";
        "Shortcut Dimension 2 Code":=GenLedgerSetup."Global Dimension 2 Code";
        "Document Date":=Today;
        "Created By":=UserId;
        "Date Created":=Today;
        "Time Created":=Time;
    end;

    var
        CUST: Record Customer;
        Receipt: Record "Receipts Header1";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        UserSetup: Record "User Setup";
        NoSetup: Record "Human Resources Setup";
        DimMgt: Codeunit DimensionManagement;
        GenLedgerSetup: Record "General Ledger Setup";
        PayPeriod: Record "Payroll PeriodX";
        PaymentModes: Record "Payment Modes";


    procedure ShowDocDim()
    var
        OldDimSetID: Integer;
    begin

        OldDimSetID := "Dimension Set ID";
      //  "Dimension Set ID" :=
        //   DimMgt.EditDimensionSet2(
        //     "Dimension Set ID",StrSubstNo('%1 %2',"Document Type","No."),
        //     "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");
        if OldDimSetID <> "Dimension Set ID" then begin
          Modify;
          if PurchLinesExist then
            UpdateAllLineDim("Dimension Set ID",OldDimSetID);
        end;
    end;

    local procedure UpdateAllLineDim(NewParentDimSetID: Integer;OldParentDimSetID: Integer)
    var
        NewDimSetID: Integer;
    begin
        /*// Update all lines with changed dimensions.
        
        IF NewParentDimSetID = OldParentDimSetID THEN
          EXIT;
        IF NOT CONFIRM(Text051) THEN
          EXIT;
        
        PurchLine.RESET;
        PurchLine.SETRANGE("Document Type","Document Type");
        PurchLine.SETRANGE("No.","No.");
        PurchLine.LOCKTABLE;
        IF PurchLine.FIND('-') THEN
          REPEAT
            NewDimSetID := DimMgt.GetDeltaDimSetID(PurchLine."Dimension Set ID",NewParentDimSetID,OldParentDimSetID);
            IF PurchLine."Dimension Set ID" <> NewDimSetID THEN BEGIN
              PurchLine."Dimension Set ID" := NewDimSetID;
              DimMgt.UpdateGlobalDimFromDimSetID(
                PurchLine."Dimension Set ID",PurchLine."Shortcut Dimension 1 Code",PurchLine."Shortcut Dimension 2 Code");
              PurchLine.MODIFY;
            END;
          UNTIL PurchLine.NEXT = 0;
          */

    end;


    procedure ValidateShortcutDimCode(FieldNumber: Integer;var ShortcutDimCode: Code[20])
    var
        OldDimSetID: Integer;
    begin


        OldDimSetID := "Dimension Set ID";
        DimMgt.ValidateShortcutDimValues(FieldNumber,ShortcutDimCode,"Dimension Set ID");
        if "No." <> '' then
          Modify;

        if OldDimSetID <> "Dimension Set ID" then begin
          Modify;
          if PurchLinesExist then
            UpdateAllLineDim("Dimension Set ID",OldDimSetID);
        end;
    end;


    procedure PurchLinesExist(): Boolean
    begin
        /*PurchLine.RESET;
        PurchLine.SETRANGE("Document Type","Document Type");
        PurchLine.SETRANGE("No.","No.");
        EXIT(PurchLine.FINDFIRST);
        */

    end;
}

