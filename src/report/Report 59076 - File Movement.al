report 59076 "File Movement"
{
    DefaultLayout = RDLC;
    RDLCLayout = './File Movement.rdlc';

    dataset
    {
        dataitem("File Movement Header";"File Movement Header")
        {
            DataItemTableView = WHERE(Status=CONST(Approved));
            RequestFilterFields = "File Number","Account No.","To Responsibility Center","Date Requested";
            column(DateRequested_FileMovementHeader;"File Movement Header"."Date Requested")
            {
            }
            column(FileNumber_FileMovementHeader;"File Movement Header"."File Number")
            {
            }
            column(FileName_FileMovementHeader;"File Movement Header"."File Name")
            {
            }
            column(AccountNo_FileMovementHeader;"File Movement Header"."Account No.")
            {
            }
            column(AccountName_FileMovementHeader;"File Movement Header"."Account Name")
            {
            }
            column(DurationRequested_FileMovementHeader;"File Movement Header"."Duration Requested")
            {
            }
            column(DateReturned_FileMovementHeader;"File Movement Header"."Date Returned")
            {
            }
            column(RetrievedBy_FileMovementHeader;"File Movement Header"."Retrieved By")
            {
            }
            column(ReturnedBy_FileMovementHeader;"File Movement Header"."Returned By")
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
            column(COMPANYNAME;CompanyName)
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

    trigger OnInitReport()
    begin
        CI.Get;
        CI.CalcFields(CI.Picture);
    end;

    trigger OnPreReport()
    begin
        CI.Get;
        CI.CalcFields(CI.Picture);
    end;

    var
        CI: Record "Company Information";
}

