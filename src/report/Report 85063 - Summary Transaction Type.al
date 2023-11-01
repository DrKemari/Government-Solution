report 85063 "Summary Transaction Type"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Summary Transaction Type.rdlc';
    Caption = 'Summary Transaction Type';

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
            column(StudentNo_StudentProcessingHeader;Regno)
            {
            }
            column(StudentName_StudentProcessingHeader;"Student Processing Header"."Student Name")
            {
            }
            column(FirstName_StudentProcessingHeader;"Student Processing Header"."First Name")
            {
            }
            column(StudentRegNo_StudentProcessingHeader;"Student Processing Header"."Student No.")
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
                Regno:='';
                Amount:=0.0;
                "Student Processing Header".CalcFields("Student Processing Header"."Exemption Amount");
                "Student Processing Header".CalcFields("Student Processing Header"."Booking Amount");
                "Student Processing Header".CalcFields("Student Processing Header"."Renewal Amount");
                ExaminationSetup.Get;
                if "Student Processing Header"."Document Type"="Student Processing Header"."Document Type"::Booking then begin
                   Amount:="Student Processing Header"."Booking Amount";
                  Regno:="Student Processing Header"."Student Reg. No.";
                end;
                if "Student Processing Header"."Document Type"="Student Processing Header"."Document Type"::Registration then begin
                   Amount:="Student Processing Header"."Application Amount";
                  //get reg no
                  ExaminationAccount.Reset;
                  ExaminationAccount.SetRange("Student Cust No.","Student Processing Header"."Student No.");
                  ExaminationAccount.SetRange("Course ID","Student Processing Header"."Examination ID");
                  if ExaminationAccount.FindFirst then begin
                    Regno:=ExaminationAccount."Registration No.";
                  end
                end;
                if "Student Processing Header"."Document Type"="Student Processing Header"."Document Type"::Renewal then begin
                   Amount:="Student Processing Header"."Renewal Amount";
                  //get the student reg no
                  ProcessingLines.Reset;
                  ProcessingLines.SetRange("Booking Header No.","Student Processing Header"."No.");
                  if ProcessingLines.FindFirst then begin
                    Regno:=ProcessingLines."Registration No.";
                  end;
                end;
                if "Student Processing Header"."Document Type"="Student Processing Header"."Document Type"::Exemption then begin
                   Amount:="Student Processing Header"."Exemption Amount";
                  Regno:="Student Processing Header"."Student Reg. No.";
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
        ProcessingLines: Record "Student Processing Lines";
        Regno: Code[30];
        ExaminationAccount: Record "Examination Account";
        Startdate: Date;
        Enddate: Date;
}

