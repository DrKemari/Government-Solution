report 57021 "Update Imprest"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Update Imprest.rdlc';

    dataset
    {
        dataitem(Payments;Payments)
        {
            DataItemTableView = WHERE("Payment Type"=FILTER(Surrender),Posted=FILTER(false));
            column(No_Payments;Payments."No.")
            {
            }
            column(Date_Payments;Payments.Date)
            {
            }
            column(Type_Payments;Payments.Type)
            {
            }
            column(PayMode_Payments;Payments."Pay Mode")
            {
            }

            trigger OnAfterGetRecord()
            begin
                ImprestLines.Reset;
                ImprestLines.SetRange(No,Payments."No.");
                if ImprestLines.FindFirst then begin
                  repeat
                    ImprestLines."Employee No.":=Payments."Account No.";
                    ImprestLines.Modify(true);
                  until ImprestLines.Next=0;
                end
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
        ImprestLines: Record "Imprest Lines";
}

