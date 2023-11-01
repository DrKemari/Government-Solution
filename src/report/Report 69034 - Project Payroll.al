report 69034 "Project Payroll"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Project Payroll.rdlc';

    dataset
    {
        dataitem(Employee;Employee)
        {
            RequestFilterFields = "No.","Pay Period Filter";

            trigger OnAfterGetRecord()
            begin


                     AssignmentMatrix.Reset;
                     AssignmentMatrix.SetRange("Employee No",Employee."No.");
                     AssignmentMatrix.SetRange("Payroll Period",PayDate);
                     AssignmentMatrix.SetRange(Honoraria,true);
                     if AssignmentMatrix.Find('-') then begin
                        repeat
                        CompRec.Get;
                        GenJnline.Init;
                        LineNumber:=LineNumber+10;
                        GenJnline."Journal Template Name":=CompRec."Payroll Journal Template";
                        GenJnline."Journal Batch Name":=CompRec."Payroll Journal Batch";
                        GenJnline."Line No.":=GenJnline."Line No."+10000;

                        PGMapping.Reset;
                        PGMapping.SetRange( PGMapping.Code,AssignmentMatrix.Code);
                        if PGMapping.Find('-') then begin
                          GenJnline."Account Type":=PGMapping."Account Type";
                          GenJnline."Account No.":=PGMapping."G/L Account";
                        end else begin
                        Error(Text000,'',AssignmentMatrix.Code,AssignmentMatrix.Description);
                        end;

                        GenJnline."Posting Date":=PayrollPeriod."Pay Date";
                        GenJnline.Description:=AssignmentMatrix.Description;
                        GenJnline."Document No.":=Payperiodtext+'_'+Employee."No.";
                        GenJnline."Job No.":=AssignmentMatrix."Job No";
                        GenJnline."Job Task No.":=AssignmentMatrix."Job Task No";

                        GenJnline."Shortcut Dimension 1 Code":=Employee."Global Dimension 1 Code";
                        GenJnline.Amount:=AssignmentMatrix.Amount;
                        GenJnline.Insert;

                          until AssignmentMatrix.Next=0;

                       end;

            end;

            trigger OnPreDataItem()
            begin
                  PayrollPeriod.Reset;
                      PayrollPeriod.SetRange(Closed,false);
                      if PayrollPeriod.Find('-') then begin
                          PayDate:=PayrollPeriod."Starting Date";
                          Payperiodtext:='P_'+PayrollPeriod.Name;
                        end;
            end;
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

    var
        PayrollPeriod: Record "Payroll PeriodX";
        PayDate: Date;
        Payperiodtext: Code[50];
        AssignmentMatrix: Record "Assignment Matrix-X";
        CompRec: Record "Human Resources Setup";
        GenJnline: Record "Gen. Journal Line";
        LineNumber: Integer;
        PGMapping: Record "Employee PGroups";
        Text000: Label 'There is no G/L Account setup for %1 %2 %3';
        Text001: Label 'You are about to transfer the payroll summary for the wrong Period,Continue?';
        Text002: Label 'Pay Date must be Specified for the Period';
        JobTask: Record "Job Task";
}

