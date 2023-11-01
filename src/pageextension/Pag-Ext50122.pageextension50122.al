#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
PageExtension 50122 "pageextension50122" extends "Accountant Role Center" 
{
    layout
    {

        //Unsupported feature: Property Insertion (Visible) on "Control122(Control 122)".

    }
    actions
    {
        addafter("Cost Accounting")
        {
            group("EXAMINATION FINANCIAL REPORTS")
            {
                Image = Ledger;
                action("Posted Receipts Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'Posted Receipts Report';
                    Image = "Report";
                  //  RunObject = Report "Posted Receipt Report";
                }
                action("Unaplied MPESA Amounts Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'Unaplied MPESA Amount Report';
                    Image = "Report";
                  //  RunObject = Report "MPESAUnutilized Amounts Report";
                }
                action("Unaplied Bank Amounts Report")
                {
                    ApplicationArea = Basic;
                    Caption = 'Unaplied Bank Amounts Report';
                    Image = "Report";
                   // RunObject = Report "Bank Unutilized Amounts Report";
                }
            }
        }
    }
}

