#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85314 "Development Plan Lines"
{
    DrillDownPageID = "Curriculum Plan Lines";
    LookupPageID = "Curriculum Plan Lines";

    fields
    {
        field(1;"Development Header";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(3;"Task Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'New Syllabus,Minor Review,Major Review';
            OptionMembers = "New Syllabus","Minor Review","Major Review";
        }
        field(4;Description;Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Syllabus ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Task Type"=filter("Minor Review")) "Syllabus Header"
                            else if ("Task Type"=filter("Major Review")) "Syllabus Header";

            trigger OnValidate()
            begin
                SyllabusHeader.Reset;
                SyllabusHeader.SetRange(Code,"Syllabus ID");
                if  SyllabusHeader.FindFirst then begin
                  Description:=Format("Task Type")+' '+SyllabusHeader.Description;
                  end
            end;
        }
        field(6;"Planning Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Planning End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Responsible Officer";Code[30])
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
        field(9;"Officer Name";Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10;"Review Requisition No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Planned Budget";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Actual Cost";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Development Header","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown;"Syllabus ID",Description,"Officer Name")
        {
        }
    }

    var
        SyllabusHeader: Record "Syllabus Header";
        Employee: Record Employee;
}

