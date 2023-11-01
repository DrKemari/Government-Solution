report 85026 "Student Timetable"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Student Timetable.rdlc';

    dataset
    {
        dataitem("Student Processing Header";"Student Processing Header")
        {
            RequestFilterFields = "No.","Examination Sitting";
            column(Logo;CI.Picture)
            {
            }
            column(Name;CI.Name)
            {
            }
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
            column(IssuerName;IssuerName)
            {
            }
            column(Signatory;UserSetup.Picture)
            {
            }
            column(No_StudentProcessingHeader;"Student Processing Header"."No.")
            {
            }
            column(Labeltxt;Labeltxt)
            {
            }
            column(VisibleLabel;VisibleLabel)
            {
            }
            column(Date_StudentProcessingHeader;StudentDate)
            {
            }
            column(DocumentType_StudentProcessingHeader;"Student Processing Header"."Document Type")
            {
            }
            column(StudentNo_StudentProcessingHeader;"Student Processing Header"."Student Reg. No.")
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
            column(IDNumberPassportNo_StudentProcessingHeader;"Student Processing Header"."ID Number/Passport No.")
            {
            }
            column(Surname_StudentProcessingHeader;"Student Processing Header".Surname)
            {
            }
            column(Image_StudentProcessingHeader;"Student Processing Header".Image)
            {
            }
            column(ExaminationCenter_StudentProcessingHeader;"Student Processing Header"."Examination Center")
            {
            }
            column(SittingCycle_StudentProcessingLines;"Student Processing Header"."Examination Sitting")
            {
            }
            column(Address_StudentProcessingHeader;"Student Processing Header".Address)
            {
            }
            column(Address2_StudentProcessingHeader;"Student Processing Header"."Address 2")
            {
            }
            column(City_StudentProcessingHeader;"Student Processing Header".City)
            {
            }
            column(CountryRegionCode_StudentProcessingHeader;"Student Processing Header"."Country/Region Code")
            {
            }
            column(PhoneNo_StudentProcessingHeader;"Student Processing Header"."Phone No.")
            {
            }
            column(PostCode_StudentProcessingHeader;"Student Processing Header"."Post Code")
            {
            }
            column(ExamLevel;ExamLevel)
            {
            }
            dataitem("Student Processing Lines";"Exam Booking Entries")
            {
                DataItemLink = "Student Reg No."=FIELD("Student Reg. No.");
                DataItemTableView = WHERE(Cancelled=FILTER(false),Blocked=FILTER(false),Status=CONST(Open));
                column(CourseId_StudentProcessingLines;"Student Processing Lines".Examination)
                {
                }
                column(Section_StudentProcessingLines;"Student Processing Lines".Section)
                {
                }
                column(Part_StudentProcessingLines;"Student Processing Lines".Part)
                {
                }
                column(Paper_StudentProcessingLines;"Student Processing Lines".Paper)
                {
                }
                column(Description_StudentProcessingLines;"Student Processing Lines".Description)
                {
                }
                column(CurrencyCode_StudentProcessingLines;"Student Processing Lines"."Currency Code")
                {
                }
                column(Amount_StudentProcessingLines;"Student Processing Lines"."Fee Amount")
                {
                }
                column(AmountLCY_StudentProcessingLines;"Student Processing Lines"."Fee Amount LCY")
                {
                }
                column(RegistrationNo_StudentProcessingLines;"Student Processing Lines"."Student Reg No.")
                {
                }
                column(Name_StudentProcessingLines;"Student Processing Lines".Description)
                {
                }
                column(PreferredExamCenter_StudentProcessingLines;"Student Processing Lines"."Exam Center")
                {
                }
                column(Year_StudentProcessingLines;"Student Processing Lines".Year)
                {
                }
                column(Blocked_StudentProcessingLines;"Student Processing Lines".Blocked)
                {
                }
                column(LastModifiedDateTime_StudentProcessingLines;"Student Processing Lines"."Last Modified Date Time")
                {
                }
                column(LastDateModified_StudentProcessingLines;"Student Processing Lines"."Last Date Modified")
                {
                }
                column(PaperDate;PaperDate)
                {
                }
                column(PaperTime;PaperTime)
                {
                }
                column(PaperEndTime;PaperEndTime)
                {
                }
                column(Day;Day)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    //get the planning lines
                    PaperDate:='';
                    PaperTime:='';
                      PaperEndTime:='';
                    TimetablePlannerLines.Reset;
                    TimetablePlannerLines.SetRange("Exam Sitting ID","Student Processing Header"."Examination Sitting");
                    TimetablePlannerLines.SetRange(Paper,"Student Processing Lines".Paper);
                    if TimetablePlannerLines.FindSet then begin
                      Day:=TimetablePlannerLines.Day;
                      PaperDate:=Format(TimetablePlannerLines.Date,0,'<Day,2>/<Month,2>/<Year4>');
                      PaperTime:=Format(TimetablePlannerLines."Start Time",0,'<Hours12,2>:<Minutes,2> <AM/PM>');
                      PaperEndTime:=Format(TimetablePlannerLines."End Time",0,'<Hours12,2>:<Minutes,2> <AM/PM>');
                      ExamLevel:=TimetablePlannerLines.Part
                    end;
                end;
            }

            trigger OnAfterGetRecord()
            var
                TXT001: Label 'The student %1,must have a valid photo on the student card';
                TXT002: Label 'The timetable for %1 examinations is not yet approved,Kindly await approval';
            begin
                TimetableHeader.Reset;
                TimetableHeader.SetRange("Exam Sitting ID","Student Processing Header"."Examination Sitting");
                if TimetableHeader.FindFirst then begin
                  NewDateValue:=CalcDate('+21D',Today);
                  if NewDateValue>=TimetableHeader."Exam Start Date" then
                    VisibleLabel:=false else
                    VisibleLabel:=true;

                end;

                // if not "Student Processing Header".Image.HasValue then
                //  Error(TXT001,"Student Processing Header"."Student No.");
                StudentDate:=Format("Student Processing Header"."Posted Date",0,'<Day, 2>  <Month Text> <Year4>');
            end;

            trigger OnPostDataItem()
            var
                TXT001: Label 'The student %1,must have a valid photo on the student card';
            begin
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
        CompanyInfo.Get;
        ExaminationSetup.Get;
        Employee.Reset;
        Employee.SetRange("User ID",ExaminationSetup."Timetable Issuer");
        if Employee.FindFirst then begin
         IssuerName:=Employee.Initials;

        end;
        // UserSetup.Reset;
        // UserSetup.SetRange("User ID",ExaminationSetup."Timetable Issuer");
        // if UserSetup.FindFirst then begin
        //   UserSetup.CalcFields(Picture);
        // end;
    end;

    var
        TimetablePlannerLines: Record "Timetable Planner Lines";
        PaperDate: Text;
        PaperTime: Text;
        PaperEndTime: Text;
        Customer: Record Customer;
        StudentHeader: Record "Student Processing Header";
        CustPic: OutStream;
        CI: Record "Company Information";
        CompanyInfo: Record "Company Information";
        Day: Text;
        ExaminationSetup: Record "Examination Setup";
        IssuerName: Text;
        Employee: Record Employee;
        ExamLevel: Code[20];
        StudentDate: Text;
        UserSetup: Record "User Setup";
        Labeltxt: Label 'PROVISIONAL';
        TimetableHeader: Record "Timetable Planner Header";
        VisibleLabel: Boolean;
        NewDateValue: Date;
}

