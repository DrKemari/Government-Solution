report 85145 "Student Renewal Update"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Student Renewal Update.rdlc';

    dataset
    {
        dataitem("Renewal Details Update";"Renewal Details Update")
        {

            trigger OnAfterGetRecord()
            begin
                ExaminationAccount.Reset;
                ExaminationAccount.SetRange("Registration No.","Renewal Details Update"."Registration No.");
                if ExaminationAccount.FindSet then begin
                
                  if "Renewal Details Update"."Renwal Pending">3 then begin
                
                  ExaminationAccount."Renewal Amount":=ExaminationAccount."Renewal Amount"-"Renewal Details Update"."Renewal Amount";
                  ExaminationAccount."Re-Activation Amount":="Renewal Details Update"."Renewal Amount";
                  ExaminationAccount."Renewal Pending":=ExaminationAccount."Renewal Pending"-1;
                  ExaminationAccount.Status:=ExaminationAccount.Status::Dormant;
                  ExaminationAccount.Modify(true);
                  end;
                  /*
                  END ELSE BEGIN
                  ExaminationAccount."Renewal Amount":=ExaminationAccount."Renewal Amount"+"Renewal Details Update"."Renewal Amount";
                  ExaminationAccount."Renewal Pending":=ExaminationAccount."Renewal Pending"+1;
                  ExaminationAccount.MODIFY(TRUE);
                 END;
                
                  "Renewal Details Update".Updated:=TRUE;
                  "Renewal Details Update".MODIFY(TRUE);*/
                end

            end;

            trigger OnPreDataItem()
            begin
                //"Renewal Details Update".SETRANGE("Renewal Details Update".Updated,FALSE);
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
        ExaminationAccount: Record "Examination Account";
}

