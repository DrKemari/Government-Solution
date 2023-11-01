report 85154 "Script Analysis Report"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Script Analysis Report.rdlc';

    dataset
    {
        dataitem(Header;"Center  Header")
        {
            DataItemTableView = WHERE("Document Type"=CONST("Script Receipt"));
            column(Logo;CI.Picture)
            {
            }
            column(DocumentNo_Header;Header."Document No.")
            {
            }
            column(Description_Header;Header.Description)
            {
            }
            column(ProjectNo_Header;Header."Project No.")
            {
            }
            column(ProjectName_Header;Header."Project Name")
            {
            }
            column(SittingCycle_Header;Header."Sitting Cycle")
            {
            }
            column(CenterCode_Header;Header."Center Code")
            {
            }
            column(CenterName_Header;Header."Center Name")
            {
            }
            column(ApprovalStatus_Header;Header."Approval Status")
            {
            }
            column(DocumentStatus_Header;Header."Document Status")
            {
            }
            column(CreatedBy_Header;Header."Created By")
            {
            }
            column(CreatedOn_Header;Header."Created On")
            {
            }
            column(Posted_Header;Header.Posted)
            {
            }
            column(PostedOn_Header;Header."Posted On")
            {
            }
            column(PostedBy_Header;Header."Posted By")
            {
            }
            column(NoSeries_Header;Header."No. Series")
            {
            }
            column(ExaminationStartDate_Header;Header."Examination Start Date")
            {
            }
            column(ExaminationEndDate_Header;Header."Examination End Date")
            {
            }
            column(TotalCandidature_Header;Header."Total Candidature")
            {
            }
            column(DocumentType_Header;Header."Document Type")
            {
            }
            column(MarkingStartDate_Header;Header."Marking Start Date")
            {
            }
            column(MarkingEndDate_Header;Header."Marking End Date")
            {
            }
            dataitem(LNS;"Center Dispatch Lines")
            {
                DataItemLink = "Document No."=FIELD("Document No.");
                column(DocumentNo_LNS;LNS."Document No.")
                {
                }
                column(Variance;Variance)
                {
                }
                column(LineNo_LNS;LNS."Line No.")
                {
                }
                column(StationeryType_LNS;LNS."Stationery Type")
                {
                }
                column(StationeryName_LNS;LNS."Stationery Name")
                {
                }
                column(UnitofMeasure_LNS;LNS."Unit of Measure")
                {
                }
                column(Quantity_LNS;LNS.Quantity)
                {
                }
                column(SerialNoFrom_LNS;LNS."Serial No From")
                {
                }
                column(SerialNoTo_LNS;LNS."Serial No. To")
                {
                }
                column(SerialNoFromReceived_LNS;LNS."Serial No From Received")
                {
                }
                column(SerialNoToReceived_LNS;LNS."Serial No. To Received")
                {
                }
                column(QuantityReceived_LNS;LNS."Quantity Received")
                {
                }
                column(NoofEnvelopes_LNS;LNS."No. of Envelopes")
                {
                }
                column(Examination_LNS;LNS.Examination)
                {
                }
                column(PaperCode_LNS;LNS."Paper Code")
                {
                }
                column(NoofScriptsExpected_LNS;LNS."No. of Scripts Expected")
                {
                }
                column(ExaminationSitting_LNS;LNS."Examination Sitting")
                {
                }
                column(CreatedBy_LNS;LNS."Created By")
                {
                }
                column(LastModifiedDate_LNS;LNS."Last Modified Date")
                {
                }
                column(Submitted_LNS;LNS.Submitted)
                {
                }
                column(PaperName_LNS;LNS."Paper Name")
                {
                }
                column(EnvelopeSerialNo_LNS;LNS."Envelope Serial No.")
                {
                }
                column(Posted_LNS;LNS.Posted)
                {
                }
                column(Level_LNS;LNS.Level)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    LNS.CalcFields("Quantity Received");
                    Variance:=LNS."No. of Scripts Expected"-LNS."Quantity Received";
                end;
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
        CenterCourseCapacity: Record "Center Course Capacity";
        LevelName: Text;
        Level: Record Level;
        LevelId: Integer;
        Courses: Record Courses;
        CourseName: Text;
        Variance: Integer;
}

