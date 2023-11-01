page 81284 "PR Payroll Activities Cue"
{
    PageType = CardPart;
    SourceTable = "HR Activities Cue";

    layout
    {
        area(content)
        {

            cuegroup(PayrollActivites)
            {
                ShowCaption = false;
                field("Basic Pay"; "Basic Pay")
                {
                    ApplicationArea = all;

                    Caption = 'Basic Pay';

                    /* trigger OnDrillDown()
                    var
                        HRCodeunit: Codeunit "HR Codeunit";
                    begin
                        HRCodeunit.DrillDownBasicPay();
                    end */
                    ;
                }

                field("Net Pay"; "Net Pay")
                {
                    ApplicationArea = all;
                    Caption = 'Net Pay';

                    // trigger OnDrillDown()
                    // var
                    //     HRCodeunit: Codeunit "HR Codeunit";
                    // begin
                    //     HRCodeunit.DrillDownNetPay();
                    // end; 
                }

                field(Allowances; Allowances)
                {
                    ApplicationArea = all;
                    Caption = 'Allowances';
                }

                field(PAYE; PAYE)
                {
                    ApplicationArea = all;
                }

                field(NHIF; NHIF)
                {
                    ApplicationArea = all;
                    Caption = 'NHIF';
                }

                field(NSSF; NSSF)
                {
                    ApplicationArea = all;
                    Caption = 'NSSF';
                }

                field("Voluntary NSSF"; "Voluntary NSSF")
                {
                    ApplicationArea = all;
                }

                field("Pension-Employee"; "Pension-Employee")
                {
                    ApplicationArea = all;
                    Caption = 'Pension - Employee';
                }

                field("Pension-Employer"; "Pension-Employer")
                {
                    ApplicationArea = all;
                    Caption = 'Pension - Employer';
                }

                field("Voluntary Pension"; "Voluntary Pension")
                {
                    ApplicationArea = all;
                }
            }
        }

    }
    trigger OnOpenPage();
    begin

        RESET;
        IF NOT GET THEN BEGIN
            INIT;
            INSERT;
        END;
    end;
}




