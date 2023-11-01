report 85041 "Summary Transaction Types"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Summary Transaction Types.rdlc';

    dataset
    {
        dataitem("Student Processing Header";"Student Processing Header")
        {
            DataItemTableView = WHERE(Posted=FILTER(true),Cancelled=FILTER(false),"Manual Input"=FILTER(false));
            RequestFilterFields = "Currency Code","Posted Date";
            column(Logo;CI.Picture)
            {
            }
            column(No_StudentProcessingHeader;"Student Processing Header"."No.")
            {
            }
            column(PostedDate_StudentProcessingHeader;"Student Processing Header"."Posted Date")
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
            column(ExaminationID_StudentProcessingHeader;"Student Processing Header"."Examination ID")
            {
            }
            column(ExaminationDescription_StudentProcessingHeader;"Student Processing Header"."Examination Description")
            {
            }
            column(StudentRegNo_StudentProcessingHeader;"Student Processing Header"."Student Reg. No.")
            {
            }
            column(Amount;Amount)
            {
            }
            column(ExaminationSitting_StudentProcessingHeader;"Student Processing Header"."Examination Sitting")
            {
            }
            column(CurrencyCode_StudentProcessingHeader;"Student Processing Header"."Currency Code")
            {
            }
            column(StartDate;StartDate)
            {
            }
            column(EndDate;EndDate)
            {
            }

            trigger OnAfterGetRecord()
            begin
                StartDate:= "Student Processing Header".GetRangeMin("Student Processing Header"."Posted Date");
                EndDate:="Student Processing Header".GetRangeMax("Student Processing Header"."Posted Date");
                "Student Processing Header".CalcFields("Student Processing Header"."Exemption Amount");
                "Student Processing Header".CalcFields("Student Processing Header"."Booking Amount");
                "Student Processing Header".CalcFields("Student Processing Header"."Renewal Amount");

                if "Student Processing Header"."Currency Code"<>'' then begin
                  if "Student Processing Header"."Document Type"="Student Processing Header"."Document Type"::Booking then begin
                   Amount:="Student Processing Header"."Booking Amount"*ConversionRate;
                end;
                 if "Student Processing Header"."Document Type"="Student Processing Header"."Document Type"::Defferment then begin
                   Amount:="Student Processing Header"."Administrative Fees"*ConversionRate;
                end;
                if "Student Processing Header"."Document Type"="Student Processing Header"."Document Type"::Registration then begin
                   Amount:="Student Processing Header"."Application Amount"*ConversionRate;;
                end;
                if "Student Processing Header"."Document Type"="Student Processing Header"."Document Type"::Renewal then begin
                   Amount:="Student Processing Header"."Renewal Amount"*ConversionRate;;
                end;
                if "Student Processing Header"."Document Type"="Student Processing Header"."Document Type"::Exemption then begin
                   Amount:="Student Processing Header"."Exemption Amount"*ConversionRate;;
                end;
                end else begin

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
                if "Student Processing Header"."Document Type"="Student Processing Header"."Document Type"::Defferment then begin
                   Amount:="Student Processing Header"."Administrative Fees";
                end;
                end
            end;

            trigger OnPreDataItem()
            begin
                ConversionRate:=113.14;
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
        CI.Get;
        CI.CalcFields(Picture);
    end;

    var
        CI: Record "Company Information";
        Amount: Decimal;
        StartDate: Date;
        EndDate: Date;
        ConversionRate: Decimal;
}

