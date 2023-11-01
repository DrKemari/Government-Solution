#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85450 "Exam Audit Plan"
{

    fields
    {
        field(1;"Audit Plan ID";Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Document Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(3;"Year Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Financial Year Code".Code;

            trigger OnValidate()
            begin
                FinancialYearCode.Reset;
                FinancialYearCode.SetRange(Code,"Year Code");
                if FinancialYearCode.FindSet then
                  begin
                    "Planning Start Date":=FinancialYearCode."Starting Date";
                    "Planning End Date":=FinancialYearCode."Ending Date";
                    end;
                Description:=UpperCase(COMPANYNAME)+' '+"Year Code"+' '+ 'Examination Assurance Plan';
            end;
        }
        field(4;"Planning Start Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5;"Planning End Date";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(6;"Corporate Strategic Plan ID";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Corporate Strategic Plans".Code;
        }
        field(7;"Budget Code";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Job."No.";

            trigger OnValidate()
            begin
                Job.Reset;
                Job.SetRange("No.","Budget Code");
                if Job.FindSet then begin
                  "Budget Name":=Job.Description;
                  end;
            end;
        }
        field(8;"Budget Name";Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9;Description;Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Overall Purpose";Text[2048])
        {
            DataClassification = ToBeClassified;
        }
        field(11;Blocked;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"No. of Planned Processes";Integer)
        {
            CalcFormula = count("Exam Audit Lines" where ("Audit Plan ID"=field("Audit Plan ID")));
            Description = 'No. of Planned Processes';
            Editable = false;
            FieldClass = FlowField;
        }
        field(13;Status;Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = ' ,Open,Pending Approval,Released,Closed';
            OptionMembers = " ",Open,"Pending Approval",Released,Closed;
        }
        field(14;"Created By";Code[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(15;"Created Datetime";DateTime)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16;"Dimension Set ID";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(17;"No. Series";Code[20])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Audit Plan ID")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        "Created By":=UserId;
        "Created Datetime":=CurrentDatetime;
    end;

    var
        FinancialYearCode: Record "Financial Year Code";
        Job: Record Job;
        AuditAssuranceSetup: Record "Audit & Assurance Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
}

