Page 50398 "prPCA list"
{
    CardPageID = prPayChangeAdvice;
    PageType = List;
    SourceTable = "prBasic pay PCA";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(EmployeeCode;"Employee Code")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeName;"Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field(BasicPay;"Basic Pay")
                {
                    ApplicationArea = Basic;
                }
                field(Comments;Comments)
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field(PayrollPeriod;"Payroll Period")
                {
                    ApplicationArea = Basic;
                }
                field(ChangeAdviceSerialNo;"Change Advice Serial No.")
                {
                    ApplicationArea = Basic;
                }
                field(Effected;Effected)
                {
                    ApplicationArea = Basic;
                }
                field(PAyrollCode;PAyrollCode)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control3;Notes)
            {
            }
            systempart(Control2;MyNotes)
            {
            }
            systempart(Control1;Links)
            {
            }
        }
    }

    actions
    {
    }

    var
        objOcx: Codeunit "PR Payroll Processing";
        Text19057798: label 'e.g   C:\monte\Timesheets\main folder\';
        Text19037672: label 'e.g   E:\monte\Back Up\Timesheets\';
        Text19075848: label 'NB:  if ticked, system deletes the imported files from the "Primary Directory"';
        Text19036653: label 'To view imported details, go to: "Salary Card" > "Other Info" > "Cost Centers"';
}

