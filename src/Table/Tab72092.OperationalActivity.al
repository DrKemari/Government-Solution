#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 72092 "Operational Activity"
{

    fields
    {
        field(1;"Header No";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Entry No";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;"Funding Source";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Funding Source".Code;
        }
        field(4;"Fund Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = ' ,Regular,Carried Over,Revoted,Surplus,Saving';
            OptionMembers = " ",Regular,"Carried Over",Revoted,Surplus,Saving;
        }
        field(5;"Routine Maintenance Amount(LCY";Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                FnGetTotalBudget;
            end;
        }
        field(6;"Periodic Maintenance Amount(LC";Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                FnGetTotalBudget;
            end;
        }
        field(7;"Spot Improvement AMount(LCY)";Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                FnGetTotalBudget;
            end;
        }
        field(8;"Structure Construction";Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                FnGetTotalBudget;
            end;
        }
        field(9;"Rehabilitation Work";Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                FnGetTotalBudget;
            end;
        }
        field(10;"New Construction";Decimal)
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                FnGetTotalBudget;
            end;
        }
        field(11;Year;Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Total Budget(LCY)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Overhead Budget";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Entry No","Header No","Funding Source",Year)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    local procedure FnGetTotalBudget()
    begin
        "Total Budget(LCY)":="Routine Maintenance Amount(LCY"
                            +"Periodic Maintenance Amount(LC"
                            +"Spot Improvement AMount(LCY)"
                            +"Structure Construction"
                            +"Rehabilitation Work"
                            +"New Construction";
    end;
}

