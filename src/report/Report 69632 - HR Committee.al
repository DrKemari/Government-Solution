report 69632 "HR Committee"
{
    DefaultLayout = RDLC;
    RDLCLayout = './HR Committee.rdlc';

    dataset
    {
        dataitem(HD;"Commitee Appointment Voucher")
        {
            column(Company;CompanyInformation.Name)
            {
            }
            column(Logo;CompanyInformation.Picture)
            {
            }
            column(AdditionalBrief_HD;HD."Additional Brief")
            {
            }
            column(DocumentNo_HD;HD."Document No.")
            {
            }
            column(DocumentType_HD;HD."Document Type")
            {
            }
            column(CommitteeTypeID_HD;HD."Committee Type ID")
            {
            }
            column(OriginalAppointmentNo_HD;HD."Original Appointment No.")
            {
            }
            column(TerminationCategory_HD;HD."Termination Category")
            {
            }
            column(TerminationDetails_HD;HD."Termination Details")
            {
            }
            column(DocumentDate_HD;HD."Document Date")
            {
            }
            column(Description_HD;HD.Description)
            {
            }
            column(AppointmentEffectiveDate_HD;HD."Appointment Effective Date")
            {
            }
            column(TenureEndDate_HD;HD."Tenure End Date")
            {
            }
            column(AppointingAuthority_HD;HD."Appointing Authority")
            {
            }
            column(RaisedBy_HD;HD."Raised By")
            {
            }
            column(StaffID_HD;HD."Staff ID")
            {
            }
            column(Name_HD;HD.Name)
            {
            }
            column(Region_HD;HD.Region)
            {
            }
            column(BranchCentre_HD;HD."Branch/Centre")
            {
            }
            column(Directorate_HD;HD.Directorate)
            {
            }
            column(Department_HD;HD.Department)
            {
            }
            column(ApprovalStatus_HD;HD."Approval Status")
            {
            }
            column(RequiredNoofMembers_HD;HD."Required No. of Members")
            {
            }
            column(AppointedMembers_HD;HD."Appointed Members")
            {
            }
            column(TerminatedMembers_HD;HD."Terminated Members")
            {
            }
            column(NoSeries_HD;HD."No. Series")
            {
            }
            column(VacancyID_HD;HD."Vacancy ID")
            {
            }
            column(TermsofReference_HD;HD."Terms of Reference")
            {
            }
            column(Venue_HD;HD.Venue)
            {
            }
            dataitem(LN;"Commitee Appointed Member")
            {
                DataItemLink = "Document No."=FIELD("Document No."),"Document Type"=FIELD("Document Type");
                column(DocumentNo_LN;LN."Document No.")
                {
                }
                column(DocumentType_LN;LN."Document Type")
                {
                }
                column(LineNo_LN;LN."Line No")
                {
                }
                column(MemberNo_LN;LN."Member No.")
                {
                }
                column(Role_LN;LN.Role)
                {
                }
                column(MemberName_LN;LN."Member Name")
                {
                }
                column(MemberEmail_LN;LN."Member Email")
                {
                }
                column(TelephoneNo_LN;LN."Telephone No.")
                {
                }
                column(Designation_LN;LN.Designation)
                {
                }
                column(StaffNo_LN;LN."Staff No.")
                {
                }
                column(IDPassportNo_LN;LN."ID/Passport No")
                {
                }
                column(TaxRegistrationPINNo_LN;LN."Tax Registration (PIN) No.")
                {
                }
                column(NotifiedonEmail_LN;LN."Notified on Email")
                {
                }
                column(DateTimeNotified_LN;LN."Date/Time Notified")
                {
                }
                column(EffectiveDate_LN;LN."Effective Date")
                {
                }
                column(ExpiryDate_LN;LN."Expiry Date")
                {
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
        CompanyInformation.Get;
        CompanyInformation.CalcFields(Picture);
    end;

    var
        CompanyInformation: Record "Company Information";
}

