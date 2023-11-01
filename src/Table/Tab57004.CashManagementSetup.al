#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 57004 "Cash Management Setup"
{

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
        }
        field(2; "Payment Voucher Template"; Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(3; "Imprest Journal Template"; Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(4; "Imprest Surrender Template"; Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(5; "PCASH Journal Template"; Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(6; "Receipt Template"; Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(7; "Post VAT"; Boolean)
        {
        }
        field(8; "Rounding Type"; Option)
        {
            OptionCaption = 'Up,Nearest,Down';
            OptionMembers = Up,Nearest,Down;
        }
        field(9; "Rounding Precision"; Decimal)
        {
        }
        field(10; "Imprest Limit"; Decimal)
        {
        }
        field(11; "Imprest Due Date"; DateFormula)
        {
        }
        field(12; "PV Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(13; "Petty Cash Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(14; "Imprest Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(15; "Current Budget"; Code[20])
        {
            TableRelation = "G/L Budget Name".Name;
        }
        field(16; "Current Budget Start Date"; Date)
        {
        }
        field(17; "Current Budget End Date"; Date)
        {
        }
        field(18; "Imprest Posting Group"; Code[20])
        {
            TableRelation = "Customer Posting Group";
        }
        field(19; "General Bus. Posting Group"; Code[20])
        {
            TableRelation = "Gen. Business Posting Group";
        }
        field(20; "VAT Bus. Posting Group"; Code[20])
        {
            TableRelation = "VAT Business Posting Group";
        }
        field(21; "Check for Committment"; Boolean)
        {
        }
        field(22; "Imprest Memo Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(23; "Imprest Surrender Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(24; "Bank Transfer Nos"; Code[10])
        {
            TableRelation = "No. Series";
        }
        field(25; "Receipt Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(26; "Petty Cash Surrender Template"; Code[20])
        {
            TableRelation = "Gen. Journal Template";
        }
        field(27; "Receipt Batch Name"; Code[20])
        {
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("Receipt Template"));
        }
        field(28; "Prepayment Nos."; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(29; "Prepayment Account"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account";
        }
        field(30; "AIE Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(31; "Payment Schedule Nos"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(32; "Tax Threshhold"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(33; "Tax Rate"; Decimal)
        {
            DataClassification = ToBeClassified;
        }

        field(56000; "PV Journal Template"; Code[10])
        {
            TableRelation = "Gen. Journal Template".Name;
        }
        field(56001; "PV Journal Batch Name"; Code[10])
        {
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("PV Journal Template"));
        }
        field(56002; "PCASH Journal Batch Name"; Code[10])
        {
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("PCASH Journal Template"));
        }
        field(56003; "IMPREST Journal Batch Name"; Code[10])
        {
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("Imprest Journal Template"));
        }
        field(56004; "IMPREST SUR Journal Batch Name"; Code[10])
        {
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("Imprest Surrender Template"));
        }
        field(56005; "Bank TR Journal Template"; Code[10])
        {
            TableRelation = "Gen. Journal Template".Name;
        }
        field(56006; "Bank TR Journal Batch Name"; Code[10])
        {
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("PV Journal Template"));
        }
        field(56007; "Fuel Market Price"; Decimal)
        {
        }
        field(56008; "Imprest Surr Memo Nos"; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(56009; "EFT Header Nos."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(56010; "EFT Details Nos."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(56011; "Staff Claim Nos."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(56012; "Staff Claim Journal Batch Name"; Code[20])
        {
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("Staff Claim Journal Template"));
        }
        field(56013; "Staff Claim Journal Template"; Code[20])
        {
            TableRelation = "Gen. Journal Template".Name;
        }
        field(56014; "Lock Imprest Application"; Boolean)
        {
        }
        field(56015; "Send Email Notification"; Boolean)
        {
        }
        field(56016; "Imprest Email"; Text[100])
        {
        }
        field(56017; "Standing Imprest Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(56018; "Standing Imp Journal Template"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Template".Name;
        }
        field(56019; "StandingImp Journal Batch Name"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("Standing Imp Journal Template"));
        }
        field(56020; "Salary Advance Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(56021; "Salary Adv Journal Template"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Template".Name;
        }
        field(56022; "Salary Adv Journal Batch Name"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("PV Journal Template"));
        }
        field(56024; "Gen. Prod. Posting Group"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Product Posting Group".Code;
        }
        field(56025; "VAT. Prod. Posting Group"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "VAT Product Posting Group";
        }
        field(56026; "Petty Cash Limit"; Decimal)
        {
        }
        field(57000; "PV Reversal Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(57001; "Petty Cash Reversal Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(57002; "Imprest Reversal Nos"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(57003; "Bank Transfer Reversal Nos"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(57004; "Receipt Reversal Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(57005; "Imprest Surrender Reversal Nos"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(57006; "Imprest Surr Memo Reversal Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(57007; "Staff Claim Reversal Nos."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(57008; "Standing Imprest Reversal Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(57009; "Salary Advance Reversal Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(57010; "Standing Imprest Surrender Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(57011; "PV File Numbering"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(57012; "Imp Voucher Journal Template"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Template".Name;
        }
        field(57013; "Imp Voucher Journal Batch Name"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("Imp Voucher Journal Template"));
        }
        field(57014; "Imprest Transport Account"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account";
        }
        field(57015; "Imprest Voucher Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            Enabled = true;
            TableRelation = "No. Series";
        }
        field(57016; "PS Journal Template"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Template".Name;
        }
        field(57017; "PS Journal Batch Name"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("PS Journal Template"));
        }
        field(57018; "Car loan Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(57019; "Warrant Voucher Default Payabl"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account";
        }
        field(57020; "SharePoint Site Main Library"; Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(57021; "SharePoint Document Library"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(57022; "Staff Claims DMS Link"; Text[50])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = URL;
        }
        field(57023; "Imprest Memo DMS Link"; Text[100])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = URL;
        }
        field(57024; "Imprest Requisition DMS Link"; Text[100])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = URL;
        }
        field(57025; "Imprest Surrender DMS Link"; Text[100])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = URL;
        }
        field(57026; "Payment Voucher DMS Link"; Text[100])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = URL;
        }
        field(57027; "Petty Cash Voucher DMS Link"; Text[100])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = URL;
        }
        field(57028; "Petty Cash Surrender DMS Link"; Text[100])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = URL;
        }
        field(57029; "Inter Bank Transfer DMS Link"; Text[100])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = URL;
        }
        field(57030; "Receipts DMS Link"; Text[100])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = URL;
        }
        field(57031; "SharePoint Site Password"; Text[100])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = Masked;
        }
        field(57032; "SharePoint Site Domain Name"; Text[100])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = URL;
        }
        field(57041; "Inter Fund Transfers DMS Link"; Text[100])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = URL;
        }
        field(57042; "Direct Income Voucher DMS Link"; Text[100])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = URL;
        }
        field(57043; "AIE EDMS Link"; Text[100])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = URL;
        }
        field(57044; "SharePoint Site Link"; Text[100])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = URL;
        }
        field(57045; "SharePoint Site UserName"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(57046; "Purchase Requisition Link"; Text[100])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = URL;
        }
        field(57047; "Warrant Voucher Links"; Text[100])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = URL;
        }
        field(57048; "Purchase Invoice Links"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(57049; "Payment Vourcher"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(57050; "Employee Card"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(57051; "Purchase Order"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(57052; "Store Requisition Links"; Text[100])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = URL;
        }
        field(57053; "Leave Applications DMS Link"; Text[100])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = URL;
        }
        field(57054; "Salary Voucher DMS Link"; Text[100])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = URL;
        }
        field(57055; "Salary Advance DMS Link"; Text[100])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = URL;
        }
        field(57056; "Car Loan DMS Link"; Text[100])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = URL;
        }
        field(57057; "Inspection DMS Link"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(57058; "Purchase Order DMS Link"; Text[100])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = URL;
        }
        field(57059; "Direct Procurement DMS Link"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(57060; "Purchase Invoice DMS Link"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(57061; "Student Docs DMS Link"; Text[100])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = URL;
        }
        field(57062; "Petty Cash Surrender Nos"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }
        field(57063; "Car Loan Journal Template"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Template".Name;
        }
        field(57064; "Car Loan Journal Batch Name"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Journal Batch".Name where("Journal Template Name" = field("Car Loan Journal Template"));
        }
        field(57065; "Car Loan Temp Acc"; Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account" where("Direct Posting" = filter(true));
        }
        field(57066; "Student Cases DMS Link"; Text[100])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = URL;
        }
        field(57067; "Daily Work Ticket  DMS Link"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(57068; "Property Reports  DMS Link"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(57069; "Insurance Claim  DMS Link"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(57070; "Gate Pass  DMS Link"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(57071; "Medical Claim  DMS Link"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(57072; "Marker Claim  DMS Link"; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(57073; "Budget Controller Email"; Text[100])
        {
            DataClassification = ToBeClassified;
            ExtendedDatatype = EMail;
        }
    }

    keys
    {
        key(Key1; "Primary Key")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

