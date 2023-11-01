report 99103 "Calendar Base Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Calendar Base Report.rdlc';
    Caption = '<Calendar Based Report>';

    dataset
    {
        dataitem(DimDate;DimDate)
        {
            RequestFilterFields = CalendarYear,MonthNumberOfYear;
            column(CName;ObjCInfo.Name)
            {
            }
            column(CPic;ObjCInfo.Picture)
            {
            }
            column(CAddress;ObjCInfo.Address)
            {
            }
            column(DateKey_DimDate;DimDate.DateKey)
            {
            }
            column(FullDateAlternateKey_DimDate;DimDate.FullDateAlternateKey)
            {
            }
            column(DayNumberOfWeek_DimDate;DimDate.DayNumberOfWeek)
            {
            }
            column(EnglishDayNameOfWeek_DimDate;DimDate.EnglishDayNameOfWeek)
            {
            }
            column(SpanishDayNameOfWeek_DimDate;DimDate.SpanishDayNameOfWeek)
            {
            }
            column(FrenchDayNameOfWeek_DimDate;DimDate.FrenchDayNameOfWeek)
            {
            }
            column(DayNumberOfMonth_DimDate;DimDate.DayNumberOfMonth)
            {
            }
            column(DayNumberOfYear_DimDate;DimDate.DayNumberOfYear)
            {
            }
            column(WeekNumberOfYear_DimDate;DimDate.WeekNumberOfYear)
            {
            }
            column(EnglishMonthName_DimDate;DimDate.EnglishMonthName)
            {
            }
            column(SpanishMonthName_DimDate;DimDate.SpanishMonthName)
            {
            }
            column(FrenchMonthName_DimDate;DimDate.FrenchMonthName)
            {
            }
            column(MonthNumberOfYear_DimDate;DimDate.MonthNumberOfYear)
            {
            }
            column(CalendarQuarter_DimDate;DimDate.CalendarQuarter)
            {
            }
            column(CalendarYear_DimDate;DimDate.CalendarYear)
            {
            }
            column(CalendarSemester_DimDate;DimDate.CalendarSemester)
            {
            }
            column(FiscalQuarter_DimDate;DimDate.FiscalQuarter)
            {
            }
            column(FiscalYear_DimDate;DimDate.FiscalYear)
            {
            }
            column(FiscalSemester_DimDate;DimDate.FiscalSemester)
            {
            }
            column(DayNumberInAMonth;DayNumberInAMonth)
            {
            }

            trigger OnAfterGetRecord()
            begin
                DayNumberInAMonth:=Format(Date2DMY(DimDate.FullDateAlternateKey,1));

                "Case Hearing".Reset;
                "Case Hearing".SetRange("Case Hearing"."Next Hearing Date",DimDate.FullDateAlternateKey);
                if "Case Hearing".FindSet then
                begin
                  repeat

                    DayNumberInAMonth:='<B>'+DayNumberInAMonth+'<B/>'+
                    '<br>'+"Case Hearing"."Case Entry";
                  until "Case Hearing".Next =0;
                end;

                DimDate.EnglishMonthName:=UpperCase(DimDate.EnglishMonthName);
            end;
        }
        dataitem("Case Hearing";"Case Hearing")
        {
            column(CaseEntry_CaseHearing;"Case Hearing"."Case Entry")
            {
            }
            column(LastHearingDate_CaseHearing;Format("Case Hearing"."Last Hearing Date"))
            {
            }
            column(Progress_CaseHearing;"Case Hearing".Progress)
            {
            }
            column(NextHearingDate_CaseHearing;Format("Case Hearing"."Next Hearing Date"))
            {
            }
            column(Day_CaseHearing;"Case Hearing".Day)
            {
            }
            column(AdvocateOnRecord_CaseHearing;"Case Hearing"."Advocate On Record")
            {
            }
            column(Decision_CaseHearing;"Case Hearing".Decision)
            {
            }
            column(BringUpDate_CaseHearing;Format("Case Hearing"."Bring Up Date"))
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

    trigger OnInitReport()
    begin
        ObjCInfo.Get;
        ObjCInfo.CalcFields(Picture);
    end;

    trigger OnPreReport()
    begin
        ObjCInfo.Get;
        ObjCInfo.CalcFields(Picture);
    end;

    var
        DayNumberInAMonth: Text[100];
        ObjCInfo: Record "Company Information";
}

