report 57014 "Warrant Voucher"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Warrant Voucher.rdlc';

    dataset
    {
        dataitem(Payments;Payments)
        {
            DataItemTableView = WHERE("Payment Type"=CONST("Warrant Voucher"));
            PrintOnlyIfDetail = false;
            RequestFilterFields = "No.",Date,"Cheque No","Bank Code",Payee;
            column(CompanyLogo;CompanyInfo.Picture)
            {
            }
            column(CompanyName;CompanyInfo.Name)
            {
            }
            column(CompanyAddress;CompanyInfo.Address)
            {
            }
            column(CompanyAddress2;CompanyInfo."Address 2")
            {
            }
            column(CompanyPostCode;CompanyInfo."Post Code")
            {
            }
            column(CompanyCity;CompanyInfo.City)
            {
            }
            column(CompanyPhone;CompanyInfo."Phone No.")
            {
            }
            column(CompanyFax;CompanyInfo."Fax No.")
            {
            }
            column(CompanyEmail;CompanyInfo."E-Mail")
            {
            }
            column(CompanyWebsite;CompanyInfo."Home Page")
            {
            }
            column(No_Payments;Payments."No.")
            {
            }
            column(Date_Payments;Payments.Date)
            {
            }
            column(PaymentsNarration;Payments."Payment Narration")
            {
            }
            column(Type_Payments;Payments.Type)
            {
            }
            column(JobNo_Payments;Payments.Project)
            {
            }
            column(JobDescription_Payments;Payments."Project Description")
            {
            }
            column(BankName_Payments;Payments."Bank Name")
            {
            }
            column(PayMode_Payments;Payments."Pay Mode")
            {
            }
            column(ChequeNo_Payments;Payments."Cheque No")
            {
            }
            column(ChequeDate_Payments;Payments."Cheque Date")
            {
            }
            column(BankCode_Payments;Payments."Bank Code")
            {
            }
            column(Payee_Payments;Payments.Payee)
            {
            }
            column(Onbehalfof_Payments;Payments."On behalf of")
            {
            }
            column(CreatedBy_Payments;Payments."Created By")
            {
            }
            column(Posted_Payments;Payments.Posted)
            {
            }
            column(PostedBy_Payments;Payments."Posted By")
            {
            }
            column(PostedDate_Payments;Payments."Posted Date")
            {
            }
            column(GlobalDimension1Code_Payments;Payments."Shortcut Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code_Payments;Payments."Shortcut Dimension 2 Code")
            {
            }
            column(TimePosted_Payments;Payments."Time Posted")
            {
            }
            column(TotalAmount_Payments;Payments."Total Amount LCY")
            {
            }
            column(PayingBankAccount_Payments;Payments."Paying Bank Account")
            {
            }
            column(PVCreationDateTime_Payments;Payments."PV Creation DateTime")
            {
            }
            column(PVCreatorID_Payments;Payments."PV Creator ID")
            {
            }
            column(RemainingAmount_Payments;Payments."Remaining Amount")
            {
            }
            column(ReceiptCreated_Payments;Payments."Receipt Created")
            {
            }
            column(ImprestDeadline_Payments;Payments."Imprest Deadline")
            {
            }
            column(ImprestSurrenderDate_Payments;Payments."Surrender Date")
            {
            }
            column(DateFilter_Payments;Payments."Date Filter")
            {
            }
            column(ImprestType_Payments;Payments."Imprest Type")
            {
            }
            column(ProjectBudget_Payments;Payments."Project Budget")
            {
            }
            column(UsageCosts_Payments;Payments."Actual Project Costs")
            {
            }
            column(TotalCommitments_Payments;Payments."Total Budget Commitments")
            {
            }
            column(AvailableFunds_Payments;Payments."Available Funds")
            {
            }
            column(Number_In_Words;NumberText[1])
            {
            }
            column(ImprestMemoNo_Payments;Payments."Imprest Memo No")
            {
            }
            column(PreparedBy;UserSetup."Employee Name")
            {
            }
            column(ImprestVoucherAmount_Payments;Payments."Imprest Voucher Amount")
            {
            }
            column(DatePrepared;ApproverDate[1])
            {
            }
            column(CreatorName;CreatorName)
            {
            }
            column(PreparedBy_Signature;UserSetup.Picture)
            {
            }
            column(ExaminedBy;UserSetup1."Employee Name")
            {
            }
            column(DateExamined;ApproverDate[2])
            {
            }
            column(ExaminedBy_Signature;UserSetup1.Picture)
            {
            }
            column(VBC;UserSetup2."Employee Name")
            {
            }
            column(VBCDate;ApproverDate[3])
            {
            }
            column(VBC_Signature;UserSetup2.Picture)
            {
            }
            column(Authorizer;UserSetup3."Employee Name")
            {
            }
            column(DateAuthorized;ApproverDate[4])
            {
            }
            column(Authorizer_Signature;UserSetup3.Picture)
            {
            }
            column(Creator;Creator)
            {
            }
            dataitem("Imprest Voucher Lines";"Imprest Voucher Lines")
            {
                DataItemLink = No=FIELD("No.");
                column(Name_ProjectMembers;"Imprest Voucher Lines"."Account Name")
                {
                }
                column(Entitlement_ProjectMembers;"Imprest Voucher Lines".Amount)
                {
                }
                column(WorkType_ProjectMembers;"Imprest Voucher Lines"."Work Type")
                {
                }
                column(ImprestTransport_ImprestVoucherLines;"Imprest Voucher Lines"."Imprest Transport")
                {
                }
                column(ImprestOtherCosts_ImprestVoucherLines;"Imprest Voucher Lines"."Imprest Other Costs")
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                //Ushindi
                /*
                CheckReport.InitTextVariable();
                CheckReport.FormatNoText(NumberText,TTotal,'');
                */
                Payments.CalcFields("Imprest Voucher Amount");
                PaymentMgt.InitTextVariable;
                PaymentMgt.FormatNoText(NumberText,Payments."Imprest Voucher Amount",CurrencyCodeText);
                //Approvals
                if UserSetup.Get(Payments."Created By") then begin
                Creator:=Payments."Created By";
                CreatorName:=UserSetup."Employee Name";
                UserSetup.CalcFields(Picture);
                end;
                
                ApprovalEntries.Reset;
                ApprovalEntries.SetRange("Table ID",57000);
                ApprovalEntries.SetRange("Document No.",Payments."No.");
                ApprovalEntries.SetRange(Status,ApprovalEntries.Status::Approved);
                if ApprovalEntries.Find('-') then begin
                   i:=0;
                 repeat
                 i:=i+1;
                if i=1 then begin
                Approver[1]:=ApprovalEntries."Sender ID";
                ApproverDate[1]:=ApprovalEntries."Date-Time Sent for Approval";
                 if UserSetup.Get(Approver[1]) then
                    UserSetup.CalcFields(Picture);
                
                Approver[2]:=ApprovalEntries."Approver ID";
                ApproverDate[2]:=ApprovalEntries."Last Date-Time Modified";
                 if UserSetup1.Get(Approver[2]) then
                    UserSetup1.CalcFields(Picture);
                end;
                if i=2 then
                begin
                Approver[3]:=ApprovalEntries."Approver ID";
                ApproverDate[3]:=ApprovalEntries."Last Date-Time Modified";
                 if UserSetup2.Get(Approver[3]) then
                    UserSetup2.CalcFields(Picture);
                end;
                if i=3 then
                begin
                Approver[4]:=ApprovalEntries."Approver ID";
                ApproverDate[4]:=ApprovalEntries."Last Date-Time Modified";
                 if UserSetup3.Get(Approver[4]) then
                    UserSetup3.CalcFields(Picture);
                end;
                until
                ApprovalEntries.Next=0;
                
                end;

            end;

            trigger OnPreDataItem()
            begin
                Payments.CalcFields(Payments."Bank Name",Payments."Project Description");
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
        //Ushindi Changes
        //Indicate Logo
        CompanyInfo.Get;
        CompanyInfo.CalcFields(CompanyInfo.Picture);
    end;

    trigger OnPreReport()
    begin
        //Ushindi Changes
        //Indicate Logo
        CompanyInfo.Get;
        CompanyInfo.CalcFields(CompanyInfo.Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
        CheckReport: Report Check;
        NumberText: array [2] of Text[80];
        TTotal: Decimal;
        ApprovalEntries: Record "Approval Entry";
        Approver: array [10] of Code[50];
        ApproverDate: array [10] of DateTime;
        UserSetup: Record "User Setup";
        UserSetup1: Record "User Setup";
        UserSetup2: Record "User Setup";
        UserSetup3: Record "User Setup";
        i: Integer;
        PaymentMgt: Codeunit "Payments-Post";
        CurrencyCodeText: Code[10];
        Creator: Code[30];
        CreatorName: Text;
}

