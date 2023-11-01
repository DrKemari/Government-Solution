report 99104 "Archived Cases New"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Archived Cases New.rdlc';

    dataset
    {
        dataitem("Case Register";"Case Register")
        {
            DataItemTableView = WHERE(Status=FILTER(Closed));
            column(NatureofClaim_CaseRegister;"Case Register"."Nature of Claim")
            {
            }
            column(CaseNumber_CaseRegister;"Case Register"."Case Number")
            {
            }
            column(CaseTypes_CaseRegister;"Case Register"."Case Types")
            {
            }
            column(NatureofDescription_CaseRegister;"Case Register"."Nature of Description")
            {
            }
            column(NameofParties_CaseRegister;"Case Register"."Name of Parties")
            {
            }
            column(No_CaseRegister;"Case Register"."No.")
            {
            }
            dataitem("Case Hearing";"Case Hearing")
            {
                DataItemLink = "Case Entry"=FIELD("No.");
                DataItemTableView = WHERE("Case Entry"=FILTER(<>''));
                RequestFilterFields = "Last Hearing Date","Next Hearing Date","Advocate On Record";
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
                column(Cname;ObjCInfo.Name)
                {
                }
                column(Pic;ObjCInfo.Picture)
                {
                }
                column(Adress1;ObjCInfo.Address)
                {
                }
                column(Adress2;ObjCInfo."Address 2")
                {
                }

                trigger OnAfterGetRecord()
                begin
                    if "Case Hearing"."Case Entry" ='' then
                      CurrReport.Skip;
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

    trigger OnInitReport()
    begin
        ObjCInfo.Get;
        ObjCInfo.CalcFields(Picture);
    end;

    var
        ObjCInfo: Record "Company Information";
}

