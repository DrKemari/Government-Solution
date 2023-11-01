#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 85217 "Top 10 students per paper"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Top 10 students per paper.rdlc';

    dataset
    {
        dataitem(RSL; "Examination Results")
        {
            RequestFilterFields = "Examination Sitting ID", "Part", Paper;
            column(ReportForNavId_1; 1)
            {
            }
            column(LineNo_RSL; RSL."Line No.")
            {
            }
            column(StudentRegNo_RSL; RSL."Student Reg No.")
            {
            }
            column(Examination_RSL; RSL.Examination)
            {
            }
            column(Part_RSL; RSL.Part)
            {
            }
            column(Section_RSL; RSL.Section)
            {
            }
            column(Paper_RSL; RSL.Paper)
            {
            }
            column(PaperName_RSL; RSL."Paper Name")
            {
            }
            column(Type_RSL; RSL.Type)
            {
            }
            column(StudentName_RSL; RSL."Student Name")
            {
            }
            column(Address_RSL; RSL.Address)
            {
            }
            column(Email_RSL; RSL.Email)
            {
            }
            column(NationalIDNo_RSL; RSL."National ID No.")
            {
            }
            column(PassportNo_RSL; RSL."Passport No.")
            {
            }
            column(Grade_RSL; RSL.Grade)
            {
            }
            column(SectionGrade_RSL; RSL."Section Grade")
            {
            }
            column(SectionDescription_RSL; RSL."Section Description")
            {
            }
            column(ExaminationSittingID_RSL; RSL."Examination Sitting ID")
            {
            }
            column(FinancialYear_RSL; RSL."Financial Year")
            {
            }
            column(ExaminationCenter_RSL; RSL."Examination Center")
            {
            }
            column(Mark_RSL; RSL.Mark)
            {
            }
            column(DocumentNo_RSL; RSL."Document No.")
            {
            }
            column(Passed_RSL; RSL.Passed)
            {
            }
            column(SerialNo_RSL; RSL."Serial No")
            {
            }
            column(SubC_RSL; RSL."Sub C")
            {
            }
            column(Fc_RSL; RSL.Fc)
            {
            }
            column(IssueDate_RSL; RSL."Issue Date")
            {
            }
            column(COMP; CompanyInformation.Name)
            {
            }
            column(LOGO; CompanyInformation.Picture)
            {
            }

            trigger OnPreDataItem()
            begin
                ExaminationResult.Reset;
                ExaminationResult.SetCurrentkey(Mark);
                ExaminationResult.SetAscending(Mark, false);
                ExaminationResult.SetRange(Paper, RSL.Paper);
                ExaminationResult.SetRange("Examination Sitting ID", RSL."Examination Sitting ID");
                if ExaminationResult.FindSet then begin
                    //    NoOfRec:=ExaminationResult.COUNT;
                    //    IF NoOfRec<11 THEN BEGIN
                    //      REPEAT
                    //
                    //        UNTIL ExaminationResult.NEXT=0;
                    //
                    //      END;
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

    trigger OnInitReport()
    begin
        CompanyInformation.Get;
        CompanyInformation.CalcFields(Picture);
    end;

    var
        ExaminationResult: Record "Examination Results";
        NoOfRec: Integer;
        CompanyInformation: Record "Company Information";
}
