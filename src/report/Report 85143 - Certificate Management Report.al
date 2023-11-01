report 85143 "Certificate Management Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Certificate Management Report.rdlc';

    dataset
    {
        dataitem("Certificate Entry";"Certificate Entry")
        {
            column(EntryNo_CertificateEntry;"Certificate Entry"."Entry No.")
            {
            }
            column(StudentRegNo_CertificateEntry;"Certificate Entry"."Student Reg No.")
            {
            }
            column(StudentName_CertificateEntry;"Certificate Entry"."Student Name")
            {
            }
            column(Examination_CertificateEntry;"Certificate Entry".Examination)
            {
            }
            column(Part_CertificateEntry;"Certificate Entry".Part)
            {
            }
            column(ExamSittingID_CertificateEntry;"Certificate Entry"."Exam Sitting ID")
            {
            }
            column(ExamCenter_CertificateEntry;"Certificate Entry"."Exam Center")
            {
            }
            column(DatePrinted_CertificateEntry;"Certificate Entry"."Date Printed")
            {
            }
            column(PrintedBy_CertificateEntry;"Certificate Entry"."Printed By")
            {
            }
            column(CollectionDate_CertificateEntry;"Certificate Entry"."Collection Date")
            {
            }
            column(CollectedByIDNumber_CertificateEntry;"Certificate Entry"."Collected By ID Number")
            {
            }
            column(CollectedByName_CertificateEntry;"Certificate Entry"."Collected By Name")
            {
            }
            column(CollectedByEmail_CertificateEntry;"Certificate Entry"."Collected By Email")
            {
            }
            column(IssuedBy_CertificateEntry;"Certificate Entry"."Issued  By")
            {
            }
            column(IssuedDate_CertificateEntry;"Certificate Entry"."Issued Date")
            {
            }
            column(IssuedTime_CertificateEntry;"Certificate Entry"."Issued Time")
            {
            }
            column(Type_CertificateEntry;"Certificate Entry".Type)
            {
            }
            column(LastModifiedDateTime_CertificateEntry;"Certificate Entry"."Last Modified Date Time")
            {
            }
            column(LastDateModified_CertificateEntry;"Certificate Entry"."Last Date Modified")
            {
            }
            column(CertificateNo_CertificateEntry;"Certificate Entry"."Certificate No.")
            {
            }
            column(Collected_CertificateEntry;"Certificate Entry".Collected)
            {
            }
            column(StorageAmount_CertificateEntry;"Certificate Entry"."Storage Amount")
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
}

