#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 69242 "HR Insurance Scheme Members"
{

    fields
    {
        field(1;"Scheme No";Code[10])
        {
            TableRelation = "HR Medical Schemes"."Scheme No";

            trigger OnValidate()
            begin

                         Medscheme.Reset;
                         Medscheme.SetRange(Medscheme."Scheme No","Scheme No");
                          if Medscheme.Find('-') then begin
                         "Out-Patient Limit":=Medscheme."Out-patient limit";
                         "In-patient Limit":=Medscheme."In-patient limit";
                         "Balance In- Patient":="In-patient Limit"-"Cumm.Amount Spent";
                         "Balance Out- Patient":="Out-Patient Limit"-"Cumm.Amount Spent Out";
                          end;
            end;
        }
        field(2;"Employee No";Code[10])
        {
            TableRelation = Employee."No.";

            trigger OnValidate()
            begin
                         Emp.Reset;
                         Emp.SetRange(Emp."No.","Employee No");
                         if Emp.Find('-') then begin
                         "First Name":=Emp."First Name"+' '+Emp."Middle Name";
                         "Last Name":=Emp."Last Name";
                         Designation:=Emp."Job Title";
                         //Department:=Emp."Department Code";
                         "Scheme Join Date":=Emp."Medical Scheme Join Date";

                         //"In-patient Limit":=Medscheme."In-patient limit";
                          end;
            end;
        }
        field(3;"First Name";Text[30])
        {
        }
        field(4;"Last Name";Text[30])
        {
        }
        field(5;Designation;Text[500])
        {
        }
        field(6;Department;Text[100])
        {
        }
        field(7;"Scheme Join Date";Date)
        {
        }
        field(8;"Scheme Anniversary";Date)
        {
        }
        field(9;"Cumm.Amount Spent";Decimal)
        {
            CalcFormula = sum("HR Medical Claims"."Amount Charged" where ("Member No"=field("Employee No"),
                                                                          "Claim Type"=const(Inpatient)));
            FieldClass = FlowField;
        }
        field(10;"Out-Patient Limit";Decimal)
        {
        }
        field(11;"In-patient Limit";Decimal)
        {
        }
        field(12;"Maximum Cover";Decimal)
        {
        }
        field(13;"Cumm.Amount Spent Out";Decimal)
        {
            CalcFormula = sum("HR Medical Claims"."Amount Charged" where ("Member No"=field("Employee No"),
                                                                          "Claim Type"=const(Outpatient)));
            FieldClass = FlowField;
        }
        field(14;"Balance Out- Patient";Decimal)
        {
        }
        field(15;"Balance In- Patient";Decimal)
        {
        }
        field(16;"No Of Dependants";Code[10])
        {
        }
        field(17;"Job Grade";Code[30])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Salary Scales".Scale;

            trigger OnValidate()
            begin
                SalaryScales.Reset;
                SalaryScales.SetRange(Scale,"Job Grade");
                if SalaryScales.FindSet then
                  "In-patient Limit":=SalaryScales."In Patient Limit";
                  "Out-Patient Limit":=SalaryScales."Out Patient Limit";
                  "Maximum Cover":=SalaryScales."Maximum Cover";
                  "Bed Limit":=SalaryScales."Bed Limit";
            end;
        }
        field(18;"Bed Limit";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(69608;"Maternity Limit";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(69609;"Dental Limit";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(69610;"Optical Limit";Decimal)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Scheme No","Employee No")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Medscheme: Record "HR Medical Schemes";
        Emp: Record Employee;
        SalaryScales: Record "Salary Scales";
}

