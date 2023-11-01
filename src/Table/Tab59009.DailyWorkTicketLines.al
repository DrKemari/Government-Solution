#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Table 59009 "Daily Work Ticket Lines"
{

    fields
    {
        field(1;"Transport Requisition No";Code[20])
        {
            TableRelation = "Transport Requisition"."Transport Requisition No" where (Status=filter(Approved|Closed));

            trigger OnValidate()
            begin
                    if  TransReq.Get("Transport Requisition No") then begin
                        Commencement:=TransReq.Commencement;
                        Destination:=TransReq.Destination;
                        "Vehicle Allocated":=TransReq."Vehicle Allocated";
                        "Driver Allocated":=TransReq."Driver Allocated";
                        "Date of Request":=TransReq."Date of Request";
                        "Opening Odometer Reading":=TransReq."Opening Odometer Reading";
                        TransReq."Loaded to WorkTicket":=true;
                        //MESSAGE("Driver Allocated");
                        employee.Reset;
                        employee.SetRange("No.","Driver Allocated");
                        if employee.FindSet then
                          "Driver Name":= employee."First Name"+' '+employee."Middle Name"+ ' '+employee."Last Name";
                         TransReq.Modify;
                    end;
            end;
        }
        field(2;Commencement;Text[30])
        {
        }
        field(3;Destination;Text[30])
        {
        }
        field(4;"Vehicle Allocated";Code[20])
        {
            TableRelation = "Fleet Vehicles."."Registration No.";

            trigger OnValidate()
            begin
                FleetVehicles.Reset;
                FleetVehicles.SetRange("Registration No.","Vehicle Allocated");
                if FleetVehicles.FindFirst then
                  "Opening Odometer Reading" := FleetVehicles."Current Odometer Reading";
            end;
        }
        field(5;"Driver Allocated";Code[20])
        {
            TableRelation = "Vehicle Drivers".Driver;
        }
        field(7;"Date of Request";Date)
        {
        }
        field(9;"Opening Odometer Reading";Decimal)
        {
            DecimalPlaces = 0:0;
        }
        field(11;"Daily Work Ticket";Code[20])
        {
        }
        field(12;"Closing Odometer Reading";Decimal)
        {
            DecimalPlaces = 0:0;

            trigger OnValidate()
            begin
                    /* IF "Closing Odometer Reading"<>0 THEN BEGIN
                     IF "Closing Odometer Reading"< "Opening Odometer Reading" THEN
                         ERROR(Text002);
                     "Total Kilometres":="Closing Odometer Reading"-"Opening Odometer Reading";
                      END ELSE
                         "Total Kilometres":=0;*/

            end;
        }
        field(15;"Total Kilometres";Decimal)
        {
            DecimalPlaces = 0:0;
        }
        field(16;EntryNo;Integer)
        {
            AutoIncrement = true;
        }
        field(17;"Time out";Time)
        {
        }
        field(18;"Time In";Time)
        {
        }
        field(19;"Fuel Drawn(Litres)";Decimal)
        {
        }
        field(20;"Order No";Code[20])
        {
        }
        field(21;"Authorized By";Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Vehicle Drivers".Driver;

            trigger OnValidate()
            begin
                   if  HrEmployee.Get("Authorized By") then begin
                    "Authorized By":=HrEmployee."First Name"+' '+HrEmployee."Middle Name"+' '+HrEmployee."Last Name";
                   end;
            end;
        }
        field(22;Position;Text[30])
        {
        }
        field(23;"Driver Name";Text[50])
        {
        }
        field(24;ReceiptNo;Text[50])
        {
            DataClassification = ToBeClassified;
        }
        field(25;"Oil Drawn(Litres)";Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(26;"Journey/Route";Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(27;"GOK Officer";Text[150])
        {
            DataClassification = ToBeClassified;
        }
        field(28;Date;Date)
        {
            DataClassification = ToBeClassified;
        }
        field(29;"Authorized By Name";Text[100])
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1;"Daily Work Ticket",EntryNo)
        {
            Clustered = true;
            SumIndexFields = "Total Kilometres";
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
          /* WorkTktHder.RESET;
           WorkTktHder.SETRANGE(WorkTktHder."Daily Work Ticket","Daily Work Ticket");
           IF WorkTktHder.FIND('-') THEN BEGIN
              WorkTktHder.TESTFIELD(Status,WorkTktHder.Status::Open);
           END;
        
            IF  TransReq.GET("Transport Requisition No") THEN BEGIN
        
                 TransReq."Loaded to WorkTicket":=FALSE;
                 TransReq.MODIFY;
            END;*/

    end;

    trigger OnInsert()
    begin
           WorkTktHder.Reset;
           WorkTktHder.SetRange(WorkTktHder."Daily Work Ticket","Daily Work Ticket");
           if WorkTktHder.Find('-') then begin
              if "Vehicle Allocated"<>WorkTktHder."Vehicle Registration No" then
                 "Vehicle Allocated" := WorkTktHder."Vehicle Registration No";
              "Driver Allocated" := WorkTktHder."Driver Allocated";
              "Driver Name" := WorkTktHder."Driver Name";
           end;
    end;

    var
        TransReq: Record "Transport Requisition";
        employee: Record Employee;
        WorkTktHder: Record "Dialy Work Ticket Header";
        FleetVehicles: Record "Fleet Vehicles.";
        HrEmployee: Record Employee;
}

