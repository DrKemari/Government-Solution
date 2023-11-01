#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Query 58845 "ScriptDispatch"
{

    elements
    {
        dataitem(Scripts_Dispatch_Header;"Scripts Dispatch Header")
        {
            column(Document_No;"Document No.")
            {
            }
            column(Description;Description)
            {
            }
            column(Project_No;"Project No.")
            {
            }
            column(Project_Name;"Project Name")
            {
            }
            column(Sitting_Cycle;"Sitting Cycle")
            {
            }
            column(Approval_Status;"Approval Status")
            {
            }
            column(Document_Status;"Document Status")
            {
            }
            column(Document_Type;"Document Type")
            {
            }
            column(Marking_Start_Date;"Marking Start Date")
            {
            }
            column(Marking_End_Date;"Marking End Date")
            {
            }
            column(Examination;Examination)
            {
            }
            column(Marker_No;"Marker No")
            {
            }
            column(Marker_Name;"Marker Name")
            {
            }
            column(Document_Date;"Document Date")
            {
            }
            column(Examination_Name;"Examination Name")
            {
            }
            dataitem(Scripts_Dispatch_Lines;"Scripts Dispatch Lines")
            {
                DataItemLink = Examination=Scripts_Dispatch_Header.Examination,"Document No."=Scripts_Dispatch_Header."Document No.","Paper Code"=Scripts_Dispatch_Header."Paper Code","Examination Sitting"=Scripts_Dispatch_Header."Sitting Cycle";
                column(Center_Code;"Center Code")
                {
                }
                column(Center_Name;"Center Name")
                {
                }
                column(No_of_Scripts_Expected;"No. of Scripts Expected")
                {
                }
                column(Envelope_Serial_No;"Envelope Serial No.")
                {
                }
                column(Quantity_Received;"Quantity Received")
                {
                }
                column(No_of_Envelopes;"No. of Envelopes")
                {
                }
                column(Script_Receipt_No;"Script Receipt No")
                {
                }
                column(Envelope_No;"Envelope No")
                {
                }
                column(No_of_Envelope_Scripts;"No. of Envelope Scripts")
                {
                }
                column(Marking_Complete;"Marking Complete")
                {
                }
                column(Marksheet_Issued;"Marksheet Issued")
                {
                }
                column(Marksheet_Returned;"Marksheet Returned")
                {
                }
                column(Issued_By;"Issued By")
                {
                }
                column(Issued_Date;"Issued Date")
                {
                }
            }
        }
    }
}

