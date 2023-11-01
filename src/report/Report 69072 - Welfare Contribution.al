report 69072 "Welfare Contribution"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Welfare Contribution.rdlc';

    dataset
    {
        dataitem("Hr Welfare Header";"Hr Welfare Header")
        {
            DataItemTableView = WHERE("Welfare Type"=CONST(Contribution));
            RequestFilterFields = "Welfare No.";
            column(Logo;CI.Picture)
            {
            }
            column(WelfareNo_HrWelfareHeader;"Hr Welfare Header"."Welfare No.")
            {
            }
            column(WelfareType_HrWelfareHeader;"Hr Welfare Header"."Welfare Type")
            {
            }
            column(EmployeeNo_HrWelfareHeader;"Hr Welfare Header"."Raised By")
            {
            }
            column(EmployeeName_HrWelfareHeader;"Hr Welfare Header"."Raisee Name")
            {
            }
            column(Description_HrWelfareHeader;"Hr Welfare Header".Description)
            {
            }
            column(WelfareCategory_HrWelfareHeader;"Hr Welfare Header"."Welfare Category")
            {
            }
            column(CreatedBy_HrWelfareHeader;"Hr Welfare Header"."Created By")
            {
            }
            column(CreatedOn_HrWelfareHeader;"Hr Welfare Header"."Created On")
            {
            }
            column(Status_HrWelfareHeader;"Hr Welfare Header".Status)
            {
            }
            column(GlobalDimension1Code_HrWelfareHeader;"Hr Welfare Header"."Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code_HrWelfareHeader;"Hr Welfare Header"."Global Dimension 2 Code")
            {
            }
            column(GlobalDimension1_HrWelfareHeader;"Hr Welfare Header"."Global Dimension 1")
            {
            }
            column(GlobalDimension2_HrWelfareHeader;"Hr Welfare Header"."Global Dimension 2")
            {
            }
            column(NoSeries_HrWelfareHeader;"Hr Welfare Header"."No Series")
            {
            }
            column(TotalAmount_HrWelfareHeader;"Hr Welfare Header"."Total Amount")
            {
            }
            column(BenefitAllocation_HrWelfareHeader;"Hr Welfare Header"."Benefit Allocation")
            {
            }
            column(WelfareCode_HrWelfareHeader;"Hr Welfare Header"."Welfare Code")
            {
            }
            column(WelfareDescription_HrWelfareHeader;"Hr Welfare Header"."Welfare Description")
            {
            }
            dataitem("Welfare Lines";"Welfare Lines")
            {
                DataItemLink = "Welfare Header No."=FIELD("Welfare No.");
                column(WelfareHeaderNo_WelfareLines;"Welfare Lines"."Welfare Header No.")
                {
                }
                column(LineNo_WelfareLines;"Welfare Lines".LineNo)
                {
                }
                column(EmployeeNo_WelfareLines;"Welfare Lines"."Employee No.")
                {
                }
                column(EmployeeName_WelfareLines;"Welfare Lines"."Employee Name")
                {
                }
                column(Month_WelfareLines;"Welfare Lines".Month)
                {
                }
                column(Date_WelfareLines;"Welfare Lines".Date)
                {
                }
                column(Amount_WelfareLines;"Welfare Lines".Amount)
                {
                }
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
}

