report 70116 "PRN Tracker List"
{
    DefaultLayout = RDLC;
    RDLCLayout = './PRN Tracker List.rdlc';

    dataset
    {
        dataitem("Purchase Header";"Purchase Header")
        {
            DataItemTableView = WHERE("Document Type"=FILTER("Blanket Order"|Order));
            column(AssignedUserID_PurchaseHeader;"Purchase Header"."Assigned User ID")
            {
            }
            column(COMPANY;CompanyInfo.Name)
            {
            }
            column(logo;CompanyInfo.Picture)
            {
            }
            column(PostCode;CompanyInfo."Post Code")
            {
            }
            column(City;CompanyInfo.City)
            {
            }
            column(Address;CompanyInfo.Address)
            {
            }
            column(Address2;CompanyInfo."Address 2")
            {
            }
            column(DocumentDate_PurchaseHeader;"Purchase Header"."Document Date")
            {
            }
            column(DocumentType_PurchaseHeader;"Purchase Header"."Document Type")
            {
            }
            column(BuyfromVendorNo_PurchaseHeader;"Purchase Header"."Buy-from Vendor No.")
            {
            }
            column(No_PurchaseHeader;"Purchase Header"."No.")
            {
            }
            column(PaytoName_PurchaseHeader;"Purchase Header"."Pay-to Name")
            {
            }
            column(DueDate_PurchaseHeader;"Purchase Header"."Due Date")
            {
            }
            column(Amount_PurchaseHeader;"Purchase Header".Amount)
            {
            }
            column(RequisitionNo_PurchaseHeader;"Purchase Header"."Requisition No")
            {
            }
            column(IFSLinked_PurchaseHeader;"Purchase Header"."IFS Linked")
            {
            }
            column(InvitationForSupplyNo_PurchaseHeader;"Purchase Header"."Invitation For Supply No")
            {
            }
            column(IFSCode_PurchaseHeader;"Purchase Header"."IFS Code")
            {
            }
            dataitem("Purch. Inv. Header";"Purch. Inv. Header")
            {
                DataItemLink = "Order No."=FIELD("No.");
                column(No_PurchInvHeader;"Purch. Inv. Header"."No.")
                {
                }
                column(DocumentDate_PurchInvHeader;"Purch. Inv. Header"."Document Date")
                {
                }
            }
            dataitem(Prn;"Purchase Header")
            {
                DataItemLink = "No."=FIELD("Requisition No");
                column(No_Prn;Prn."No.")
                {
                }
                column(Description_Prn;Prn.Description)
                {
                }
                column(RequisitionAmount_Prn;Prn."Requisition Amount")
                {
                }
                column(RequestByNo_Prn;Prn."Request-By No.")
                {
                }
                column(RequestByName_Prn;Prn."Request-By Name")
                {
                }
                column(RequesterID_Prn;Prn."Requester ID")
                {
                }
                column(RemainingBudget_Prn;Prn."Remaining Budget")
                {
                }
                column(ProcurementPlanID_Prn;Prn."Procurement Plan ID")
                {
                }
                column(ProcurementPlanEntryNo_Prn;Prn."Procurement Plan Entry No")
                {
                }
                column(PPPlanningCategory_Prn;Prn."PP Planning Category")
                {
                }
                column(PPFundingSourceID_Prn;Prn."PP Funding Source ID")
                {
                }
                column(PPTotalBudget_Prn;Prn."PP Total Budget")
                {
                }
                column(PPTotalActualCosts_Prn;Prn."PP Total Actual Costs")
                {
                }
                column(PPTotalCommitments_Prn;Prn."PP Total Commitments")
                {
                }
                column(PPTotalAvailableBudget_Prn;Prn."PP Total Available Budget")
                {
                }
                column(PPSolicitationType_Prn;Prn."PP Solicitation Type")
                {
                }
                column(PPProcurementMethod_Prn;Prn."PP Procurement Method")
                {
                }
                column(PPPreferenceReservationCode_Prn;Prn."PP Preference/Reservation Code")
                {
                }
                column(PRNConversionProcedure_Prn;Prn."PRN Conversion Procedure")
                {
                }
                column(OrderedPRN_Prn;Prn."Ordered PRN")
                {
                }
                column(LinkedIFSNo_Prn;Prn."Linked IFS No.")
                {
                }
                column(LinkedLPONo_Prn;Prn."Linked LPO No.")
                {
                }
            }
            dataitem("Purch. Rcpt. Header";"Purch. Rcpt. Header")
            {
                DataItemLink = "Order No."=FIELD("No.");
                column(No_PurchRcptHeader;"Purch. Rcpt. Header"."No.")
                {
                }
                column(OrderNo_PurchRcptHeader;"Purch. Rcpt. Header"."Order No.")
                {
                }
                column(DocumentDate_PurchRcptHeader;"Purch. Rcpt. Header"."Document Date")
                {
                }
            }
            dataitem("Inspection Header1";"Inspection Header1")
            {
                DataItemLink = "Order No"=FIELD("No.");
                column(InspectionNo_InspectionHeader1;"Inspection Header1"."Inspection No")
                {
                }
                column(OrderNo_InspectionHeader1;"Inspection Header1"."Order No")
                {
                }
                column(CommiteeAppointmentNo_InspectionHeader1;"Inspection Header1"."Commitee Appointment No")
                {
                }
                column(InspectionDate_InspectionHeader1;"Inspection Header1"."Inspection Date")
                {
                }
            }
            dataitem("Standard Purchase Code";"Standard Purchase Code")
            {
                DataItemLink = Code=FIELD("IFS Code");
                column(Code_StandardPurchaseCode;"Standard Purchase Code".Code)
                {
                }
                column(Description_StandardPurchaseCode;"Standard Purchase Code".Description)
                {
                }
                column(DocumentDate_StandardPurchaseCode;"Standard Purchase Code"."Document Date")
                {
                }
                column(TenderName_StandardPurchaseCode;"Standard Purchase Code"."Tender Name")
                {
                }
                column(PRNNo_StandardPurchaseCode;"Standard Purchase Code"."PRN No.")
                {
                }
                dataitem("Bid Tabulation Header";"Bid Tabulation Header")
                {
                    DataItemLink = "IFS Code"=FIELD(Code);
                    DataItemTableView = WHERE("Document Type"=CONST("Professional Opinion"));
                    column(Code_BidTabulationHeader;"Bid Tabulation Header".Code)
                    {
                    }
                    column(DocumentType_BidTabulationHeader;"Bid Tabulation Header"."Document Type")
                    {
                    }
                    column(IFSCode_BidTabulationHeader;"Bid Tabulation Header"."IFS Code")
                    {
                    }
                    column(DocumentDate_BidTabulationHeader;"Bid Tabulation Header"."Document Date")
                    {
                    }
                    column(FinalEvaluationReportID_BidTabulationHeader;"Bid Tabulation Header"."Final Evaluation Report ID")
                    {
                    }
                    column(Description_BidTabulationHeader;"Bid Tabulation Header".Description)
                    {
                    }
                    column(RaisedBy_BidTabulationHeader;"Bid Tabulation Header"."Raised By")
                    {
                    }
                    column(BidOpeningDate_BidTabulationHeader;"Bid Tabulation Header"."Bid Opening Date")
                    {
                    }
                    column(AppointedBidOpeningComm_BidTabulationHeader;"Bid Tabulation Header"."Appointed Bid Opening Comm")
                    {
                    }
                    column(AppointedBidEvaluationCom_BidTabulationHeader;"Bid Tabulation Header"."Appointed Bid Evaluation Com")
                    {
                    }
                    column(ProfessionalOpinionID_BidTabulationHeader;"Bid Tabulation Header"."Professional Opinion ID")
                    {
                    }
                    column(GeneralProcurementRemarks_BidTabulationHeader;"Bid Tabulation Header"."General Procurement Remarks")
                    {
                    }
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
        CompanyInfo.Get;
        CompanyInfo.CalcFields(Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
}

