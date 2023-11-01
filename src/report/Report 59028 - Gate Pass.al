report 59028 "Gate Pass"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Gate Pass.rdlc';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem("Transport Req Gate Pass";"Transport Req Gate Pass")
        {
            column(Commencement_TransportReqGatePass;"Transport Req Gate Pass".Commencement)
            {
            }
            column(Destination_TransportReqGatePass;"Transport Req Gate Pass".Destination)
            {
            }
            column(EmployeeName_TransportReqGatePass;"Transport Req Gate Pass"."Employee Name")
            {
            }
            column(GatePassSerialNo_TransportReqGatePass;"Transport Req Gate Pass"."Gate Pass Serial No")
            {
            }
            column(EmployeeNo_TransportReqGatePass;"Transport Req Gate Pass"."Employee No")
            {
            }
            column(RequestedBy_TransportReqGatePass;"Transport Req Gate Pass"."Requested By")
            {
            }
            column(DateofTrip_TransportReqGatePass;"Transport Req Gate Pass"."Date of Trip")
            {
            }
            column(CI_Picture;CI.Picture)
            {
            }
            column(CI_Address;CI.Address)
            {
            }
            column(CI__Address_2______CI__Post_Code_;CI."Address 2"+' '+CI."Post Code")
            {
            }
            column(CI_City;CI.City)
            {
            }
            column(CI_PhoneNo;CI."Phone No.")
            {
            }
            column(User1;Users."User ID")
            {
            }
            column(User2;Users1."User ID")
            {
            }
            column(User3;Users2."User ID")
            {
            }
            column(SenderDate;MAccDAte)
            {
            }
            column(Approver1Date;"FM Date")
            {
            }
            column(Approver2Date;MTrusteeDate)
            {
            }
            column(User1Sign;Users.Picture)
            {
            }
            column(User2Sign;Users1.Picture)
            {
            }
            column(User3Sign;Users2.Picture)
            {
            }
            column(COMPANYNAME;CompanyName)
            {
            }
            dataitem("Fleet Requisition Items";"Fleet Requisition Items")
            {
                DataItemLink = "Requisition Number"=FIELD("Transport Requisition No");
                column(ItemType_FleetRequisitionItems;"Fleet Requisition Items"."Item Type")
                {
                }
                column(Description_FleetRequisitionItems;"Fleet Requisition Items".Description)
                {
                }
                column(Quantity_FleetRequisitionItems;"Fleet Requisition Items".Quantity)
                {
                }
                column(RequisitionNumber_FleetRequisitionItems;"Fleet Requisition Items"."Requisition Number")
                {
                }
                column(Purpose_FleetRequisitionItems;"Fleet Requisition Items".Purpose)
                {
                }
                column(Returnable_FleetRequisitionItems;Format("Fleet Requisition Items".Returnable))
                {
                }
                column(ItemReturneddate;"Fleet Requisition Items"."Item Return Date")
                {
                }
                column(SerialNumber_FleetRequisitionItems;"Fleet Requisition Items"."Serial Number")
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                i:=1;
                Approval.Reset;
                Approval.SetRange(Approval."Table ID",59028);
                //Approval.SETRANGE(Approval."Document Type","Purchase Header"."Document Type"::"Store Requisition");
                Approval.SetRange(Approval."Document No.","Transport Req Gate Pass"."Transport Requisition No");
                Approval.SetRange(Approval.Status,Approval.Status::Approved);

                if Approval.Find('-') then begin
                repeat
                //Users.GET(Approval."Sender ID");
                //Users.CALCFIELDS(Picture);
                //MESSAGE('%1',Approval."Approver ID");

                if i=1 then begin
                if Users.Get(Approval."Approver ID") then
                Users.CalcFields(Picture);
                MAccDAte:=Approval."Last Date-Time Modified";
                end;



                if i=2 then begin
                if Users1.Get(Approval."Approver ID") then
                Users1.CalcFields(Picture);
                "FM Date":=Approval."Last Date-Time Modified";
                end;

                if i=3 then begin
                if Users2.Get(Approval."Approver ID") then
                Users2.CalcFields(Picture);
                MTrusteeDate:=Approval."Last Date-Time Modified";

                end;

                i:=i+1;
                until Approval.Next=0;
                end;
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

    trigger OnInitReport()
    begin
        CI.Get;
        CI.CalcFields(Picture);
    end;

    var
        CI: Record "Company Information";
        Approval: Record "Approval Entry";
        Users: Record "User Setup";
        "MA Sign": BigText;
        "MA Date": DateTime;
        Users1: Record "User Setup";
        Users2: Record "User Setup";
        "FM Date": DateTime;
        "MT Date": DateTime;
        Approval1: Record "Approval Entry";
        Approval2: Record "Approval Entry";
        CompInfo: Record "Company Information";
        i: Integer;
        MTrusteeDate: DateTime;
        MAccDAte: DateTime;
        DocDim: Record "Dimension Set Entry";
        Branch: Code[20];
        Profit: Code[20];
        Dep: Code[20];
        IR_DisclaimerMessage: Text[100];
        PMTitle: Text[100];
        CMTitle: Text[100];
}

