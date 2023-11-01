report 55002 "Agenda Vote Item Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Agenda Vote Item Report.rdlc';

    dataset
    {
        dataitem("Board Meetings";"Board Meetings")
        {
            dataitem("Agenda vote items";"Agenda vote items")
            {
                DataItemLink = "Meeting No"=FIELD(No);
                column(ItemNo_Agendavoteitems;"Agenda vote items"."Item No")
                {
                }
                column(MeetingNo_Agendavoteitems;"Agenda vote items"."Meeting No")
                {
                }
                column(AgendaNo_Agendavoteitems;"Agenda vote items"."Agenda No")
                {
                }
                column(Description_Agendavoteitems;"Agenda vote items".Description)
                {
                }
                column(YesCount_Agendavoteitems;"Agenda vote items"."Yes Count")
                {
                }
                column(NoCount_Agendavoteitems;"Agenda vote items"."No Count")
                {
                }
                column(AbstainCount_Agendavoteitems;"Agenda vote items"."Abstain Count")
                {
                }
                column(TotalVotes_Agendavoteitems;"Agenda vote items"."Total Votes")
                {
                }
                column(Status_Agendavoteitems;"Agenda vote items".Status)
                {
                }
                column(VotestartDate_Agendavoteitems;"Agenda vote items"."Vote start Date")
                {
                }
                column(VotestartTime_Agendavoteitems;"Agenda vote items"."Vote start Time")
                {
                }
                column(VoteEndadate_Agendavoteitems;"Agenda vote items"."Vote Enda date")
                {
                }
                column(VoteEndaTime_Agendavoteitems;"Agenda vote items"."Vote Enda Time")
                {
                }
                column(CName;ObjCinfo.Name)
                {
                }
                column(CPic;ObjCinfo.Picture)
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
        ObjCinfo.Get;
        ObjCinfo.CalcFields(Picture);
    end;

    var
        ObjCinfo: Record "Company Information";
}

