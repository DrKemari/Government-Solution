report 85015 "Detailed Results"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Detailed Results.rdlc';

    dataset
    {
        dataitem("Examination Results";"Examination Results")
        {
            column(Logo;CI.Picture)
            {
            }
            column(LineNo_ExaminationResults;"Examination Results"."Line No.")
            {
            }
            column(StudentRegNo_ExaminationResults;"Examination Results"."Student Reg No.")
            {
            }
            column(Examination_ExaminationResults;"Examination Results".Examination)
            {
            }
            column(Part_ExaminationResults;"Examination Results".Part)
            {
            }
            column(Section_ExaminationResults;"Examination Results".Section)
            {
            }
            column(Paper_ExaminationResults;"Examination Results".Paper)
            {
            }
            column(PaperName_ExaminationResults;"Examination Results"."Paper Name")
            {
            }
            column(Type_ExaminationResults;"Examination Results".Type)
            {
            }
            column(StudentName_ExaminationResults;"Examination Results"."Student Name")
            {
            }
            column(Address_ExaminationResults;"Examination Results".Address)
            {
            }
            column(Email_ExaminationResults;"Examination Results".Email)
            {
            }
            column(NationalIDNo_ExaminationResults;"Examination Results"."National ID No.")
            {
            }
            column(PassportNo_ExaminationResults;"Examination Results"."Passport No.")
            {
            }
            column(Grade_ExaminationResults;"Examination Results".Grade)
            {
            }
            column(SectionGrade_ExaminationResults;"Examination Results"."Section Grade")
            {
            }
            column(SectionDescription_ExaminationResults;"Examination Results"."Section Description")
            {
            }
            column(ExaminationSittingID_ExaminationResults;"Examination Results"."Examination Sitting ID")
            {
            }
            column(FinancialYear_ExaminationResults;"Examination Results"."Financial Year")
            {
            }
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

    trigger OnPreReport()
    begin
        CI.Get;
        CI.CalcFields(Picture);
    end;

    var
        CI: Record "Company Information";
}

