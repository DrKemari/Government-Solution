report 56237 "Internal Memo"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Internal Memo.rdlc';

    dataset
    {
        dataitem(Memo;"Internal Memos")
        {
            column(From_Memo;Memo.From)
            {
            }
            column(ToCEO_Memo;Memo."To CEO")
            {
            }
            column(Through_Memo;Memo.Through)
            {
            }
            column(Date_Memo;Format(Date,0,4))
            {
            }
            column(RE_Memo;Memo.RE)
            {
            }
            column(Title_Memo;Memo.Title)
            {
            }
            column(Paragraph1_Memo;Memo."Paragraph 1")
            {
            }
            column(Paragraph2_Memo;Memo."Paragraph 2")
            {
            }
            column(CEOComments_Memo;Memo."CEO Comments")
            {
            }
            column(logo;CompanyInfo.Picture)
            {
            }
            column(PreparedByDate;Format("Prepared By Date",0,4))
            {
            }
            column(ApprovedByDate;Format("Approved By Date",0,4))
            {
            }
            column(CEOApprovalDate;Format("CEO Approval Date",0,4))
            {
            }
            dataitem("Memo Lines";"Memo Lines")
            {
                DataItemLink = Code=FIELD(Code);
                column(Code_MemoLines;"Memo Lines".Code)
                {
                }
                column(LineNo_MemoLines;"Memo Lines"."Line No.")
                {
                }
                column(Description_MemoLines;"Memo Lines".Description)
                {
                }
                column(Quantity_MemoLines;"Memo Lines".Quantity)
                {
                }
                column(Rate_MemoLines;"Memo Lines".Rate)
                {
                }
                column(Totalamount_MemoLines;"Memo Lines"."Total amount")
                {
                }
                column(Vote_MemoLines;"Memo Lines".Vote)
                {
                }
                column(Budget_MemoLines;"Memo Lines".Budget)
                {
                }
                column(Balance_MemoLines;"Memo Lines".Balance)
                {
                }
                column(Commitment_MemoLines;"Memo Lines".Commitment)
                {
                }
                column(VoteName_MemoLines;"Memo Lines"."Vote Name")
                {
                }
                column(BalanceAfterCommitment_MemoLines;"Memo Lines"."Balance After Commitment")
                {
                }
                column(Expenses_MemoLines;"Memo Lines".Expenses)
                {
                }
            }

            trigger OnAfterGetRecord()
            begin
                Employee.Reset;
                Employee.SetRange(Employee."User ID",Memo."Employee UserID");
                if Employee.Find('-') then
                begin
                  Employee.Get(Employee."No.");
                  //Employee.CALCFIELDS(Employee.Signature);
                end;

                EmployeeUser.Reset;
                EmployeeUser.SetRange(EmployeeUser."User ID",Memo."Approved By");
                if EmployeeUser.Find('-') then
                begin
                  EmployeeUser.Get(EmployeeUser."No.");
                  //EmployeeUser.CALCFIELDS(EmployeeUser.Signature);
                end;

                EmployeeCEO.Reset;
                EmployeeCEO.SetRange(EmployeeCEO."User ID",Memo."CEO Approval");
                if EmployeeCEO.Find('-') then
                begin
                  EmployeeCEO.Get(EmployeeCEO."No.");
                  //EmployeeCEO.CALCFIELDS(EmployeeCEO.Signature);
                end;
            end;

            trigger OnPreDataItem()
            begin
                if CompanyInfo.Get() then
                CompanyInfo.CalcFields(CompanyInfo.Picture);
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

    var
        Employee: Record Employee;
        EmployeeUser: Record Employee;
        EmployeeCEO: Record Employee;
        CompanyInfo: Record "Company Information";
}

