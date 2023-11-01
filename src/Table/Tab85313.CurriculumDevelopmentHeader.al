#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85313 "Curriculum Development Header"
{
    DrillDownPageID = "Syllabus Development Plans";
    LookupPageID = "Syllabus Development Plans";

    fields
    {
        field(1;"Code";Code[30])
        {
            DataClassification = ToBeClassified;
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
        field(13;"No. of Minor Review Projects";Integer)
        {
            CalcFormula = count("Development Plan Lines" where ("Task Type"=filter("Minor Review")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(14;"No. of Major Review Projects";Integer)
        {
            CalcFormula = count("Development Plan Lines" where ("Task Type"=filter("Major Review")));
            Editable = false;
            FieldClass = FlowField;
        }
        field(15;"No. of New Syllabus Projects";Integer)
        {
            CalcFormula = count("Development Plan Lines" where ("Task Type"=filter("New Syllabus")));
            Editable = false;
            FieldClass = FlowField;
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
        "Created By":=UserId;
        "Created On":=CurrentDatetime;
        "Document Date":=Today;
    end;

    var
        Employee: Record Employee;
}

