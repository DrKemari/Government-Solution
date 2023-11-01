report 59006 "Reassign Vehicle"
{
    ProcessingOnly = true;
    ShowPrintStatus = false;

    dataset
    {
        dataitem("Transport Requisition";"Transport Requisition")
        {
            RequestFilterFields = "Transport Requisition No";

            trigger OnAfterGetRecord()
            begin
                if Req = '' then
                  Error('Select new requisition');
                TR.Reset;
                TR.SetRange("Transport Requisition No","Transport Requisition No");
                if TR.Find('-') then begin
                  TR1.Reset;
                  TR1.SetRange("Transport Requisition No",Req);
                  if TR1.Find('-') then begin
                    TR1."Vehicle Allocated" := TR."Vehicle Allocated";
                    TR1.Modify;
                  end;
                  TR."Vehicle Allocated" :='';
                  TR.Modify;
                  Message('Vehicle allocation successful');
                end;
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
        Req: Code[30];
        TR: Record "Transport Requisition";
        TR1: Record "Transport Requisition";
}

