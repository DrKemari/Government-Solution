#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69194 "Training Needs Header"
{

    fields
    {
        field(1;"Code";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(2;"Employee No";Code[30])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if Employee.Get("Employee No") then begin
                  "Employee Name":=Employee."First Name"+' '+Employee."Middle Name"+' '+Employee."Last Name";
                  Employee.CalcFields("Department Name");
                  Department:=Employee."Department Name";
                  "Date of First Appointment":=Employee."Date Of Join";
                  CompanyPositions.Reset;
                  CompanyPositions.SetRange("Position ID",Employee."Current Position ID");
                  if CompanyPositions.FindFirst then begin
                    "Job Title":=CompanyPositions."Job Title";
                  end;
                  Disabled:=Employee.Disabled;
                  end
            end;
        }
        field(3;"Employee Name";Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(4;"Created By";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(5;"Created On";DateTime)
        {
            DataClassification = ToBeClassified;
        }
        field(6;Description;Text[60])
        {
            DataClassification = ToBeClassified;
        }
        field(7;"No Series";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(8;Department;Text[50])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(9;"Job Title";Text[60])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(10;Disabled;Boolean)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(11;"Date of First Appointment";Date)
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(12;"Training Plan No";Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Training Plan Header".No;
        }
        field(13;Status;Option)
        {
            DataClassification = ToBeClassified;
            Editable = false;
            OptionCaption = 'Open,Pending Approval,Released';
            OptionMembers = Open,"Pending Approval",Released;
        }
        field(14;Posted;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(15;"Posted By";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Posted On";DateTime)
        {
            DataClassification = ToBeClassified;
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
        if Code = '' then begin
             HRSetup.Get;
             HRSetup.TestField(HRSetup."Training Request Nos");
             NoSeriesMgt.InitSeries(HRSetup."Training Request Nos",xRec."No Series",0D,Code,"No Series");
        end;

         "Created By":=UserId;
         "Created On":=CurrentDatetime;
         UserSetup.Reset;
         UserSetup.SetRange("User ID",UserId);
         if UserSetup.FindFirst then begin
           "Employee No":=UserSetup."Employee No.";
           Validate("Employee No");
           "Employee Name":=UserSetup."Employee Name";
          end
    end;

    var
        HRSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        UserSetup: Record "User Setup";
        Employee: Record Employee;
        CompanyPositions: Record "Company Positions";
}

