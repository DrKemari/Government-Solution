report 59070 "File Requisition Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './File Requisition Report.rdlc';

    dataset
    {
        dataitem("File Movement Header";"File Movement Header")
        {
            RequestFilterFields = Status,"Date Requested","To Responsibility Center";
            column(No_FileMovementHeader;"File Movement Header"."No.")
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
            column(DateRequested_FileMovementHeader;"File Movement Header"."Date Requested")
            {
            }
            column(RequestedBy_FileMovementHeader;"File Movement Header"."Requested By")
            {
            }
            column(DateRetrieved_FileMovementHeader;"File Movement Header"."Date Retrieved")
            {
            }
            column(ResponsiblityCenter_FileMovementHeader;"File Movement Header"."Responsiblity Center")
            {
            }
            column(ExpectedReturnDate_FileMovementHeader;"File Movement Header"."Expected Return Date")
            {
            }
            column(DurationRequested_FileMovementHeader;"File Movement Header"."Duration Requested")
            {
            }
            column(DateReturned_FileMovementHeader;"File Movement Header"."Date Returned")
            {
            }
            column(FileLocation_FileMovementHeader;"File Movement Header"."File Location")
            {
            }
            column(CurrentFileLocation_FileMovementHeader;"File Movement Header"."Current File Location")
            {
            }
            column(RetrievedBy_FileMovementHeader;"File Movement Header"."Retrieved By")
            {
            }
            column(ReturnedBy_FileMovementHeader;"File Movement Header"."Returned By")
            {
            }
            column(GlobalDimension1Code_FileMovementHeader;"File Movement Header"."Global Dimension 1 Code")
            {
            }
            column(GlobalDimension2Code_FileMovementHeader;"File Movement Header"."Global Dimension 2 Code")
            {
            }
            column(Status_FileMovementHeader;"File Movement Header".Status)
            {
            }
            column(UserID_FileMovementHeader;"File Movement Header"."User ID")
            {
            }
            column(IssuingFileLocation_FileMovementHeader;"File Movement Header"."Issuing File Location")
            {
            }
            column(NoSeries_FileMovementHeader;"File Movement Header"."No. Series")
            {
            }
            column(FileMovementStatus_FileMovementHeader;"File Movement Header"."File Movement Status")
            {
            }
            column(RecievedBy_FileMovementHeader;"File Movement Header"."Recieved By")
            {
            }
            column(ToAccountNo_FileMovementHeader;"File Movement Header"."To Account No.")
            {
            }
            column(ToAccountName_FileMovementHeader;"File Movement Header"."To Account Name")
            {
            }
            column(Version_FileMovementHeader;"File Movement Header".Version)
            {
            }
            column(ToResponsibilityCenter_FileMovementHeader;"File Movement Header"."To Responsibility Center")
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
            area(content)
            {
            }
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
        CI.Get;
        CI.CalcFields(CI.Picture);
    end;

    var
        CI: Record "Company Information";
}

