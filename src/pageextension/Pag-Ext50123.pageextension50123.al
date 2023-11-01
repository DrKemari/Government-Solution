#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50123 "pageextension50123" extends "Account Manager Activities" 
{
    layout
    {
    //    / modify("Document Approvals")
    //     {
    //         Caption = 'Approved Payment Documents';

    //         //Unsupported feature: Property Modification (Name) on ""Document Approvals"(Control 19)".

    //     }

        //Unsupported feature: Property Insertion (Visible) on ""POs Pending Approval"(Control 23)".


        //Unsupported feature: Property Insertion (Visible) on ""SOs Pending Approval"(Control 20)".

        addafter("Purchase Documents Due Today")
        {
            field("Purch. Invoices Due Next Week"; Rec."Purch. Invoices Due Next Week")
            {
                ApplicationArea = Basic;
            }
            field("Posted Surrenders"; Rec."Posted Surrenders")
            {
                ApplicationArea = Basic;
                DrillDownPageID = "Posted Imprest Surrenders";
            }
            field("Pending Payment Vouchers"; Rec."Pending Payment Vouchers")
            {
                ApplicationArea = Basic;
                DrillDownPageID = "Payments Vouchers";
            }
            field("Unprocessed Staff Claims"; Rec."Unprocessed Staff Claims")
            {
                ApplicationArea = Basic;
                DrillDownPageID = "Posted Staff Claims";
            }
        }
        // addfirst("Document Approvals")
        // {
        //     field("Pending Purchase Invoices";"Pending Purchase Invoices")
        //     {
        //         ApplicationArea = Basic;
        //         Caption = 'Approved Purchase Invoices';
        //         DrillDownPageID = "Purchase Invoices";
        //     }
        //     field("Approved Payment Vouchers";"Approved Payment Vouchers")
        //     {
        //         ApplicationArea = Basic;
        //         DrillDownPageID = "Approved Payment Vouchers";
        //     }
        //     field("Approved Staff Claims";"Approved Staff Claims")
        //     {
        //         ApplicationArea = Basic;
        //         DrillDownPageID = "Approved Staff Claims";
        //     }
        //     field("Approved Payment Schedules";"Approved Payment Schedules")
        //     {
        //         ApplicationArea = Basic;
        //         DrillDownPageID = "Approved Payment Schedules";
        //     }
        //     field("Approved Warrant Vouchers";"Approved Warrant Vouchers")
        //     {
        //         ApplicationArea = Basic;
        //         DrillDownPageID = "Warrant Vouchers";
        //     }
        //     field("Pending Withdrawal Payments";"Pending Withdrawal Payments")
        //     {
        //         ApplicationArea = Basic;
        //     }
        //     cuegroup("Other Approved Documents")
        //     {
        //         Caption = 'Other Approved Documents';
        //         field("Approved Surrenders";"Approved Surrenders")
        //         {
        //             ApplicationArea = Basic;
        //             DrillDownPageID = "Approved Imprest Surrenders";
        //         }
        //     }
        // }
        addafter("SOs Pending Approval")
        {
            field("Imprest Requisition-Aproved"; Rec."Imprest Requisition-Aproved")
            {
                ApplicationArea = Basic;
            }
            field("Leave Application-Approved"; Rec."Leave Application-Approved")
            {
                ApplicationArea = Basic;
                DrillDownPageID = "Approved Leave Applications";
            }
            field("Approved Salary Vouchers"; Rec."Approved Salary Vouchers")
            {
                ApplicationArea = Basic;
            }
            // cuegroup("Document Approvals")
            // {
            //     Caption = 'Document Approvals';
            //     field("Requests to Approve-Overdue";"Requests to Approve-Overdue")
            //     {
            //         ApplicationArea = Basic;
            //         Caption = 'Requests to Approve-Overdue';
            //         DrillDownPageID = "Requests to Approve";
            //     }
            //     field("Requests to Approve";"Requests to Approve")
            //     {
            //         ApplicationArea = Basic;
            //         DrillDownPageID = "Requests to Approve";
            //     }
            //     field("Requests Sent for Approval";"Requests Sent for Approval")
            //     {
            //         ApplicationArea = Basic;
            //         DrillDownPageID = "Approval Entries";
            //     }
            // }
        }
        addafter("Non-Applied Payments")
        {
            field("Customer with balance"; Rec."Customer with balance")
            {
                ApplicationArea = Basic;
                DrillDownPageID = "Customer List";
            }
            field("Vendors with Balance"; Rec."Vendors with Balance")
            {
                ApplicationArea = Basic;
                DrillDownPageID = "Vendor List";
            }
        }
    }


    //Unsupported feature: Code Modification on "OnOpenPage".

    //trigger OnOpenPage()
    //>>>> ORIGINAL CODE:
    //begin
        /*
        RESET;
        IF NOT GET THEN BEGIN
          INIT;
          INSERT;
        END;

        SETFILTER("Due Date Filter",'<=%1',WORKDATE);
        SETFILTER("Overdue Date Filter",'<%1',WORKDATE);
        SETFILTER("User ID Filter",USERID);
        ShowCheckForOCR := OCRServiceMgt.OcrServiceIsEnable;
        */
    //end;
    //>>>> MODIFIED CODE:
    //begin
        /*
        #1..6

        SETFILTER("User ID Filter",USERID);

        SETFILTER("User ID Filter",'=%1',USERID);
        ShowCheckForOCR := OCRServiceMgt.OcrServiceIsEnable;
        */
    //end;
}

#pragma implicitwith restore

