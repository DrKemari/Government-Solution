report 69607 "Shortlist Mandatory Pe Vacancy"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Shortlist Mandatory Pe Vacancy.rdlc';

    dataset
    {
        dataitem("Job Applications";"Job Applications")
        {

            trigger OnPreDataItem()
            begin
                Applications.Reset;
                Applications.SetRange("Vacancy Id",VacancyNo);
                if Applications.FindSet then begin
                  repeat
                    Recruitment.ShortlistBasedOnMandatory(Applications);
                  until
                Applications.Next=0;
                Message('Vacancy %1,has shortlisted candidates, Kindly Proceed to Shortlisting Vouchers...',Applications."Vacancy Id");
                end else
                Message('Vacancy %1,has no candidates, Kindly Check...',Applications."Vacancy Id");
                CurrReport.Quit;
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field(VacancyNo;VacancyNo)
                {
                    TableRelation = "Recruitment Requisition Header" WHERE ("Document Type"=FILTER("Job Vacancy"));
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        if VacancyNo='' then
          Error('Kindly input vacancy no to be shortlisted on');
    end;

    var
        VacancyNo: Code[30];
        Recruitment: Codeunit Recruitment;
        Applications: Record "Job Applications";
}

