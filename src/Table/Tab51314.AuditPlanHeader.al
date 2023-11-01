#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51314 "Audit Plan Header"
{

    fields
    {
        field(1;"Code";Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(2;Description;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"External Document No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Document Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5;"Created By";Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6;"Created On";DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7;"Planning Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Planning End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Responsible Officer";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee;

            trigger OnValidate()
            begin
                Employee.Reset;
                Employee.SetRange("No.","Responsible Officer");
                if Employee.FindFirst then begin
                  "Officer Name":=Employee."First Name"+' '+Employee."Middle Name"+' '+Employee."Last Name";
                  end
            end;
        }
        field(10;"Officer Name";Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11;"Approval Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(12;"Document Status";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Active,Blocked';
            OptionMembers = Active,Blocked;
        }
        field(13;"No. of Course Quality Audit";Integer)
        {
            CalcFormula = count("Audit Plan Lines" where ("Task Type"=filter("Course Quality Audit")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(14;"No. of Inst. Quality Audit";Integer)
        {
            CalcFormula = count("Audit Plan Lines" where ("Task Type"=filter("Institution Quality Audit")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(15;"Total Planned Budget";Decimal)
        {
            CalcFormula = sum("Audit Plan Lines"."Planned Budget");
            Editable = false;
            FieldClass = FlowField;
        }
        field(16;"No. Series";Code[10])
        {
        }
        field(17;"Document Type";Option)
        {
            OptionCaption = 'Programme,Institution,Consolidated';
            OptionMembers = Programme,Institution,Consolidated;
        }
    }

    keys
    {
        key(Key1;"Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        QualityAuditSetup.Get;
        QualityAuditSetup.TestField("Audit Plan Nos.");
         if Code=''  then begin
               NoSeriesMgt.InitSeries(QualityAuditSetup."Audit Plan Nos.",xRec."No. Series",0D,Code,"No. Series");
        "Document Date":=Today;
        "Created By":=UserId;
        "Created On":=CurrentDatetime;
        end
    end;

    var
        Employee: Record Employee;
        QualityAuditSetup: Record "Quality Audit Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}

