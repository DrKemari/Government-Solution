#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 50023 "Pos Posting Setup"
{

    fields
    {
        field(1;"Receipt Category";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Pos Receipt Categories".code;

            trigger OnValidate()
            begin
                PosReceiptCategories.Reset;
                PosReceiptCategories.SetRange(code,"Receipt Category");
                if PosReceiptCategories.FindSet then begin
                  "Receipt Category Description":=PosReceiptCategories.description;
                  end;
            end;
        }
        field(3;"Account Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner,Employee';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Employee;
        }
        field(4;"Account No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Account Type"=const("G/L Account")) "G/L Account"
                            else if ("Account Type"=const(Customer)) Customer
                            else if ("Account Type"=const(Vendor)) Vendor
                            else if ("Account Type"=const("Fixed Asset")) "Fixed Asset"
                            else if ("Account Type"=const("Bank Account")) "Bank Account"
                            else if ("Account Type"=const(Employee)) Employee;

            trigger OnValidate()
            begin

                case "Account Type" of
                 "account type"::"G/L Account":
                  begin
                   if GLAccount.Get("Account No.") then
                      "Account Name":=GLAccount.Name;
                  end;
                  "account type"::Customer:
                  begin
                  if Cust.Get("Account No.") then
                     "Account Name":=Cust.Name;
                  end;
                  "account type"::Vendor:
                  begin
                   if Vendor.Get("Account No.") then
                      "Account Name":=Vendor.Name;
                   end;
                   "account type"::Employee:
                  begin
                   if Emp.Get("Account No.") then
                      "Account Name":=Emp.FullName;
                   end;
                 end;
            end;
        }
        field(5;"Account Name";Text[70])
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Bal Account Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'G/L Account,Customer,Vendor,Bank Account,Fixed Asset,IC Partner,Employee';
            OptionMembers = "G/L Account",Customer,Vendor,"Bank Account","Fixed Asset","IC Partner",Employee;
        }
        field(7;"Bal Account No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Bal Account Type"=const("G/L Account")) "G/L Account"
                            else if ("Bal Account Type"=const(Customer)) Customer
                            else if ("Bal Account Type"=const(Vendor)) Vendor
                            else if ("Bal Account Type"=const("Fixed Asset")) "Fixed Asset"
                            else if ("Bal Account Type"=const("Bank Account")) "Bank Account"
                            else if ("Bal Account Type"=const(Employee)) Employee;

            trigger OnValidate()
            begin

                case "Bal Account Type" of
                 "account type"::"G/L Account":
                  begin
                   if GLAccount.Get("Bal Account No.") then
                      "Bal Account Name":=GLAccount.Name;
                  end;
                     "bal account type"::Customer:
                  begin
                  if Cust.Get("Bal Account No.") then
                     "Bal Account Name":=Cust.Name;
                  end;
                    "bal account type"::Vendor:
                  begin
                   if Vendor.Get("Bal Account No.") then
                     "Bal Account Name":=Vendor.Name;
                   end;
                   "bal account type"::Employee:
                  begin
                  if Emp.Get("Bal Account No.") then
                   "Bal Account Name":=Emp.FullName;
                  end;
                  "account type"::"Bank Account":
                  begin
                   if BankAccount.Get("Bal Account No.") then
                      "Bal Account Name":=BankAccount.Name;
                  end;
                end;
            end;
        }
        field(8;"Bal Account Name";Text[70])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Receipt Category Description";Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Receipt Category")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        GLAccount: Record "G/L Account";
        Cust: Record Customer;
        Vendor: Record Vendor;
        FixedAsset: Record "Fixed Asset";
        BankAccount: Record "Bank Account";
        Amt: Decimal;
        CustLedger: Record "Cust. Ledger Entry";
        CustLedger1: Record "Cust. Ledger Entry";
        VATAmount: Decimal;
        "W/TAmount": Decimal;
        VATSetup: Record "VAT Posting Setup";
        NetAmount: Decimal;
        VATEntry: Record "VAT Entry";
        CSetup: Record "Cash Management Setup";
        Direction: Text[30];
        Customer: Record Customer;
        ApplyCustEntries: Page "Apply Customer Entries";
        PostedInvLines: Record "Sales Invoice Line";
        ReceiptHeader: Record "Receipts Header1";
        Currency: Record Currency;
        CurrExchRate: Record "Currency Exchange Rate";
        DimMgt: Codeunit DimensionManagement;
        DimValue: Record "Dimension Value";
        VendLedger: Record "Vendor Ledger Entry";
        VendLedger1: Record "Vendor Ledger Entry";
        Employee: Record Employee;
        Employee1: Record "Employee Ledger Entry";
        EmployeeDet: Record "Employee Ledger Entry";
        Emp: Record Employee;
        PosReceiptCategories: Record "Pos Receipt Categories";
}

