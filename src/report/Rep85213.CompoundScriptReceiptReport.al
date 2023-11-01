#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 85213 "Compound Script Receipt Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Compound Script Receipt Report.rdlc';

    dataset
    {
        dataitem("Center Dispatch Lines"; "Center Dispatch Lines")
        {
            DataItemTableView = where(Posted = const(true));
            RequestFilterFields = "Examination Sitting", Examination;
            column(ReportForNavId_1; 1)
            {
            }
            column(Logo; CI.Picture)
            {
            }
            column(DocumentNo_CenterDispatchLines; "Center Dispatch Lines"."Document No.")
            {
            }
            column(LineNo_CenterDispatchLines; "Center Dispatch Lines"."Line No.")
            {
            }
            column(StationeryType_CenterDispatchLines; "Center Dispatch Lines"."Stationery Type")
            {
            }
            column(StationeryName_CenterDispatchLines; "Center Dispatch Lines"."Stationery Name")
            {
            }
            column(UnitofMeasure_CenterDispatchLines; "Center Dispatch Lines"."Unit of Measure")
            {
            }
            column(Quantity_CenterDispatchLines; "Center Dispatch Lines".Quantity)
            {
            }
            column(SerialNoFrom_CenterDispatchLines; "Center Dispatch Lines"."Serial No From")
            {
            }
            column(SerialNoTo_CenterDispatchLines; "Center Dispatch Lines"."Serial No. To")
            {
            }
            column(SerialNoFromReceived_CenterDispatchLines; "Center Dispatch Lines"."Serial No From Received")
            {
            }
            column(SerialNoToReceived_CenterDispatchLines; "Center Dispatch Lines"."Serial No. To Received")
            {
            }
            column(QuantityReceived_CenterDispatchLines; "Center Dispatch Lines"."Quantity Received")
            {
            }
            column(NoofEnvelopes_CenterDispatchLines; "Center Dispatch Lines"."No. of Envelopes")
            {
            }
            column(Examination_CenterDispatchLines; "Center Dispatch Lines".Examination)
            {
            }
            column(PaperCode_CenterDispatchLines; "Center Dispatch Lines"."Paper Code")
            {
            }
            column(NoofScriptsExpected_CenterDispatchLines; "Center Dispatch Lines"."No. of Scripts Expected")
            {
            }
            column(ExaminationSitting_CenterDispatchLines; "Center Dispatch Lines"."Examination Sitting")
            {
            }
            column(CreatedBy_CenterDispatchLines; "Center Dispatch Lines"."Created By")
            {
            }
            column(LastModifiedDate_CenterDispatchLines; "Center Dispatch Lines"."Last Modified Date")
            {
            }
            column(Submitted_CenterDispatchLines; "Center Dispatch Lines".Submitted)
            {
            }
            column(PaperName_CenterDispatchLines; "Center Dispatch Lines"."Paper Name")
            {
            }
            column(EnvelopeSerialNo_CenterDispatchLines; "Center Dispatch Lines"."Envelope Serial No.")
            {
            }
            column(Posted_CenterDispatchLines; "Center Dispatch Lines".Posted)
            {
            }
            column(Level_CenterDispatchLines; "Center Dispatch Lines".Level)
            {
            }
            column(NoMarked_CenterDispatchLines; "Center Dispatch Lines"."No Marked")
            {
            }
            column(NoSampled_CenterDispatchLines; "Center Dispatch Lines"."No. Sampled")
            {
            }
            column(NoPassing_CenterDispatchLines; "Center Dispatch Lines"."No. Passing")
            {
            }
            column(Pass_CenterDispatchLines; "Center Dispatch Lines"."% Pass")
            {
            }
            column(ScriptsType_CenterDispatchLines; "Center Dispatch Lines"."Scripts Type")
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
        CI.Get;
        CI.CalcFields(Picture);
    end;

    var
        CI: Record "Company Information";
}
