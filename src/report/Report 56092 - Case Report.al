report 56092 "Case Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Case Report.rdlc';
    PreviewMode = PrintLayout;

    dataset
    {
        dataitem("Case Register";"Case Register")
        {
            column(Logo;CompanyInformation.Picture)
            {
            }
            column(No_CaseRegister;"Case Register"."No.")
            {
            }
            column(CaseNumber_CaseRegister;"Case Register"."Case Number")
            {
            }
            column(CaseTypes_CaseRegister;"Case Register"."Case Types")
            {
            }
            column(NatureofDescription_CaseRegister;"Case Register"."Nature of Description")
            {
            }
            column(CaseDesscriptionTranspired_CaseRegister;"Case Register"."Case Desscription/Transpired")
            {
            }
            column(NatureofCase_CaseRegister;"Case Register"."Nature of Case")
            {
            }
            column(LastHearingDate_CaseRegister;"Case Register"."Last Hearing Date")
            {
            }
            column(NextHearingDate_CaseRegister;"Case Register"."Next Hearing Date")
            {
            }
            column(AdvocateonRecord_CaseRegister;"Case Register"."Advocate on Record")
            {
            }
            column(Progress_CaseRegister;"Case Register".Progress)
            {
            }
            column(NameofParties_CaseRegister;"Case Register"."Name of Parties")
            {
            }
            column(NatureofClaim_CaseRegister;"Case Register"."Nature of Claim")
            {
            }
            column(Status_CaseRegister;"Case Register".Status)
            {
            }
            column(Verdict_CaseRegister;"Case Register".Verdict)
            {
            }
            column(VerdictDate_CaseRegister;"Case Register"."Verdict Date")
            {
            }
            column(VerdictSummary_CaseRegister;"Case Register"."Verdict Summary")
            {
            }
            column(Noseries_CaseRegister;"Case Register"."No series")
            {
            }
            column(FromDocumentNumber_CaseRegister;"Case Register"."From Document Number")
            {
            }
            column(EmployeeName_CaseRegister;"Case Register"."Employee Name")
            {
            }
            column(EmployeeNo_CaseRegister;"Case Register"."Employee No")
            {
            }
            column(LastMentionDate_CaseRegister;"Case Register"."Last Mention Date")
            {
            }
            column(NextMentionDate_CaseRegister;"Case Register"."Next Mention Date")
            {
            }
            column(CourtHouse_CaseRegister;"Case Register"."Court House")
            {
            }
            dataitem("Case Plantiff-Defandants";"Case Plantiff-Defandants")
            {
                DataItemLink = "Case No"=FIELD("No.");
                column(CaseNo_CasePlantiffDefandants;"Case Plantiff-Defandants"."Case No")
                {
                }
                column(Type_CasePlantiffDefandants;"Case Plantiff-Defandants".Type)
                {
                }
                column(Code_CasePlantiffDefandants;"Case Plantiff-Defandants".Code)
                {
                }
                column(Names_CasePlantiffDefandants;"Case Plantiff-Defandants".Names)
                {
                }
                column(Contacts_CasePlantiffDefandants;"Case Plantiff-Defandants".Contacts)
                {
                }
                column(LineNo_CasePlantiffDefandants;"Case Plantiff-Defandants"."Line No")
                {
                }
                column(SourceFirm_CasePlantiffDefandants;"Case Plantiff-Defandants"."Source Firm")
                {
                }
            }

            trigger OnPreDataItem()
            begin
                CompanyInformation.Get;
                CompanyInformation.CalcFields(Picture);
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
        CompanyInformation: Record "Company Information";
}

