report 85312 "Script Update"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Script Update.rdlc';

    dataset
    {
        dataitem("Application Response";"Application Response")
        {

            trigger OnAfterGetRecord()
            begin
                "Application Response".Validate("Application Response"."Question Code");
                "Application Response".Modify(true);
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
        AccreditationQuestions: Record "Accreditation Questions";
        ApplicationQuestionNos: Record "Application Question Nos.";
}

