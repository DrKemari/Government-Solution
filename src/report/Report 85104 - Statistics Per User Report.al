report 85104 "Statistics Per User Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Statistics Per User Report.rdlc';

    dataset
    {
        dataitem("Student Processing Header";"Student Processing Header")
        {
            DataItemTableView = WHERE(Posted=FILTER(true));
            RequestFilterFields = "Posted Date","Posted By";
            column(CompanyLogo;CompanyInfo.Picture)
            {
            }
            column(CompanyName;CompanyInfo.Name)
            {
            }
            column(CompanyAddress;CompanyInfo.Address)
            {
            }
            column(CompanyAddress2;CompanyInfo."Address 2")
            {
            }
            column(CompanyPostCode;CompanyInfo."Post Code")
            {
            }
            column(CompanyCity;CompanyInfo.City)
            {
            }
            column(CompanyPhone;CompanyInfo."Phone No.")
            {
            }
            column(CompanyFax;CompanyInfo."Fax No.")
            {
            }
            column(CompanyEmail;CompanyInfo."E-Mail")
            {
            }
            column(CompanyWebsite;CompanyInfo."Home Page")
            {
            }
            column(No_StudentProcessingHeader;"Student Processing Header"."No.")
            {
            }
            column(Date_StudentProcessingHeader;"Student Processing Header".Date)
            {
            }
            column(DocumentType_StudentProcessingHeader;"Student Processing Header"."Document Type")
            {
            }
            column(PostedDate_StudentProcessingHeader;"Student Processing Header"."Posted Date")
            {
            }
            column(StudentNo_StudentProcessingHeader;"Student Processing Header"."Student No.")
            {
            }
            column(StudentName_StudentProcessingHeader;"Student Processing Header"."Student Name")
            {
            }
            column(IDNumberPassportNo_StudentProcessingHeader;"Student Processing Header"."ID Number/Passport No.")
            {
            }
            column(ExaminationID_StudentProcessingHeader;"Student Processing Header"."Examination ID")
            {
            }
            column(ExaminationDescription_StudentProcessingHeader;"Student Processing Header"."Examination Description")
            {
            }
            column(ExaminationCenterCode_StudentProcessingHeader;"Student Processing Header"."Examination Center Code")
            {
            }
            column(Portal_StudentProcessingHeader;Source)
            {
            }
            column(ExaminationSitting_StudentProcessingHeader;"Student Processing Header"."Examination Sitting")
            {
            }
            column(Type_StudentProcessingHeader;"Student Processing Header".Type)
            {
            }
            column(StudentRegNo_StudentProcessingHeader;"Student Processing Header"."Student Reg. No.")
            {
            }
            column(PostedBy_StudentProcessingHeader;"Student Processing Header"."Posted By")
            {
            }
            column(StartDate;StartDate)
            {
            }
            column(EndDate;EndDate)
            {
            }
            column(TotalNo;TotalNo)
            {
            }
            column(TransactionCategory;TransactionCategory)
            {
            }

            trigger OnAfterGetRecord()
            begin
                TransactionCategory:='';
                "Student Processing Header".SetFilter("Student Processing Header"."Posted Date",'%1..%2',StartDate,EndDate);
                if "Student Processing Header".Portal=true then
                  Source:=TXT001 else
                  Source:=TXT002;


                ReceiptsHeader1.Reset;
                ReceiptsHeader1.SetRange("Posted By","Student Processing Header"."Posted By");
                ReceiptsHeader1.SetRange(Posted,true);
                ReceiptsHeader1.SetFilter("Posted Date",'%1..%2',StartDate,EndDate);
                ReceiptsHeader1.SetRange("Document Type",ReceiptsHeader1."Document Type"::"Student Receipt");
                if ReceiptsHeader1.FindSet then begin
                  TotalNo:= ReceiptsHeader1.Count;
                  TransactionCategory:='Miscellaneous Receipt';
                end;

                //get the posted receipts
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
        CompanyInfo.Get;
        CompanyInfo.CalcFields(Picture);
    end;

    trigger OnPreReport()
    begin
        StartDate:="Student Processing Header".GetRangeMin("Student Processing Header"."Posted Date");
        EndDate:="Student Processing Header".GetRangeMax("Student Processing Header"."Posted Date");
    end;

    var
        CompanyInfo: Record "Company Information";
        Source: Text;
        TXT001: Label 'PORTAL';
        TXT002: Label 'NAV';
        DateRange: Date;
        StartDate: Date;
        EndDate: Date;
        ReceiptsHeader1: Record "Receipts Header1";
        TotalNo: Integer;
        TransactionCategory: Text;
}

