#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 57100 "Budget Reallocation Header"
{
    DrillDownPageID = "Budget Reallocations";
    LookupPageID = "Budget Reallocations";

    fields
    {
        field(1;"Document No";Code[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2;"Budget Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Budget Name".Name;
        }
        field(3;Description;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Created On";DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Created By";Code[200])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "User Setup";
        }
        field(6;"Approval Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'New,Approval Pending,Approved';
            OptionMembers = New,"Approval Pending",Approved;
        }
        field(7;Posted;Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(8;"Entry Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Re-Allocation,Addition,Reduction';
            OptionMembers = "Re-Allocation",Addition,Reduction;
        }
        field(9;"Net Amount";Decimal)
        {
            CalcFormula = sum("Budget Modification Lines".Amount where ("Document No"=field("Document No")));
            Editable = false;
            FieldClass = FlowField;
        }
    }

    keys
    {
        key(Key1;"Document No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        GeneralLedgerSetup.Get;
        GeneralLedgerSetup.TestField("Budget Reallocation Nos.");
        "Document No":=NoSeriesManagement.GetNextNo(GeneralLedgerSetup."Budget Reallocation Nos.",Today,true);
        "Created By":=UserId;
        "Created On":=CreateDatetime(Today,Time);
    end;

    var
        GeneralLedgerSetup: Record "General Ledger Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
}

