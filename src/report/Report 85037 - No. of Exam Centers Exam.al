report 85037 "No. of Exam Centers Exam"
{
    DefaultLayout = RDLC;
    RDLCLayout = './No. of Exam Centers Exam.rdlc';

    dataset
    {
        dataitem(Courses;Courses)
        {
            column(Logo;CI.Picture)
            {
            }
            column(Code_Courses;Courses.Code)
            {
            }
            column(DomainID_Courses;Courses."Domain ID")
            {
            }
            column(Description_Courses;Courses.Description)
            {
            }
            dataitem("Center Course Capacity";"Center Course Capacity")
            {
                DataItemLink = "Course Id"=FIELD(Code);
                column(Code_CenterCourseCapacity;"Center Course Capacity".Code)
                {
                }
                column(CenterCode_CenterCourseCapacity;"Center Course Capacity"."Centre Code")
                {
                }
                column(ZoneCode_CenterCourseCapacity;"Center Course Capacity"."Zone Code")
                {
                }
                column(CenterName;CenterName)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    ExamCenter.Reset;
                    ExamCenter.SetRange(Code,"Center Course Capacity"."Centre Code");
                    if ExamCenter.FindFirst then begin
                     CenterName:=ExamCenter.Name;
                    end
                end;
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
        ExamCenter: Record "Examination Centres";
        CenterName: Text;
}

