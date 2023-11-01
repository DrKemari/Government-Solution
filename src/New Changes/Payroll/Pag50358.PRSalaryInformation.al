Page 81288 "PR Salary Information"
{
    AutoSplitKey = false;
    Caption = 'Payment Information';
    UsageCategory = Lists;
    ApplicationArea = All;
    DelayedInsert = true;
    LinksAllowed = false;
    PageType = ListPart;
    PromotedActionCategories = 'New,Process,Reports,Approval,Budgetary Control,Cancellation,Category7_caption,Category8_caption,Category9_caption,Category10_caption';
    SourceTable = "PR Salary Card";

    layout
    {
        area(content)
        {
            repeater(PaymentInfo)
            {
                Caption = 'Payment Info';
                field(BasicPay; "Basic Pay")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        //Record change being made on which payroll period
                        PRPayrollPeriod.Reset;
                        PRPayrollPeriod.SetRange(PRPayrollPeriod.Closed, false);
                        if not PRPayrollPeriod.FindFirst() then Error('No Open Payroll Period found');

                        //HR Value Change
                        Clear(prEmployees);
                        if prEmployees.Get("Employee Code") then begin

                        end;
                    end;
                }
                field(PaysNSSF; "Pays NSSF")
                {
                    ApplicationArea = Basic;
                }
                field(PaysNHIF; "Pays NHIF")
                {
                    ApplicationArea = Basic;
                }
                field(PaysPAYE; "Pays PAYE")
                {
                    ApplicationArea = Basic;
                }
                field(DeActivatePersonalRelief; "De-Activate Personal Relief?")
                {
                    ApplicationArea = Basic;
                }
                field(InsuranceCertificate; "Insurance Certificate?")
                {
                    ApplicationArea = Basic;
                }


                field("PWD Certificate?"; "PWD Certificate?")
                {
                    ApplicationArea = all;
                }
                field(SuspendPay; "Suspend Pay")
                {
                    ApplicationArea = Basic;
                }
                field(SuspensionDate; "Suspension Date")
                {
                    ApplicationArea = Basic;
                }
                field(SuspensionReasons; "Suspension Reasons")
                {
                    ApplicationArea = Basic;
                    MultiLine = false;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        //CALCFIELDS("Is Paid Daily?");
        ////IF "Is Paid Daily?" = FALSE THEN BPAY_Editable:=TRUE;
    end;

    trigger OnOpenPage()
    begin
        ///BPAY_Editable:=FALSE;
    end;

    var
        Qtn: label '''Leave without saving changes?''';
        // HRCodeunit: Codeunit "HR Codeunit";
        HREmp: Record "Employee";
        PRPayrollPeriod: Record "PR Payroll Periods";
        prEmployees: Record "Employee";
        PRSalaryCard: Record "PR Salary Card";
}

