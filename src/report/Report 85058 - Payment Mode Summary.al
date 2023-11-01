report 85058 "Payment Mode Summary"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Payment Mode Summary.rdlc';

    dataset
    {
        dataitem("Student Processing Header";"Student Processing Header")
        {
            DataItemTableView = WHERE(Posted=FILTER(true));
            RequestFilterFields = "Posted Date";
            column(No_StudentProcessingHeader;"Student Processing Header"."No.")
            {
            }
            column(Date_StudentProcessingHeader;"Student Processing Header".Date)
            {
            }
            column(DocumentType_StudentProcessingHeader;"Student Processing Header"."Document Type")
            {
            }
            column(StudentNo_StudentProcessingHeader;"Student Processing Header"."Student No.")
            {
            }
            column(StudentName_StudentProcessingHeader;"Student Processing Header"."Student Name")
            {
            }
            column(FirstName_StudentProcessingHeader;"Student Processing Header"."First Name")
            {
            }
            column(MiddleName_StudentProcessingHeader;"Student Processing Header"."Middle Name")
            {
            }
            column(PayMode_StudentProcessingHeader;Paymode)
            {
            }
            column(PostedBy_StudentProcessingHeader;"Student Processing Header"."Posted By")
            {
            }
            column(Amount;Amount)
            {
            }
            column(PostedDate_StudentProcessingHeader;"Student Processing Header"."Posted Date")
            {
            }
            column(Startdate;Startdate)
            {
            }
            column(Enddate;Enddate)
            {
            }

            trigger OnAfterGetRecord()
            begin
                "Student Processing Header".CalcFields("Student Processing Header"."Exemption Amount");
                "Student Processing Header".CalcFields("Student Processing Header"."Booking Amount");
                "Student Processing Header".CalcFields("Student Processing Header"."Renewal Amount");
                ExaminationSetup.Get;
                if "Student Processing Header"."Document Type"="Student Processing Header"."Document Type"::Booking then begin
                   Amount:="Student Processing Header"."Booking Amount";
                end;
                if "Student Processing Header"."Document Type"="Student Processing Header"."Document Type"::Registration then begin
                   Amount:="Student Processing Header"."Application Amount";
                end;
                if "Student Processing Header"."Document Type"="Student Processing Header"."Document Type"::Renewal then begin
                   Amount:="Student Processing Header"."Renewal Amount";
                end;
                if "Student Processing Header"."Document Type"="Student Processing Header"."Document Type"::Exemption then begin
                   Amount:="Student Processing Header"."Exemption Amount";
                end;
                if "Student Processing Header"."Pay Mode"='' then
                  Paymode:=ExaminationSetup."Default Payment Mode"
                   else
                   Paymode:="Student Processing Header"."Pay Mode"


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

    trigger OnPreReport()
    begin
        Startdate:="Student Processing Header".GetRangeMin( "Student Processing Header"."Posted Date");
        Enddate:="Student Processing Header".GetRangeMax( "Student Processing Header"."Posted Date");
    end;

    var
        Amount: Decimal;
        ExaminationSetup: Record "Examination Setup";
        Examination: Codeunit Examination;
        Paymode: Text;
        Startdate: Date;
        Enddate: Date;
}

