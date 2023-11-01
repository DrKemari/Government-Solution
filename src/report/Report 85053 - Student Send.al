report 85053 "Student Send"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Student Send.rdlc';

    dataset
    {
        dataitem("Dynasoft Portal User";"Dynasoft Portal User")
        {

            trigger OnAfterGetRecord()
            var
                StudentProcessingHeader: Record "Student Processing Header";
            begin
                if "Dynasoft Portal User"."Authentication Email"='' then begin
                  StudentProcessingHeader.Reset;
                  StudentProcessingHeader.SetRange("ID Number/Passport No.","Dynasoft Portal User"."Id Number");
                  if StudentProcessingHeader.FindFirst then begin
                    "Dynasoft Portal User"."Authentication Email":=StudentProcessingHeader.Email;
                    "Dynasoft Portal User".Modify(true);
                  end
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
        Examination: Codeunit Examination;
        Studentmanagement: Codeunit "Student management";
}

