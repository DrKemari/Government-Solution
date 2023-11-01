report 57015 "Salary Advance"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Salary Advance.rdlc';

    dataset
    {
        dataitem(Payments;Payments)
        {
            column(Name;CompanyInfo.Name)
            {
            }
            column(Picture;CompanyInfo.Picture)
            {
            }
            column(Remarks_Payments;Payments.Remarks)
            {
            }
            column(Comments_Payments;Payments.Comments)
            {
            }
            column(AmountApproved_Payments;Payments."Amount Approved")
            {
            }
            column(EffectivefromMonth_Payments;Payments."Effective from Month")
            {
            }
            column(SalaryAdvance_Payments;Payments."Salary Advance")
            {
            }
            column(SalaryLastDrawn_Payments;Payments."Salary Last Drawn")
            {
            }
            column(DateofJoining_Payments;Payments."Date of Joining")
            {
            }
            column(Noofmonthsdeducted_Payments;Payments."No of months deducted")
            {
            }
            column(AmountPending_Payments;Payments."Amount Pending")
            {
            }
            column(RecoveryStartMonth_Payments;Payments."Recovery Start Month")
            {
            }
            column(MonthlyInstallment_Payments;Payments."Monthly Installment")
            {
            }
            column(Purpose_Payments;Payments.Purpose)
            {
            }
            column(DepartmentName_Payments;Payments."Department Name")
            {
            }
            column(ProjectName_Payments;Payments."Project Name")
            {
            }
            column(No_Payments;Payments."No.")
            {
            }
            column(Date_Payments;Payments.Date)
            {
            }
            column(AccountNo_Payments;Payments."Account No.")
            {
            }
            column(AccountName_Payments;Payments."Account Name")
            {
            }
            column(Status_Payments;Payments.Status)
            {
            }
            column(Number_In_Words;NumberText[1])
            {
            }
            column(PreparedBy;UserSetup."Employee Name")
            {
            }
            column(DatePrepared;ApproverDate[1])
            {
            }
            column(PreparedBy_Signature;UserSetup.Picture)
            {
            }
            column(ExaminedBy;UserSetup2."Employee Name")
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
            column(Accounts;UserSetup4."Employee Name")
            {
            }
            column(DateAccounts;ApproverDate[5])
            {
            }
            column(Accounts_Signature;UserSetup4.Picture)
            {
            }

            trigger OnAfterGetRecord()
            begin
                PaymentMgt.InitTextVariable;
                PaymentMgt.FormatNoText(NumberText,Payments."Salary Advance",CurrencyCodeText);

                //Approvals
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
                if i=4 then
                begin
                Approver[5]:=ApprovalEntries."Approver ID";
                ApproverDate[5]:=ApprovalEntries."Last Date-Time Modified";
                 if UserSetup4.Get(Approver[5]) then
                    UserSetup4.CalcFields(Picture);
                end;
                until
                ApprovalEntries.Next=0;

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

    trigger OnPreReport()
    begin
        CompanyInfo.Get;
        CompanyInfo.CalcFields(Picture);
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
        UserSetup4: Record "User Setup";
}

