report 59000 "Reasign Employee Trip"
{
    ProcessingOnly = true;
    ShowPrintStatus = false;

    dataset
    {
        dataitem("Travel Requisition Staff";"Travel Requisition Staff")
        {

            trigger OnAfterGetRecord()
            begin
                TravelReq.Reset;
                TravelReq.SetRange("Req No","Travel Requisition Staff"."Req No");
                TravelReq.SetRange("Employee No","Travel Requisition Staff"."Employee No");
                if TravelReq.FindFirst then begin
                  Message('Reasigning %1',TravelReq."Employee Name");
                  TravelReq."Reassigned?" := true;
                  TravelReq."New Trip" := Req;
                  TravelReq."Date Reassigned" := Today;
                  TravelReq.Modify;
                  //TravelReq1.INIT;
                  TravelReq1."Employee No" := TravelReq."Employee No";
                  TravelReq1.Validate("Employee No");
                  TravelReq1."Req No" := Req;
                  TravelReq1.Position := TravelReq.Position;
                  TravelReq1."Trip End Date" := TravelReq."Trip End Date";
                  TravelReq1."No of Days Requested" := TravelReq."No of Days Requested";
                  TravelReq1."Date of Trip" := TravelReq."Date of Trip";
                  TravelReq1."Daily Work Ticket" := TravelReq."Daily Work Ticket";
                  if TravelReq1.Insert() then
                    Message('%1 Reassigened to trip %2',TravelReq1."Employee Name",Req);
                end;
            end;

            trigger OnPreDataItem()
            begin
                if Req = '' then
                  Error('Please select new trip');
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                group("New Trip To Assign")
                {
                    field("New Trip";Req)
                    {
                        NotBlank = true;
                        TableRelation = "Transport Requisition"."Transport Requisition No" WHERE (Status=FILTER(Approved));
                    }
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
        Req: Code[50];
        TravelReq: Record "Travel Requisition Staff";
        TravelReq1: Record "Travel Requisition Staff";
}

