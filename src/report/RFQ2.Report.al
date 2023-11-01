#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0204, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings

Report 70068 RFQ2
{
    RDLCLayout = './Layouts/SCM/RFQ2.rdlc';
    DefaultLayout = RDLC;

    dataset
    {
        dataitem("Standard Vendor Purchase Code"; "Standard Vendor Purchase Code")
        {
            RequestFilterFields = "Vendor No.";
            column(ReportForNavId_18; 18) { } // Autogenerated by ForNav - Do not delete
            column(LOGO; CompInfo.Picture)
            {
            }
            column(HOD_Signature; UserSetup101.Picture)
            {
            }
            column(suppadd; suppadd)
            {
            }
            column(add; CompInfo.Address)
            {
            }
            column(Address2; CompInfo."Address 2")
            {
            }
            column(City; CompInfo.City)
            {
            }
            column(Phone_No1; CompInfo."Phone No.")
            {
            }
            column(Phone_No2; CompInfo."Phone No. 2")
            {
            }
            column(Emaill; CompInfo."E-Mail")
            {
            }
            column(Procurement_Email; CompInfo."Procurement Support E-mail")
            {
            }
            column(website; CompInfo."Home Page")
            {
            }
            column(namecomp; CompInfo.Name)
            {
            }
            column(VendorNo_StandardVendorPurchaseCode; "Standard Vendor Purchase Code"."Vendor No.")
            {
            }
            column(IFSCode_StandardVendorPurchaseCode; "Standard Vendor Purchase Code"."IFS Code")
            {
            }
            column(VendorName_StandardVendorPurchaseCode; UpperCase("Standard Vendor Purchase Code"."Vendor Name"))
            {
            }
            column(PrimaryEmail_StandardVendorPurchaseCode; "Standard Vendor Purchase Code"."Primary Email")
            {
            }
            column(Description_StandardVendorPurchaseCode; "Standard Vendor Purchase Code".Description)
            {
            }
            column(ilesikuitaisha; CalcDate('7D', Today))
            {
            }
            column(DocNumberCaption; DocNumber)
            {
            }
            column(CONDITIONSCaption; CONDITIONSCaptionLbl)
            {
            }
            column(ConditionOneCaption; ConditionOneLbl)
            {
            }
            column(ConditionTwoCaption; ConditionTwoLbl)
            {
            }
            column(ConditionThreeCaption; ConditionThreeLbl)
            {
            }
            column(ConditionFourCaption; ConditionFourLbl)
            {
            }
            column(ConditionFiveCaption; ConditionFiveLbl)
            {
            }
            column(ConditionSixCaption; ConditionSixLbl)
            {
            }
            column(ConditionSevenCaption; ConditionSevenLbl)
            {
            }
            column(ConditionEightCaption; ConditionEightLbl)
            {
            }
            column(ConditionNineCaption; ConditionNineLbl)
            {
            }
            column(WitnessTextLbl; WitnessText)
            {
            }
            column(TODAY; Today)
            {
            }
            column(CompInfo_Picture; CompInfo.Picture)
            {
            }
            column(CompInfo_Name; CompInfo.Name)
            {
            }
            column(CompInfo_Fax_No_; CompInfo."Fax No.")
            {
            }
            column(CompInfo_Post_Code; CompInfo."Post Code")
            {
            }
            column(CompInfo_Name_Control1000000095; CompInfo.Name)
            {
            }
            column(CompInfo_Address; CompInfo.Address)
            {
            }
            column(CompInfo_City; CompInfo.City)
            {
            }
            column(CompInfo_Phone_No; CompInfo."Phone No.")
            {
            }
            column(Invitation; StrSubstNo(InvitationLbl, ReturnTime, Format(ReturnDate)))
            {
            }
            column(RefCaption; Ref)
            {
            }
            column(Tel; Tel)
            {
            }
            column(FaxNo; Fax)
            {
            }
            column(PBox; StrSubstNo(Address, CompInfo."Address 2", CompInfo."Post Code"))
            {
            }
            column(bdlbl1; bdlbl1)
            {
            }
            column(bdlbl2; bdlbl2)
            {
            }
            column(bdlbl3; bdlbl3)
            {
            }
            column(bdlbl31; bdlbl31)
            {
            }
            column(bdlbl4; bdlbl4)
            {
            }
            column(bdlbl41; bdlbl41)
            {
            }
            column(bdlbl5; bdlbl5)
            {
            }
            column(bdlbl6; bdlbl6)
            {
            }
            column(cond1; cond1)
            {
            }
            column(cond2; cond2)
            {
            }
            column(cond3; cond3)
            {
            }
            column(name; CompInfo.Name)
            {
            }
            column(cond4; cond4)
            {
            }
            dataitem("Standard Purchase Code"; "Standard Purchase Code")
            {
                DataItemLink = Code = field(Code);
                column(ReportForNavId_9; 9) { } // Autogenerated by ForNav - Do not delete
                column(PreparedBy; UserSetup."Employee Name")
                {
                }
                column(DatePrepared; ApproverDate[1])
                {
                }
                column(PreparedBy_Signature; UserSetup.Picture)
                {
                }
                column(ExaminedBy; UserSetup1."Employee Name")
                {
                }
                column(DateExamined; ApproverDate[2])
                {
                }
                column(ExaminedBy_Signature; UserSetup1.Picture)
                {
                }
                column(Authorizer; UserSetup2."Employee Name")
                {
                }
                column(DateAuthorized; ApproverDate[3])
                {
                }
                column(VBC; UserSetup4."Employee Name")
                {
                }
                column(VBC_sign; UserSetup4.Picture)
                {
                }
                column(VBC_date; ApproverDate[5])
                {
                }
                column(Authorizer_Signature; UserSetup2.Picture)
                {
                }
                column(Mdirector; UserSetup3."Employee Name")
                {
                }
                column(director_date; ApproverDate[4])
                {
                }
                column(director_sign; UserSetup3.Picture)
                {
                }
                column(Code_StandardPurchaseCode; "Standard Purchase Code".Code)
                {
                }
                column(Description_StandardPurchaseCode; "Standard Purchase Code".Description)
                {
                }
                column(CurrencyCode_StandardPurchaseCode; "Standard Purchase Code"."Currency Code")
                {
                }
                column(ProcurementMethod_StandardPurchaseCode; "Standard Purchase Code"."Procurement Method")
                {
                }
                column(SubmissionStartDate_StandardPurchaseCode; "Standard Purchase Code"."Submission Start Date")
                {
                }
                column(SubmissionStartTime_StandardPurchaseCode; "Standard Purchase Code"."Submission Start Time")
                {
                }
                column(SubmissionEndDate_StandardPurchaseCode; "Standard Purchase Code"."Submission End Date")
                {
                }
                column(SubmissionEndTime_StandardPurchaseCode; "Standard Purchase Code"."Submission End Time")
                {
                }
                column(BidOpeningDate_StandardPurchaseCode; "Standard Purchase Code"."Bid Opening Date")
                {
                }
                column(BidOpeningTime_StandardPurchaseCode; "Standard Purchase Code"."Bid Opening Time")
                {
                }
                column(BidOpeningVenue_StandardPurchaseCode; "Standard Purchase Code"."Bid Opening Venue")
                {
                }
                column(ExternalDocumentNo_StandardPurchaseCode; "Standard Purchase Code"."External Document No")
                {
                }
                column(PreliminaryEvaluation_StandardPurchaseCode; "Standard Purchase Code"."Preliminary Evaluation")
                {
                }
                column(TechnicalSpecification_StandardPurchaseCode; "Standard Purchase Code"."Technical Specification")
                {
                }
                column(TenderValidityDuration_StandardPurchaseCode; "Standard Purchase Code"."Tender Validity Duration")
                {
                }
                trigger OnAfterGetRecord();
                begin
                    ApprovalEntries.Reset;
                    ApprovalEntries.SetRange("Table ID", 38);
                    ApprovalEntries.SetRange("Document No.", "Standard Purchase Code".Code);
                    ApprovalEntries.SetRange(Status, ApprovalEntries.Status::Approved);
                    if ApprovalEntries.Find('-') then begin
                        i := 0;
                        repeat
                            i := i + 1;
                            if i = 1 then begin
                                Approver1[1] := ApprovalEntries."Sender ID";
                                ApproverDate[1] := ApprovalEntries."Date-Time Sent for Approval";
                                if UserSetup.Get(Approver1[1]) then
                                    UserSetup.CalcFields(Picture);
                                Approver1[2] := ApprovalEntries."Approver ID";
                                ApproverDate[2] := ApprovalEntries."Last Date-Time Modified";
                                if UserSetup1.Get(Approver1[2]) then
                                    UserSetup1.CalcFields(Picture);
                            end;
                            if i = 2 then begin
                                Approver1[3] := ApprovalEntries."Approver ID";
                                ApproverDate[3] := ApprovalEntries."Last Date-Time Modified";
                                if UserSetup2.Get(Approver1[3]) then
                                    UserSetup2.CalcFields(Picture);
                            end;
                            if i = 3 then begin
                                Approver1[4] := ApprovalEntries."Approver ID";
                                ApproverDate[4] := ApprovalEntries."Last Date-Time Modified";
                                if UserSetup3.Get(Approver1[4]) then
                                    UserSetup3.CalcFields(Picture);
                            end;
                            if i = 4 then begin
                                Approver1[5] := ApprovalEntries."Approver ID";
                                ApproverDate[5] := ApprovalEntries."Last Date-Time Modified";
                                if UserSetup4.Get(Approver1[5]) then
                                    UserSetup4.CalcFields(Picture);
                            end;
                        until
                       ApprovalEntries.Next = 0;
                    end;
                end;

            }
            dataitem("Standard Purchase Line"; "Standard Purchase Line")
            {
                DataItemLink = "Standard Purchase Code" = field(Code);
                DataItemLinkReference = "Standard Purchase Code";
                column(ReportForNavId_22; 22) { } // Autogenerated by ForNav - Do not delete
                column(StandardPurchaseCode_StandardPurchaseLine; "Standard Purchase Line"."Standard Purchase Code")
                {
                }
                column(LineNo_StandardPurchaseLine; "Standard Purchase Line"."Line No.")
                {
                }
                column(Tech_SPEC; "Standard Purchase Line"."Technical Specifications")
                {
                }
                column(Type_StandardPurchaseLine; "Standard Purchase Line".Type)
                {
                }
                column(No_StandardPurchaseLine; "Standard Purchase Line"."No.")
                {
                }
                column(Description_StandardPurchaseLine; "Standard Purchase Line".Description)
                {
                }
                column(Quantity_StandardPurchaseLine; "Standard Purchase Line".Quantity)
                {
                }
                column(AmountExclVAT_StandardPurchaseLine; "Standard Purchase Line"."Amount Excl. VAT")
                {
                }
                column(UnitofMeasureCode_StandardPurchaseLine; "Standard Purchase Line"."Unit of Measure Code")
                {
                }
                column(ShortcutDimension1Code_StandardPurchaseLine; "Standard Purchase Line"."Shortcut Dimension 1 Code")
                {
                }
                column(ShortcutDimension2Code_StandardPurchaseLine; "Standard Purchase Line"."Shortcut Dimension 2 Code")
                {
                }
                column(VariantCode_StandardPurchaseLine; "Standard Purchase Line"."Variant Code")
                {
                }
                column(To_Caption; To_CaptionLbl)
                {
                }
                column(Seller_s_Name_and_AddressCaption; Seller_s_Name_and_AddressCaptionLbl)
                {
                }
                column(EmptyStringCaption; EmptyStringCaptionLbl)
                {
                }
                column(DAYS_TO_DELIVERYCaption; DAYS_TO_DELIVERYCaptionLbl)
                {
                }
                column(Notes_Caption; Notes_CaptionLbl)
                {
                }
                column(UNITCaption; UNITCaptionLbl)
                {
                }
                column(QUANTITY_REQUIREDCaption; QUANTITY_REQUIREDCaptionLbl)
                {
                }
                column(TOTAL_AMOUNTCaption; TOTAL_AMOUNTCaptionLbl)
                {
                }
                column(REMARKSCaption; REMARKSCaptionLbl)
                {
                }
                column(a__THIS_IS_NOT_AN_ORDER_Read_the_conditions_and_instructions_on_reverse_before_quoting_Caption; a__THIS_IS_NOT_AN_ORDER_Read_the_conditions_and_instructions_on_reverse_before_quoting_CaptionLbl)
                {
                }
                column(UNIT_PRICECaption; UNIT_PRICECaptionLbl)
                {
                }
                column(Date_________________________________________________________________________Caption; Date_________________________________________________________________________CaptionLbl)
                {
                }
                column(EmptyStringCaption_Control1000000003; EmptyStringCaption_Control1000000003Lbl)
                {
                }
                column(EmptyStringCaption_Control1000000019; EmptyStringCaption_Control1000000019Lbl)
                {
                }
                column(BRANDCaption; BRANDCaptionLbl)
                {
                }
                column(CODE_No_Caption; CODE_No_CaptionLbl)
                {
                }
                column(ITEM_DESCRIPTIONCaption; ITEM_DESCRIPTIONCaptionLbl)
                {
                }
                column(Quotation_No___________________________________________________________________Caption; Quotation_No___________________________________________________________________CaptionLbl)
                {
                }
                column(From_Caption; From_CaptionLbl)
                {
                }
                column(To_be_endorsed_on_the_envelope_Caption; To_be_endorsed_on_the_envelope_CaptionLbl)
                {
                }
                column(REQUEST_FOR_QUOTATIONCaption; REQUEST_FOR_QUOTATIONCaptionLbl)
                {
                }
                column(COUNTRY_OF_ORIGINCaption; COUNTRY_OF_ORIGINCaptionLbl)
                {
                }
                column(Seller_s_Signature________________________________________________________________Caption; Seller_s_Signature________________________________________________________________CaptionLbl)
                {
                }
                column(Date__________________________________________________________Caption; Date__________________________________________________________CaptionLbl)
                {
                }
                column(Sign_over_Rubber_Stamp_Caption; Sign_over_Rubber_Stamp_CaptionLbl)
                {
                }
                column(Opened_By_Caption; Opened_By_CaptionLbl)
                {
                }
                column(FOR_OFFICIAL_USE_ONLYCaption; FOR_OFFICIAL_USE_ONLYCaptionLbl)
                {
                }
                column(V1__________________________________________________________________________________________Caption; V1__________________________________________________________________________________________CaptionLbl)
                {
                }
                column(Designation_________________________________________________________________________________________Caption; Designation_________________________________________________________________________________________CaptionLbl)
                {
                }
                column(Date_________________________________________________________________________________________Caption; Date_________________________________________________________________________________________CaptionLbl)
                {
                }
                column(V3__________________________________________________________________________________________Caption; V3__________________________________________________________________________________________CaptionLbl)
                {
                }
                column(V2__________________________________________________________________________________________Caption; V2__________________________________________________________________________________________CaptionLbl)
                {
                }
                column(Signature_________________________________________________________________________________________Caption; Signature_________________________________________________________________________________________CaptionLbl)
                {
                }


                column(LeadTimeCaption; LeadTime)
                {
                }
                column(V4Caption; V4)
                {
                }
            }
            dataitem("IFS Required Document"; "IFS Required Document")
            {
                DataItemLink = "Document No" = field("IFS Code");
                column(ReportForNavId_69; 69) { } // Autogenerated by ForNav - Do not delete
                column(DocumentNo_IFSRequiredDocument; "IFS Required Document"."Document No")
                {
                }
                column(Description_IFSRequiredDocument; "IFS Required Document".Description)
                {
                }
                column(RequirementType_IFSRequiredDocument; "IFS Required Document"."Requirement Type")
                {
                }
            }
            trigger OnAfterGetRecord();
            begin
                ProcurementRequest.Reset;
                ProcurementRequest.SetRange(ProcurementRequest.Code, StandardVendorPurchaseCode."IFS Code");
                if ProcurementRequest.Find('-') then begin
                    DocNumber := ProcurementRequest."External Document No";
                    ReturnDate := ProcurementRequest."Submission End Date";
                    ReturnTime := ProcurementRequest."Submission End Time";
                end;
                if Vendors.Get(StandardVendorPurchaseCode.Code) then
                    suppadd := Vendors.Address;
                /*
				//================================================================
				ReqHeader.RESET;
				IF ReqHeader.GET(ReqHeader."Document Type"::) THEN BEGIN
				   title:=ReqHeader."Tender Name";
				END;*/

            end;

        }
    }
    requestpage
    {
        SaveValues = false;
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    Caption = 'Options';

                }
            }
        }

    }

    trigger OnInitReport()
    begin
        CompInfo.Get;
        CompInfo.CalcFields(Picture);
        UserSetup101.Reset;
        UserSetup101.SetFilter("User ID", '<>%1', '');
        UserSetup101.SetRange("Procurement Manager", true);
        if UserSetup101.FindFirst then begin
            UserSetup101.CalcFields(Picture);
        end;


    end;


    trigger OnPreReport()
    begin
        UserSetup101.Reset;
        UserSetup101.SetFilter("User ID", '<>%1', '');
        UserSetup101.SetRange("Procurement Manager", true);
        if UserSetup101.FindFirst then begin
            UserSetup101.CalcFields(Picture);
        end;

    end;

    var
        UserSetup101: Record "User Setup";
        Department: Text[30];
        Dimvalues: Record "Dimension Value";
        Vendors: Record Vendor;
        PrevMonthBud: Decimal;
        CurrMonthBud: Decimal;
        TotAvailableBud: Decimal;
        GLAccount: Record "G/L Account";
        GenLedSetup: Record "General Ledger Setup";
        QtyStore: Record Item;
        GenPostGroup: Record "General Posting Setup";
        Budget: Decimal;
        CurrMonth: Code[10];
        CurrYR: Code[10];
        BudgDate: Text[30];
        ReqHeader: Record "Purchase Header";
        BudgetDate: Date;
        YrBudget: Decimal;
        "BudgetB/F": Decimal;
        RequisitionLine: Record "Purchase Line";
        BudgetGL: Code[20];
        ThisLNAmt: Decimal;
        MonthReqHdr: Record "Purchase Header";
        PeriodTo: Date;
        MonthReq: Record "Purchase Line";
        TotalMonthReq: Decimal;
        RecSeq: Integer;
        DateRequired: Date;
        CompInfo: Record "Company Information";
        CONDITIONSCaptionLbl: label 'NOTE:';
        ConditionOneLbl: label '1. Delivery lead-time and validity period of your quotation MUST be indicated';
        ConditionTwoLbl: label '2. The quotation should be enclosed in plain sealed envelope and the quotation reference number MUST be indicated on the envelope';
        ConditionThreeLbl: label '3. Prices quoted MUST be inclusive of VAT and all other costs where applicable.';
        ConditionFourLbl: label '4. The quotation MUST be stamped and signed.';
        ConditionFiveLbl: label '5. The quotation MUST be placed in the quotation box at .';
        ConditionSixLbl: label '6. The supplier shall retain a COPY of the quotation on the quotation submission date.';
        ConditionSevenLbl: label '7. Attach copies of certificate of registration/Incorporation ';
        ConditionEightLbl: label '8. Failure to observe the above conditions shall lead to automatic disqualification of the bidder';
        ConditionNineLbl: label '9.  reserves the right to accept or reject any bid wholly or in part and does not bind itself to accept any bid.';
        To_CaptionLbl: label 'To:';
        Seller_s_Name_and_AddressCaptionLbl: label 'Seller''s Name and Address';
        EmptyStringCaptionLbl: label '.....................................................................................................................';
        DAYS_TO_DELIVERYCaptionLbl: label 'DAYS TO DELIVERY';
        Notes_CaptionLbl: label 'Notes:';
        UNITCaptionLbl: label 'UNIT';
        QUANTITY_REQUIREDCaptionLbl: label 'QTY';
        TOTAL_AMOUNTCaptionLbl: label 'TOTAL COST';
        REMARKSCaptionLbl: label 'REMARKS';
        a__THIS_IS_NOT_AN_ORDER_Read_the_conditions_and_instructions_on_reverse_before_quoting_CaptionLbl: label '(a) THIS IS NOT AN ORDER.Read the conditions and instructions on reverse before quoting.';
        V10_00_a_m__on__________________________________________________________Lbl: label '10.00 a.m. on.................................................................................................................';
        UNIT_PRICECaptionLbl: label 'UNITCOST';
        InvitationLbl: label 'We invite you to quote for the following listed item(s)/services/Works.Your quote should be received on or before %1 on %2';
        Date_________________________________________________________________________CaptionLbl: label 'Date.........................................................................';
        EmptyStringCaption_Control1000000003Lbl: label '.....................................................................................................................';
        EmptyStringCaption_Control1000000019Lbl: label '.....................................................................................................................';
        BRANDCaptionLbl: label 'BRAND';
        d___Return_the_original_copy_and_retain_the_duplicate_for_your_recordCaptionLbl: label '(d ) Return the original copy and retain the duplicate for your record';
        c__Your_quotation_should_indicate_final_unit_price_which_includes_alll_costs_for_delivery_discount_duty_CaptionLbl: label '(c) Your quotation should indicate final unit price which includes alll costs for delivery,discount,duty ';
        b__This_quotation_should_be_submitted_in_palin_wax_sealed_envelope_marked___Quotation_No__________CLbl: label '(b) This quotation should be submitted in palin wax sealed envelope marked  "Quotation No....................................';
        CODE_No_CaptionLbl: label 'ITEM';
        ITEM_DESCRIPTIONCaptionLbl: label 'DESCRIPTION';
        Quotation_No___________________________________________________________________CaptionLbl: label 'Quotation No. .................................................................';
        From_CaptionLbl: label 'From:';
        The_Director_GeneralCaptionLbl: label 'The Director General';
        To_be_endorsed_on_the_envelope_CaptionLbl: label '(To be endorsed on the envelope)';
        REQUEST_FOR_QUOTATIONCaptionLbl: label 'REQUEST FOR QUOTATION';
        and_sales_tax_CaptionLbl: label 'and sales tax.';
        COUNTRY_OF_ORIGINCaptionLbl: label 'COUNTRY OF ORIGIN';
        Seller_s_Signature________________________________________________________________CaptionLbl: label 'SUPPLIER''S SIGNATURE & STAMP................................................................';
        Date__________________________________________________________CaptionLbl: label 'Date..........................................................';
        Sign_over_Rubber_Stamp_CaptionLbl: label '(Sign over Rubber Stamp)';
        Opened_By_CaptionLbl: label 'Opened By:';
        FOR_OFFICIAL_USE_ONLYCaptionLbl: label 'FOR OFFICIAL USE ONLY';
        V1__________________________________________________________________________________________CaptionLbl: label '(1).........................................................................................';
        Designation_________________________________________________________________________________________CaptionLbl: label 'Designation.........................................................................................';
        Date_________________________________________________________________________________________CaptionLbl: label 'Date.........................................................................................';
        V3__________________________________________________________________________________________CaptionLbl: label '(3).........................................................................................';
        V2__________________________________________________________________________________________CaptionLbl: label '(2).........................................................................................';
        Signature_________________________________________________________________________________________CaptionLbl: label 'Signature.........................................................................................';
        Signature______________________________________________________Caption_Control1000000066Lbl: label 'Signature.........................................................................................';
        Signature_____________________________________________________________________Caption_Control1000000067Lbl: label 'Signature.........................................................................................';
        Time___________________________________________________________________________CaptionLbl: label 'Time.........................................................................................';
        Designation_______________________________________________________________________Caption_Control1000000069Lbl: label 'Designation.........................................................................................';
        Designation____________________________________________________________________Caption_Control1000000070Lbl: label 'Designation.........................................................................................';
        LeadTime: label 'DELIVERY LEADTIME';
        Remarks: label 'REMARKS';
        V4: label '(4).........................................................................................';
        Tel: label 'Tel:';
        Fax: label 'Fax No:';
        Address: label '%1 - %2';
        DocNumber: Code[30];
        WitnessText: label 'OPENED IN THE PRESENCE OF (NAME & SIGN)';
        Ref: label 'REF:';
        ProcurementRequest: Record "Standard Purchase Code";
        ReturnDate: Date;
        ReturnTime: Time;
        bdlbl1: label 'You are Invited to Submit Quotation on materials below:';
        bdlbl2: label 'Notes:';
        bdlbl3: label '				(a)   THIS IS NOT AN ORDER.';
        bdlbl31: label 'Read the Conditions and Instructions below before quoting.';
        bdlbl4: label '				 (b)  This quotation should be submitted in a plain wax sealed Envelope marked "Quotation No:';
        bdlbl41: label '						to reach the Buyer or be placed in the Quotation/Tender Box not later than 9:30 AM on ';
        bdlbl5: label '				 (c)   Your Quotation should indicate Final Unit Price, which includes all costs for Delivery, Discount, Duty and Sales Tax.';
        bdlbl6: label '				 (d)   Return the Original Copy and Retain the Duplicate for your Record.';
        title: Text;
        cond1: label '1. The General conditions of contract with the Government of Kenya and with Procuring Entity apply to this transaction. This form properly submitted constitutes the entire agreement.';
        cond2: label '2. The offer shall remain firm for 30 days from the closing date unless otherwise stipulated by the seller.';
        cond3: label '3. The buyer shall not be bound to accept the lowest or any other offer,and reserves the right to accept any offer  in part unless the contrary is stipulated by the seller.';
        cond4: label '4. Samples of offers when required will be provided free,and if not destroyed during tests will,upon request ,be returned at the sellers request.';
        StandardVendorPurchaseCode: Record "Standard Vendor Purchase Code";
        suppadd: Text[50];
        ApprovalEntries: Record "Approval Entry";
        ApproverDate: array[10] of DateTime;
        UserSetup: Record "User Setup";
        UserSetup1: Record "User Setup";
        UserSetup2: Record "User Setup";
        UserSetup3: Record "User Setup";
        UserSetup4: Record "User Setup";
        i: Integer;
        Emp: Record Employee;
        DesignationID: Code[50];
        USetup: Record "User Setup";
        ENo: Code[10];
        Designation: Code[50];
        Approver1: array[10] of Code[50];
        JOBID: Record "ManPower Planning Lines";

    procedure GetMonthlyTot(var Periodfrom: Date; var Dept: Code[20]) TotMonthReq: Decimal
    begin
    end;


}
