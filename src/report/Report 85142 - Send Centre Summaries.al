report 85142 "Send Centre Summaries"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Send Centre Summaries.rdlc';

    dataset
    {
        dataitem("Examination Centres";"Examination Centres")
        {
            DataItemTableView = WHERE("E-Mail"=FILTER(<>' '),Blocked=CONST(false));

            trigger OnAfterGetRecord()
            var
                ProcessingHeader: Record "Student Processing Header";
            begin
                 ExaminationCentres.Reset;
                 ExaminationCentres.SetRange(Code,"Examination Centres".Code);
                 ExaminationCentres.SetFilter("E-Mail",'<>%', '');
                 if ExaminationCentres.FindSet then begin

                 Examination.ExaminationCenterSummarySendReport(ExaminationCentres);
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
        Examination: Codeunit Examination;
        ExaminationCentres: Record "Examination Centres";
}

