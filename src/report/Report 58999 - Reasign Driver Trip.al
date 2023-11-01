report 58999 "Reasign Driver Trip"
{
    ProcessingOnly = true;
    ShowPrintStatus = false;

    dataset
    {
        dataitem("Vehicle Driver Allocation";"Vehicle Driver Allocation")
        {

            trigger OnAfterGetRecord()
            begin
                TravelReq.Reset;
                TravelReq.SetRange("Requisition Number","Vehicle Driver Allocation"."Requisition Number");
                TravelReq.SetRange("Driver Code","Vehicle Driver Allocation"."Driver Code");
                if TravelReq.FindFirst then begin
                  Message('Reasigning %1',TravelReq."Driver Name");
                  TravelReq."Reassigned?" := true;
                  TravelReq."New Trip" := Req;
                  TravelReq."Date Reassigned" := Today;
                  TravelReq.Modify;
                  //TravelReq1.INIT;
                  TravelReq1."Driver Code" := TravelReq."Driver Code";
                  TravelReq1.Validate("Driver Code");
                  TravelReq1."Requisition Number":= Req;
                  TravelReq1."Number of Days" := TravelReq."Number of Days";
                  TravelReq1."Date of Trip" := TravelDate;
                  TravelReq1.Validate("Number of Days");
                  TravelReq1.Validate("Date of Trip");
                  if TravelReq1.Insert() then
                    Message('%1 Reassigened to trip %2',TravelReq1."Driver Name",Req);
                end;
            end;

            trigger OnPreDataItem()
            begin
                if Req = '' then
                  Error('Please select new trip');
                if TravelDate = 0D then
                  Error('Please select new trip Date');
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
                    field("New Travel Date";TravelDate)
                    {
                        NotBlank = true;
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
        TravelReq: Record "Vehicle Driver Allocation";
        TravelReq1: Record "Vehicle Driver Allocation";
        TravelDate: Date;
}

