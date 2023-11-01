report 85110 "Quarterly Registration Sources"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Quarterly Registration Sources.rdlc';

    dataset
    {
        dataitem("Student Processing Header";"Student Processing Header")
        {
            DataItemTableView = WHERE("Document Type"=FILTER(Registration),Posted=CONST(true));
            column(PostedDate_StudentProcessingHeader;PostedMonth)
            {
            }
            column(No_StudentProcessingHeader;"Student Processing Header"."No.")
            {
            }
            column(ExaminationID_StudentProcessingHeader;"Student Processing Header"."Examination ID")
            {
            }
            column(StartDate;StartDate)
            {
            }
            column(EndDate;EndDate)
            {
            }
            column(PostedMonthInt;PostedMonthInt)
            {
            }
            column(SourceofInformation_StudentProcessingHeader;"Student Processing Header"."Source of Information")
            {
            }
            column(InformationSourceName_StudentProcessingHeader;"Student Processing Header"."Information Source Name")
            {
            }

            trigger OnAfterGetRecord()
            begin
                PostedMonthInt:=0;
                PostedMonth:='';

                //MESSAGE('%1--%2--%3',CREATEDATETIME(StartDate,0T),CREATEDATETIME(EndDate,2359T),"Student Processing Header"."No.");
                PostedDate:=DT2Date("Student Processing Header"."Posted On");
                if (PostedDate >= StartDate) and (PostedDate <= EndDate) then begin
                  PostedMonth:=Format(PostedDate,0,'<Month Text>');
                  PostedMonthInt:=Date2DMY(PostedDate,2);
                end
            end;

            trigger OnPreDataItem()
            var
                TXT001: Label 'Kindly select the start month of the quarter';
            begin
                if StartDate=0D then
                  Error(TXT001);
                EndDate:=CalcDate('<+2M>',StartDate);
                "Student Processing Header".SetRange("Student Processing Header"."Posted On",CreateDateTime(StartDate,0T),CreateDateTime(EndDate,235900T));
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field("Start Date";StartDate)
                {
                    ShowMandatory = true;
                    TableRelation = "Accounting Period"."Starting Date";
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    var
        StartDate: Date;
        EndDate: Date;
        PostedMonth: Text;
        PostedDate: Date;
        PostedMonthInt: Integer;
}

