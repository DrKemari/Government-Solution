report 85093 "Student Registration By Gender"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Student Registration By Gender.rdlc';

    dataset
    {
        dataitem("Student Processing Header";"Student Processing Header")
        {
            DataItemTableView = WHERE("Document Type"=FILTER(Registration),Posted=FILTER(true));
            RequestFilterFields = "Posted Date";
            column(Logo;CI.Picture)
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
            column(StudentNo_StudentProcessingHeader;"Student Processing Header"."Student No.")
            {
            }
            column(StudentName_StudentProcessingHeader;"Student Processing Header"."Student Name")
            {
            }
            column(Gender_StudentProcessingHeader;"Student Processing Header".Gender)
            {
            }
            column(PostedDate_StudentProcessingHeader;"Student Processing Header"."Posted Date")
            {
            }
            dataitem("Examination Account";"Examination Account")
            {
                DataItemLink = "Student Cust No."=FIELD("Student No."),"Course ID"=FIELD("Examination ID");
                column(RegistrationNo_ExaminationAccount;"Examination Account"."Registration No.")
                {
                }
                column(StudentCustNo_ExaminationAccount;"Examination Account"."Student Cust No.")
                {
                }
                column(CourseID_ExaminationAccount;"Examination Account"."Course ID")
                {
                }
                column(CourseDescription_ExaminationAccount;"Examination Account"."Course Description")
                {
                }
                column(UpperDate;UpperDate)
                {
                }
                column(LowerDate;LowerDate)
                {
                }
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

        LowerDate:="Student Processing Header".GetRangeMin("Student Processing Header"."Posted Date");
        UpperDate:="Student Processing Header".GetRangeMax("Student Processing Header"."Posted Date");
    end;

    var
        CI: Record "Company Information";
        UpperDate: Date;
        LowerDate: Date;
}

