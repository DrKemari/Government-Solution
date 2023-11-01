report 69615 "Job Grade Summary"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Job Grade Summary.rdlc';

    dataset
    {
        dataitem("Salary Scales";"Salary Scales")
        {
            column(Name;CI.Name)
            {
            }
            column(Logo;CI.Picture)
            {
            }
            column(Scale_SalaryScales;"Salary Scales".Scale)
            {
            }
            column(MinimumPointer_SalaryScales;"Salary Scales"."Minimum Pointer")
            {
            }
            column(MaximumPointer_SalaryScales;"Salary Scales"."Maximum Pointer")
            {
            }
            column(ResponsibilityAllowance_SalaryScales;"Salary Scales"."Responsibility Allowance")
            {
            }
            column(CommuterAllowance_SalaryScales;"Salary Scales"."Commuter Allowance")
            {
            }
            column(InPatientLimit_SalaryScales;"Salary Scales"."In Patient Limit")
            {
            }
            column(OutPatientLimit_SalaryScales;"Salary Scales"."Out Patient Limit")
            {
            }
            column(Description_SalaryScales;"Salary Scales".Description)
            {
            }
            column(AppointmentAuthority_SalaryScales;"Salary Scales"."Appointment Authority")
            {
            }
            column(SeniorityLevel_SalaryScales;"Salary Scales"."Seniority Level")
            {
            }
            column(ValidPositions_SalaryScales;"Salary Scales"."Valid Positions")
            {
            }
            column(ActiveEmployees_SalaryScales;"Salary Scales"."Active Employees")
            {
            }
            column(Blocked_SalaryScales;"Salary Scales".Blocked)
            {
            }
            dataitem("Salary Pointers";"Salary Pointers")
            {
                DataItemLink = "Salary Scale"=FIELD(Scale);
                column(SalaryPointer_SalaryPointers;"Salary Pointers"."Salary Pointer")
                {
                }
                column(BasicPayint_SalaryPointers;"Salary Pointers"."Basic Pay int")
                {
                }
                column(BasicPay_SalaryPointers;"Salary Pointers"."Basic Pay")
                {
                }
                column(SalaryScale_SalaryPointers;"Salary Pointers"."Salary Scale")
                {
                }
                column(Description_SalaryPointers;"Salary Pointers".Description)
                {
                }
                column(MinSalary_SalaryPointers;"Salary Pointers"."Min Salary")
                {
                }
                column(MaxSalary_SalaryPointers;"Salary Pointers"."Max Salary")
                {
                }
            }
            dataitem("Benefit Plan Grade";"Benefit Plan Grade")
            {
                DataItemLink = "Job Grade ID"=FIELD(Scale);
                column(PackageID_BenefitPlanGrade;"Benefit Plan Grade"."Package ID")
                {
                }
                column(PlanID_BenefitPlanGrade;"Benefit Plan Grade"."Plan ID")
                {
                }
                column(JobGradeID_BenefitPlanGrade;"Benefit Plan Grade"."Job Grade ID")
                {
                }
                column(Description;Description)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    BenefitPackage.Reset;
                    BenefitPackage.SetRange("Package ID","Benefit Plan Grade"."Package ID");
                    if BenefitPackage.FindFirst then begin
                    Description:=BenefitPackage.Description;
                      end
                end;
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        CI.Get;
        CI.CalcFields(Picture);
    end;

    var
        CI: Record "Company Information";
        BenefitPackage: Record "Benefit Package";
        Description: Text;
}

