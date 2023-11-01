report 58000 "CR1 Copyright Reg Application"
{
    DefaultLayout = RDLC;
    RDLCLayout = './CR1 Copyright Reg Application.rdlc';

    dataset
    {
        dataitem("Copyright Registration Table";"Copyright Registration Table")
        {
            PrintOnlyIfDetail = false;
            RequestFilterFields = "No.","Applicant Account";
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
            column(No_CopyrightRegistration;"No.")
            {
            }
            column(Name_CopyrightRegistration;"Copyright Registration Table".Name)
            {
            }
            column(SearchName_CopyrightRegistration;"Search Name")
            {
            }
            column(Name2_CopyrightRegistration;"Name 2")
            {
            }
            column(Address_CopyrightRegistration;Address)
            {
            }
            column(Address2_CopyrightRegistration;"Address 2")
            {
            }
            column(City_CopyrightRegistration;City)
            {
            }
            column(Contact_CopyrightRegistration;Contact)
            {
            }
            column(PhoneNo_CopyrightRegistration;"Phone No.")
            {
            }
            column(TelexNo_CopyrightRegistration;"Telex No.")
            {
            }
            column(CustomerPostingGroup_CopyrightRegistration;"Customer Posting Group")
            {
            }
            column(CountryRegionCode_CopyrightRegistration;"Country/Region Code")
            {
            }
            column(GenBusPostingGroup_CopyrightRegistration;"Gen. Bus. Posting Group")
            {
            }
            column(PostCode_CopyrightRegistration;"Post Code")
            {
            }
            column(County_CopyrightRegistration;County)
            {
            }
            column(EMail_CopyrightRegistration;"E-Mail")
            {
            }
            column(NoSeries_CopyrightRegistration;"No. Series")
            {
            }
            column(VATBusPostingGroup_CopyrightRegistration;"VAT Bus. Posting Group")
            {
            }
            column(Type_CopyrightRegistration;Type)
            {
            }
            column(CustomerCategory_CopyrightRegistration;"Customer Category")
            {
            }
            column(CustomerType_CopyrightRegistration;"Customer Type")
            {
            }
            column(CompanyRegNo_CopyrightRegistration;"Company Reg No")
            {
            }
            column(IDNo_CopyrightRegistration;"ID. No.")
            {
            }
            column(PIN_CopyrightRegistration;"P.I.N")
            {
            }
            column(Title_CopyrightRegistration;Title)
            {
            }
            column(Status_CopyrightRegistration;Status)
            {
            }
            column(Capturedby_CopyrightRegistration;"Captured by")
            {
            }
            column(Created_CopyrightRegistration;Invoiced)
            {
            }
            column(RegistrationDate_CopyrightRegistration;"Registration Date")
            {
            }
            column(CreatedBy_CopyrightRegistration;"Created By")
            {
            }
            column(CopyrightTitle_CopyrightRegistration;"Copyright Title")
            {
            }
            column(CopyrightWorkCategory_CopyrightRegistration;"Copyright Work Category")
            {
            }
            column(CopyrightWorkSubCategory_CopyrightRegistration;"Copyright Work SubCategory")
            {
            }
            column(CopyrightCategoryDescription_CopyrightRegistration;"Copyright Category Description")
            {
            }
            column(CopyrightSubCategoryDesc_CopyrightRegistration;"Copyright SubCategory Desc")
            {
            }
            column(DateofFixationReduction_CopyrightRegistration;"Date of Fixation/Reduction")
            {
            }
            column(Language_CopyrightRegistration;Language)
            {
            }
            column(CopyrightWorkAbstract_CopyrightRegistration;"Copyright Work Abstract")
            {
            }
            column(AgentFirstName_CopyrightRegistration;"Agent First Name")
            {
            }
            column(AgentSurname_CopyrightRegistration;"Agent Surname")
            {
            }
            column(AgentMiddleName_CopyrightRegistration;"Agent Middle Name")
            {
            }
            column(AgentAddress_CopyrightRegistration;"Agent Address")
            {
            }
            column(AgentAddress2_CopyrightRegistration;"Agent Address 2")
            {
            }
            column(AgentCity_CopyrightRegistration;"Agent City")
            {
            }
            column(AgentContact_CopyrightRegistration;"Agent Contact")
            {
            }
            column(AgentPhoneNo_CopyrightRegistration;"Agent Phone No.")
            {
            }
            column(AgentIDNo_CopyrightRegistration;"Agent ID. No.")
            {
            }
            column(AgentPIN_CopyrightRegistration;"Agent P.I.N")
            {
            }
            column(AuthorFirstName_CopyrightRegistration;"Author First Name")
            {
            }
            column(AuthorAgentSurname_CopyrightRegistration;"Author Surname")
            {
            }
            column(AuthorMiddleName_CopyrightRegistration;"Author Middle Name")
            {
            }
            column(AuthorAddress_CopyrightRegistration;"Author Postal Address")
            {
            }
            column(AuthorAddress2_CopyrightRegistration;"Author Physical Address")
            {
            }
            column(AuthorCity_CopyrightRegistration;"Author City")
            {
            }
            column(AuthorContact_CopyrightRegistration;"Author Contact")
            {
            }
            column(AuthorPhoneNo_CopyrightRegistration;"Author Phone No.")
            {
            }
            column(AuthorIDNo_CopyrightRegistration;"Author ID. No.")
            {
            }
            column(AuthorPIN_CopyrightRegistration;"Author P.I.N")
            {
            }
            column(ProdPubName_CopyrightRegistration;"Prod/Pub Name")
            {
            }
            column(ProdPubIDNoCompanyRegNo_CopyrightRegistration;"Prod/Pub ID No/Company Reg No")
            {
            }
            column(ProdPubPIN_CopyrightRegistration;"Prod/Pub P.I.N")
            {
            }
            column(AssignmentLicenseDate_CopyrightRegistration;"Assignment/License Date")
            {
            }
            column(V1stCountryofProduction_CopyrightRegistration;"1st Country of Production")
            {
            }
            column(ISBN_CopyrightRegistration;ISBN)
            {
            }
            column(ProductionCategory_CopyrightRegistration;"Production Category")
            {
            }
            column(ProdPubPhoneNo_CopyrightRegistration;"Prod/Pub Phone No.")
            {
            }
            column(ProdPubEmail_CopyrightRegistration;"Prod/Pub Email")
            {
            }
            column(BillingAccount_CopyrightRegistration;"Applicant Account")
            {
            }

            trigger OnAfterGetRecord()
            begin
                //Ushindi
                /*
                CheckReport.InitTextVariable();
                CheckReport.FormatNoText(NumberText,TTotal,'');
                */
                
                //Approvals
                ApprovalEntries.Reset;
                ApprovalEntries.SetRange("Table ID",58000);
                ApprovalEntries.SetRange("Document No.","No.");
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
                //Payments.CALCFIELDS(Payments."Bank Name",Payments."Project Description");
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
        Approver: array [10] of Code[20];
        ApproverDate: array [10] of DateTime;
        UserSetup: Record "User Setup";
        UserSetup1: Record "User Setup";
        UserSetup2: Record "User Setup";
        UserSetup3: Record "User Setup";
        i: Integer;
}

