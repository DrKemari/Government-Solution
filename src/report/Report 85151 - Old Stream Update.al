report 85151 "Old Stream Update"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Old Stream Update.rdlc';

    dataset
    {
        dataitem("Old Stream Data";"Old Stream Data")
        {
            column(RegistrationNo_OldStreamData;"Old Stream Data"."Registration No.")
            {
            }
            column(StudentName_OldStreamData;"Old Stream Data"."Student Name")
            {
            }

            trigger OnAfterGetRecord()
            begin
                ExaminationAccount.Reset;
                ExaminationAccount.SetRange("Registration No.","Old Stream Data"."Registration No.");
                if ExaminationAccount.FindFirst then begin
                  ExaminationAccount."Old Streamer":=true;
                  ExaminationAccount.Modify(true);
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
        ExaminationAccount: Record "Examination Account";
}

