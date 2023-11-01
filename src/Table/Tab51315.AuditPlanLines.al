#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 51315 "Audit Plan Lines"
{
    DrillDownPageID = "Audit Planning Lines";
    LookupPageID = "Audit Planning Lines";

    fields
    {
        field(1;"Audit Plan Header";Code[30])
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
            OptionCaption = 'Institution Quality Audit,Course Quality Audit';
            OptionMembers = "Institution Quality Audit","Course Quality Audit";
        }
        field(4;Description;Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(5;"Institution/Programme ID";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Task Type"=filter("Institution Quality Audit")) Customer
                            else if ("Task Type"=filter("Course Quality Audit")) Courses;

            trigger OnValidate()
            var
                Courses: Record Courses;
            begin
                if "Task Type"="task type"::"Institution Quality Audit" then begin
                  Customer.Reset;
                  Customer.SetRange("No.","Institution/Programme ID");
                    if Customer.FindFirst then begin
                      Description:=Customer.Name+' '+Format("Task Type");
                      "Institution Name":=Customer.Name;
                  "Institution Email":=Customer."E-Mail";
                  "Institution Code":=Customer."No.";
                    end;


                  end;

                  if "Task Type"="task type"::"Course Quality Audit" then begin
                  Courses.Reset;
                  Courses.SetRange(Code,"Institution/Programme ID");
                    if Courses.FindFirst then begin
                      Description:=Courses.Description+' '+Format("Task Type");
                      "Programme Name":=Courses.Description;

                    end;
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
        field(10;"Audit Requisition No.";Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11;"Planned Budget";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Actual Cost";Decimal)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(13;"Actual Start Date";Date)
        {
            Editable = false;
        }
        field(14;"Actual End Date";Date)
        {
            Editable = false;
        }
        field(15;"Institution Name";Text[250])
        {
        }
        field(16;"Institution Email";Text[100])
        {
            Editable = false;
        }
        field(17;"Institution Code";Code[30])
        {
            Editable = false;
            TableRelation = Customer;

            trigger OnValidate()
            begin

                Customer.Reset;
                Customer.SetRange("No.","Institution Code");
                if Customer.FindFirst then begin
                   "Institution Name":=Customer.Name;
                  "Institution Email":=Customer."E-Mail";
                  "Institution Code":=Customer."No.";
                end;
            end;
        }
        field(18;"Domain Code";Code[30])
        {
            Editable = false;
        }
        field(19;"Domain Name";Text[50])
        {
            Editable = false;
        }
        field(20;"Programme Name";Text[50])
        {
            Editable = false;
        }
    }

    keys
    {
        key(Key1;"Audit Plan Header","Line No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
        fieldgroup(DropDown;Description,"Officer Name")
        {
        }
    }

    var
        Employee: Record Employee;
        Customer: Record Customer;
}

