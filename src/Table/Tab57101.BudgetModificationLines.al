#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 57101 "Budget Modification Lines"
{

    fields
    {
        field(1;"Document No";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"G/L Account No";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account"."No.";

            trigger OnValidate()
            begin
                if GLAccount.Get("G/L Account No") then
                  "G/L Account Name":=GLAccount.Name;
                Validate("New Balance");
            end;
        }
        field(3;"G/L Account Name";Text[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(4;"Global Dimension 1 Code";Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(1));
        }
        field(5;"Global Dimension 2 Code";Code[20])
        {
            CaptionClass = '1,1,2';
            Caption = 'Global Dimension 2 Code';
            DataClassification = ToBeClassified;
            TableRelation = "Dimension Value".Code where ("Global Dimension No."=const(2));
        }
        field(480;"Dimension Set ID";Integer)
        {
            Caption = 'Dimension Set ID';
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Dimension Set Entry";
        }
        field(481;"Budget Name";Code[10])
        {
            CalcFormula = lookup("Budget Reallocation Header"."Budget Code" where ("Document No"=field("Document No")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(482;"Current Balance";Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(483;Amount;Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                Validate("New Balance");
            end;
        }
        field(484;"New Balance";Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;

            trigger OnValidate()
            var
                GLBudgetEntry: Record "G/L Budget Entry";
            begin
                CalcFields("Budget Name");
                GLBudgetEntry.Reset;
                GLBudgetEntry.SetRange("Budget Name","Budget Name");
                GLBudgetEntry.SetRange("G/L Account No.","G/L Account No");
                GLBudgetEntry.SetRange("Global Dimension 1","Global Dimension 1 Code");
                GLBudgetEntry.SetRange("Global Dimension 2","Global Dimension 2 Code");
                if GLBudgetEntry.FindSet then begin
                  GLBudgetEntry.CalcSums(Amount);
                  "Current Balance":=GLBudgetEntry.Amount;
                end;
                "New Balance":="Current Balance"+Amount;
            end;
        }
        field(485;"Line No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(486;"Posting Date";Date)
        {
            Caption = 'Date';
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Document No","G/L Account No","Line No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        GLAccount: Record "G/L Account";
}

