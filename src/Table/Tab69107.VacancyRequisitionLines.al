#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69107 "Vacancy Requisition Lines"
{

    fields
    {
        field(1;"Line No.";Integer)
        {
            AutoIncrement = true;
            DataClassification = ToBeClassified;
        }
        field(2;"Requisition No.";Code[30])
        {
            DataClassification = ToBeClassified;

            trigger OnValidate()
            begin
                if VacancyRequisitionsTable.Get("Requisition No.") then
                   "Manpower Plan ID":=VacancyRequisitionsTable."Manpower Plan ID";
            end;
        }
        field(3;"Job Id";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "ManPower Planning Lines"."Job Id" where ("Responsibility Center Code"=field("Responsibility Center"));

            trigger OnValidate()
            begin
                VacancyRequisitionsTable.Reset;
                VacancyRequisitionsTable.SetRange("No.","Requisition No.");
                if VacancyRequisitionsTable.FindSet then begin
                    ManpowerPlanCode:=VacancyRequisitionsTable."Manpower Plan ID";
                    ManPowerPlanningLines.Reset;
                    ManPowerPlanningLines.SetRange("Manpower Plan Code",ManpowerPlanCode);
                    CalcFields("Responsibility Center");
                    ManPowerPlanningLines.SetRange("Responsibility Center Code","Responsibility Center");
                    ManPowerPlanningLines.SetRange("Job Id","Job Id");
                    if ManPowerPlanningLines.FindSet then begin

                      "Planned Qty":=ManPowerPlanningLines."Target No."

                   end;
                end
            end;
        }
        field(4;"Job Description";Text[100])
        {
            CalcFormula = lookup(Positions."Job Description" where ("Job ID"=field("Job Id")));
            FieldClass = FlowField;
        }
        field(5;"Responsibility Center";Code[30])
        {
            CalcFormula = lookup("Vacancy  Requisitions Table"."Department Code" where ("No."=field("Requisition No.")));
            FieldClass = FlowField;
        }
        field(6;"Planned Qty";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(7;"Requested Qty";Integer)
        {
            DataClassification = ToBeClassified;
        }
        field(8;"Planned Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(9;"Planned End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(10;"Actual Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(11;"Actual End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(12;"Applications End Time";Time)
        {
            DataClassification = ToBeClassified;
        }
        field(13;"Applications End Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(14;"Applications Start Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(15;Advertise;Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(16;"Advertised By";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(17;"Advertised Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(18;"Requisition Type";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Internal,External,Open;
        }
        field(19;Status;Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = Open,Advertised,"Oral&Written",Apptitude,Closed,"Re-Advertised";
        }
        field(20;"Closed Date";Date)
        {
            DataClassification = ToBeClassified;
        }
        field(21;"Closed By";Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(22;"Manpower Plan ID";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Manpower Plan Header" where (Blocked=filter(false));
        }
        field(23;"Type of Contract";Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = "Permanent & pensionable"," Management trainee"," Volunteer"," Part-time"," Temporary/contingency"," Consultant",Casual;
        }
        field(24;"Re-Advertise";Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(25;"Re-Advertised By";Code[10])
        {
            DataClassification = ToBeClassified;
        }
        field(26;"Re-Advertised Date";Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Line No.","Requisition No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        ManPowerPlanningLines: Record "ManPower Planning Lines";
        VacancyRequisitionsTable: Record "Vacancy  Requisitions Table";
        ManpowerPlanCode: Code[30];
}

