table 50032 "Customer Ticked"
{
    // version NAVW17.10

    Caption = 'Customer';

    fields
    {
        field(1; "No."; Code[70])
        {
            Caption = 'No.';
        }
        field(2; Name; Text[150])
        {
            Caption = 'Name';

            trigger OnValidate();
            begin
                IF ("Search Name" = UPPERCASE(xRec.Name)) OR ("Search Name" = '') THEN
                    "Search Name" := Name;
            end;
        }
        field(3; "Search Name"; Code[80])
        {
            Caption = 'Search Name';
        }
        field(4; "Name 2"; Text[80])
        {
            Caption = 'Name 2';
        }
        field(5; Address; Text[100])
        {
            Caption = 'Address';
        }
        field(6; "Address 2"; Text[50])
        {
            Caption = 'Address 2';
        }
        field(7; City; Text[30])
        {
            Caption = 'City';

            trigger OnValidate();
            begin
                //PostCode.ValidateCity(City,"Post Code",County,"Country/Region Code",(CurrFieldNo <> 0) AND GUIALLOWED);
            end;
        }
        field(8; Contact; Text[50])
        {
            Caption = 'Contact';
        }
        field(9; "Phone No."; Text[100])
        {
            Caption = 'Phone No.';
        }
        field(10; "Telex No."; Text[40])
        {
            Caption = 'Telex No.';
        }
        field(14; "Our Account No."; Text[40])
        {
            Caption = 'Our Account No.';
        }
        field(15; "Customer Posting Group"; Code[20])
        {
            Caption = 'Territory Code';
        }
        field(18; "Gen. Bus. Posting Group"; Code[20])
        {
        }
        field(50001; "Last Date Modified"; Date)
        {
        }
        field(50002; "E-Mail"; Text[30])
        {
        }
        field(50003; "Service Type"; Code[50])
        {
        }
        field(50004; "PIN No."; Code[30])
        {
        }
        field(50005; DateOfIncorporation; Date)
        {
        }
        field(50006; CountyID; Integer)
        {
            Enabled = false;
        }
        field(50007; UserID; Integer)
        {
        }
        field(50009; RegistrationDate; Date)
        {
        }
        field(50033; "Customer Type"; Option)
        {
            OptionCaption = '" ,Trade,Imprest,Petty Cash,Expert"';
            OptionMembers = " ",Trade,Imprest,"Petty Cash",Expert;
        }
        field(50102; "County/Region"; Boolean)
        {
        }
        field(50103; PIN; Text[30])
        {
            NotBlank = true;
        }
    }

    keys
    {
        key(Key1; "No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    var
        CampaignTargetGr: Record 7030;
        ContactBusRel: Record 5054;
        Job: Record 167;
        //DOPaymentCreditCard : Record 827;
        CampaignTargetGrMgmt: Codeunit 7030;
        StdCustSalesCode: Record "Standard Customer Sales Code";
    begin
    end;

    trigger OnRename();
    begin
        "Last Date Modified" := TODAY;
    end;
}

