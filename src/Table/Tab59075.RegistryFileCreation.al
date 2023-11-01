#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 59075 "Registry File Creation"
{

    fields
    {
        field(1;"File No";Code[50])
        {
            Caption = 'Registry No';
            DataClassification = ToBeClassified;
        }
        field(2;"File Name";Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"File Type";Text[250])
        {
            DataClassification = ToBeClassified;
            TableRelation = "File Types SetUp";
        }
        field(4;Description;Text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Creation Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(6;"Created By";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Division/Unit";Text[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where ("Operating Unit Type"=const("Department/Center"));

            trigger OnValidate()
            begin
                ResponsibilityCenter.Reset;
                ResponsibilityCenter.SetRange(Code,"Division/Unit");
                if ResponsibilityCenter.FindSet then
                  "Division/Unit Name":=ResponsibilityCenter.Name;
            end;
        }
        field(8;"System No";Code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Sub Division";Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where ("Operating Unit Type"=const("Division/Section"));

            trigger OnValidate()
            begin
                ResponsibilityCenter.Reset;
                ResponsibilityCenter.SetRange(Code,"Sub Division");
                if ResponsibilityCenter.FindSet then
                  "Sub Division Name":=ResponsibilityCenter.Name;
            end;
        }
        field(10;Custody;Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                Employee.Reset;
                Employee.SetRange("No.",Custody);
                if Employee.FindSet then
                  "Employee Name":=Employee."First Name"+' '+Employee."Last Name";
            end;
        }
        field(11;Directorate;Code[10])
        {
            Caption = 'CEO Office';
            DataClassification = ToBeClassified;
            TableRelation = "Responsibility Center".Code where ("Operating Unit Type"=const(Directorate));

            trigger OnValidate()
            begin
                ResponsibilityCenter.Reset;
                ResponsibilityCenter.SetRange(Code,Directorate);
                if ResponsibilityCenter.FindSet then
                  "Directorate Name":=ResponsibilityCenter.Name;
            end;
        }
        field(12;Confidential;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Sub Division Name";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Division/Unit Name";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Directorate Name";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Employee Name";Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(17;"No. Series";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(18;"File Status";Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Available,unavailable';
            OptionMembers = " ",Available,unavailable;
        }
        field(19;Status;Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Current,Semi-Current,Non-Current';
            OptionMembers = Current,"Semi-Current","Non-Current";
        }
        field(20;Disposed;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(21;"Disposed By";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(22;"Disposed Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(23;"Disposed Time";Time)
        {
            DataClassification = ToBeClassified;
        }
        field(24;"Retention Period";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(25;"Issuance Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Issued,Archived';
            OptionMembers = Open,Issued,Archived;
        }
    }

    keys
    {
        key(Key1;"File No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    var
        "No.": Code[50];
    begin
        if "File No" = '' then begin
           GenLedgerSetup.Get;
            GenLedgerSetup.TestField(GenLedgerSetup."File No. Series");
          NoSeriesMgt.InitSeries(GenLedgerSetup."File No. Series",xRec."No. Series",0D,"File No","No. Series");
        end;
    end;

    var
        ResponsibilityCenter: Record "Responsibility Center";
        Employee: Record Employee;
        GenLedgerSetup: Record "File Locations Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        FileMovementHeader: Record "File Movement Header";
}

