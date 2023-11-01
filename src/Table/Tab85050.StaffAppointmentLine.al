#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 85050 "Staff Appointment Line"
{

    fields
    {
        field(1;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Header No.";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(3;"Role Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Document Type"=filter("Int Examination Appointment")) "Staff Role Codes" where ("Team Type"=filter(Internal))
                            else if ("Document Type"=filter("Ext Examination Appointment")) "Staff Role Codes" where ("Team Type"=filter(External))
                            else if ("Document Type"=filter(Appointment)) "Staff Role Codes"
                            else if ("Document Type"=filter(Termination)) "Staff Role Codes";
        }
        field(4;"Resource No.";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = if ("Document Type"=filter("Int Examination Appointment")) Resource where ("Exam Resorce Type"=filter(Internal))
                            else if ("Document Type"=filter(Appointment)) Resource where ("Exam Resorce Type"=filter(External))
                            else if ("Document Type"=filter("Ext Examination Appointment")) Resource where ("Exam Resorce Type"=filter(External))
                            else if ("Document Type"=filter(Termination)) Resource where ("Exam Resorce Type"=filter(External));

            trigger OnValidate()
            begin
                //check if resource appointed already
                AppointmentHeader.Reset;
                AppointmentHeader.SetRange(Code,"Header No.");
                if AppointmentHeader.FindFirst then  begin
                 // IF AppointmentHeader."Document Type"=AppointmentHeader."Document Type"::Appointment THEN BEGIN
                    StaffAppointmentFunction.Reset;
                    StaffAppointmentFunction.SetRange("Effective Date","Effective Date");
                    StaffAppointmentFunction.SetRange("Resource No.","Resource No.");
                    if not StaffAppointmentFunction.FindSet then begin
                      if Resource.Get("Resource No.") then begin
                      Name:=Resource.Name;
                      Email:=Resource."E-mail Address";
                      "Bank Code":=Resource."Bank Code";
                      "Bank Name":=Resource."Bank Name";
                      "Bank Branch No.":=Resource."Bank Branch No.";
                      "Bank Account No.":=Resource."Bank Branch No.";
                      "Branch Name":=Resource."Branch Name";
                      "M-Pesa Number":=Resource."M-Pesa Number";
                      end
                      end else
                      Error(TXT001,StaffAppointmentFunction.Name,"Effective Date");
                 //END
                end else
                 if Resource.Get("Resource No.") then begin
                      Name:=Resource.Name;
                      Email:=Resource."E-mail Address";
                      "Bank Code":=Resource."Bank Code";
                      "Bank Name":=Resource."Bank Name";
                      "Bank Branch No.":=Resource."Bank Branch No.";
                      "Bank Account No.":=Resource."Bank Branch No.";
                      "Branch Name":=Resource."Branch Name";
                      "M-Pesa Number":=Resource."M-Pesa Number";
                      end
            end;
        }
        field(5;Name;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(6;Email;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Team Leader";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"User ID";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Staff Category";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Management/Executive Staff,Technical Staff,Consultant,Project Mgt Staff,Site/Delivery Staff,Support Staff,Other';
            OptionMembers = "Management/Executive Staff","Technical Staff",Consultant,"Project Mgt Staff","Site/Delivery Staff","Support Staff",Other;
        }
        field(10;Designation;Text[30])
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Effective Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Expiry Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Document Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionCaption = 'Appointment,Termination,Int Examination Appointment,Ext Examination Appointment';
            OptionMembers = Appointment,Termination,"Int Examination Appointment","Ext Examination Appointment";
        }
        field(14;"Bank Name";Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(15;"Branch Name";Text[100])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(16;"Bank Branch No.";Text[20])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Employee Bank AccountX"."Bank Branch No.";

            trigger OnValidate()
            begin
                EmployeeBankAccountX.Reset;
                EmployeeBankAccountX.SetRange("Bank Branch No.","Bank Branch No.");
                if EmployeeBankAccountX.FindSet then begin
                  "Branch Name":=EmployeeBankAccountX."Branch Name";
                end;
            end;
        }
        field(17;"Bank Account No.";Text[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(18;"Bank Code";Code[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
            TableRelation = "Employee Bank AccountX";

            trigger OnValidate()
            begin
                EmployeeBankAccountX.Reset;
                EmployeeBankAccountX.SetRange(Code,"Bank Code");
                if EmployeeBankAccountX.FindSet then begin
                  "Bank Name":=EmployeeBankAccountX."Bank Name";
                end;
            end;
        }
        field(19;"M-Pesa Number";Text[30])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(20;"Paper Code";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = Papers;

            trigger OnValidate()
            var
                Papers: Record Papers;
            begin
                Papers.Reset;
                Papers.SetRange(Code,"Paper Code");
                if Papers.FindFirst then begin
                  "Paper Name":=Papers.Description;
                 end
            end;
        }
        field(21;"Paper Name";Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Line No.","Header No.","Document Type")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Resource: Record Resource;
        StaffAppointmentFunction: Record "Staff Appointment Function";
        TXT001: label 'The resource %1,has an appointment with the same Effective date %2';
        AppointmentHeader: Record "Appointment Header";
        EmployeeBankAccountX: Record "Employee Bank AccountX";
        Papers: Record Papers;
}

