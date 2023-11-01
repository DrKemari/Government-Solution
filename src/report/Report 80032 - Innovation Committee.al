report 80032 "Innovation Committee"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Innovation Committee.rdlc';

    dataset
    {
        dataitem("Innovation Committee";"Innovation Committee")
        {
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
            column(DocumentNo_InnovationCommittee;"Innovation Committee"."Document No.")
            {
            }
            column(CommitteeType_InnovationCommittee;"Innovation Committee"."Committee Type")
            {
            }
            column(Description_InnovationCommittee;"Innovation Committee".Description)
            {
            }
            column(AppointmentEffectiveDate_InnovationCommittee;"Innovation Committee"."Appointment Effective Date")
            {
            }
            column(AppointingAuthority_InnovationCommittee;"Innovation Committee"."Appointing Authority")
            {
            }
            column(TenderName_InnovationCommittee;"Innovation Committee"."Tender Name")
            {
            }
            column(ApprovalStatus_InnovationCommittee;"Innovation Committee"."Approval Status")
            {
            }
            column(PrimaryRegion_InnovationCommittee;"Innovation Committee"."Primary Region")
            {
            }
            column(PrimaryDirectorate_InnovationCommittee;"Innovation Committee"."Primary Directorate")
            {
            }
            column(PrimaryDepartment_InnovationCommittee;"Innovation Committee"."Primary Department")
            {
            }
            column(Blocked_InnovationCommittee;"Innovation Committee".Blocked)
            {
            }
            column(NoSeries_InnovationCommittee;"Innovation Committee"."No. Series")
            {
            }
            column(CreatedBy_InnovationCommittee;"Innovation Committee"."Created By")
            {
            }
            column(CreatedDate_InnovationCommittee;"Innovation Committee"."Created Date")
            {
            }
            column(CreatedTime_InnovationCommittee;"Innovation Committee"."Created Time")
            {
            }
            column(IFSCode_InnovationCommittee;"Innovation Committee"."IFS Code")
            {
            }
            column(DocumentDate_InnovationCommittee;"Innovation Committee"."Document Date")
            {
            }
            column(DocumentStatus_InnovationCommittee;"Innovation Committee"."Document Status")
            {
            }
            column(ContractNo_InnovationCommittee;"Innovation Committee"."Contract No.")
            {
            }
            column(ExternalDocumentNo_InnovationCommittee;"Innovation Committee"."External Document No")
            {
            }
            column(RaisedBy_InnovationCommittee;"Innovation Committee"."Raised By")
            {
            }
            column(Name_InnovationCommittee;"Innovation Committee".Name)
            {
            }
            column(StaffId_InnovationCommittee;"Innovation Committee"."Staff Id")
            {
            }
            column(Designation_InnovationCommittee;"Innovation Committee".Designation)
            {
            }
            column(MinRequiredNoofMembers_InnovationCommittee;"Innovation Committee"."Min Required No. of Members")
            {
            }
            column(ActualNoofCommitteeMemb_InnovationCommittee;"Innovation Committee"."Actual No. of Committee Memb")
            {
            }
            column(Duration_InnovationCommittee;"Innovation Committee".Duration)
            {
            }
            column(Location_InnovationCommittee;"Innovation Committee".Location)
            {
            }
            column(ImprestCreated_InnovationCommittee;"Innovation Committee"."Imprest Created")
            {
            }
            column(MemoNo_InnovationCommittee;"Innovation Committee"."Memo No.")
            {
            }
            column(DefinedForUpgrade_InnovationCommittee;"Innovation Committee"."Defined For Upgrade")
            {
            }
        }
        dataitem("Innovation Member";"Innovation Member")
        {
            column(DocumentNo_InnovationMember;"Innovation Member"."Document No.")
            {
            }
            column(CommitteeType_InnovationMember;"Innovation Member"."Committee Type")
            {
            }
            column(LineNo_InnovationMember;"Innovation Member"."Line No")
            {
            }
            column(Role_InnovationMember;"Innovation Member".Role)
            {
            }
            column(MemberNo_InnovationMember;"Innovation Member"."Member No.")
            {
            }
            column(MemberName_InnovationMember;"Innovation Member"."Member Name")
            {
            }
            column(Designation_InnovationMember;"Innovation Member".Designation)
            {
            }
            column(IDPassportNo_InnovationMember;"Innovation Member"."ID/Passport No")
            {
            }
            column(TaxRegistrationPINNo_InnovationMember;"Innovation Member"."Tax Registration (PIN) No.")
            {
            }
            column(MemberEmail_InnovationMember;"Innovation Member"."Member Email")
            {
            }
            column(TelephoneNo_InnovationMember;"Innovation Member"."Telephone No.")
            {
            }
            column(StaffNo_InnovationMember;"Innovation Member"."Staff  No.")
            {
            }
            column(IFSCode_InnovationMember;"Innovation Member"."IFS Code")
            {
            }
            column(NotifiedonEmail_InnovationMember;"Innovation Member"."Notified on Email")
            {
            }
            column(DateTimeNotified_InnovationMember;"Innovation Member"."Date/Time Notified")
            {
            }
            column(Destination_InnovationMember;"Innovation Member".Destination)
            {
            }
            column(NoofDays_InnovationMember;"Innovation Member"."No. of Days")
            {
            }
            column(TotalAmount_InnovationMember;"Innovation Member"."Total Amount")
            {
            }
            column(Type_InnovationMember;"Innovation Member".Type)
            {
            }
            column(UnitAmount_InnovationMember;"Innovation Member"."Unit Amount")
            {
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
        SerialNo: Integer;
}

