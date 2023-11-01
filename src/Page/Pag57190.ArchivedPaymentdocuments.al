#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57190 "Archived Payment documents"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = Payments;
    SourceTableView = where("Archive Document" = const(true));
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payee field.';
                }
                field("Payment Type"; Rec."Payment Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment Type field.';
                }
                field("On behalf of"; Rec."On behalf of")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the On behalf of field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Posted By"; Rec."Posted By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted By field.';
                }
                field("Posted Date"; Rec."Posted Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted Date field.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field("Time Posted"; Rec."Time Posted")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time Posted field.';
                }
                field("Total Amount LCY"; Rec."Total Amount LCY")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Amount LCY field.';
                }
                field("Paying Bank Account"; Rec."Paying Bank Account")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Paying Bank Account field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Series field.';
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account Type field.';
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account No. field.';
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account Name field.';
                }
                field("Imprest Amount"; Rec."Imprest Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Amount field.';
                }
                field(Surrendered; Rec.Surrendered)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Surrendered field.';
                }
                field("Applies- To Doc No."; Rec."Applies- To Doc No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Applies- To Doc No. field.';
                }
                field("Petty Cash Amount"; Rec."Petty Cash Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Petty Cash Amount field.';
                }
                field("Original Document"; Rec."Original Document")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Original Document field.';
                }
                field("PV Creation DateTime"; Rec."PV Creation DateTime")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PV Creation DateTime field.';
                }
                field("PV Creator ID"; Rec."PV Creator ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PV Creator ID field.';
                }
                field("Remaining Amount"; Rec."Remaining Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Remaining Amount field.';
                }
                field("Receipt Created"; Rec."Receipt Created")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Receipt Created field.';
                }
                field("Imprest Deadline"; Rec."Imprest Deadline")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Deadline field.';
                }
                field("Surrender Date"; Rec."Surrender Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Surrender Date field.';
                }
                field("Date Filter"; Rec."Date Filter")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Filter field.';
                }
                field("Imprest Type"; Rec."Imprest Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Type field.';
                }
                field(Project; Rec.Project)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project field.';
                }
                field("Project Description"; Rec."Project Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Description field.';
                }
                field("Travel Date"; Rec."Travel Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Travel Date field.';
                }
                field(Cashier; Rec.Cashier)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cashier field.';
                }
                field("Function Name"; Rec."Function Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Function Name field.';
                }
                field("Budget Center Name"; Rec."Budget Center Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget Center Name field.';
                }
                field("Payment Release Date"; Rec."Payment Release Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment Release Date field.';
                }
                field("No. Printed"; Rec."No. Printed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Printed field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Surrender Status"; Rec."Surrender Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Surrender Status field.';
                }
                field("Departure Date"; Rec."Departure Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Departure Date field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Cheque Type"; Rec."Cheque Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cheque Type field.';
                }
                field("Payment Narration"; Rec."Payment Narration")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment Narration field.';
                }
                field("Total VAT Amount"; Rec."Total VAT Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total VAT Amount field.';
                }
                field("Total Witholding Tax Amount"; Rec."Total Witholding Tax Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Witholding Tax Amount field.';
                }
                field("Total Net Amount"; Rec."Total Net Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Net Amount field.';
                }
                field("Total Payment Amount LCY"; Rec."Total Payment Amount LCY")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Payment Amount LCY field.';
                }
                field("Total Retention Amount"; Rec."Total Retention Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Retention Amount field.';
                }
                field("Shortcut Dimension 3 Code"; Rec."Shortcut Dimension 3 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 3 Code field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Task No. field.';
                }
                field("Job Task Name"; Rec."Job Task Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Task Name field.';
                }
                field("Actual Amount Spent"; Rec."Actual Amount Spent")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Amount Spent field.';
                }
                field("Cash Receipt Amount"; Rec."Cash Receipt Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cash Receipt Amount field.';
                }
                field("Shortcut Dimension 4 Code"; Rec."Shortcut Dimension 4 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 4 Code field.';
                }
                field("Phone Number"; Rec."Phone Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone Number field.';
                }
                field("Date of Reporting"; Rec."Date of Reporting")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Reporting field.';
                }
                field("Imprest Issue Date"; Rec."Imprest Issue Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Issue Date field.';
                }
                field("Imprest Issue Doc. No"; Rec."Imprest Issue Doc. No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Issue Doc. No field.';
                }
                field("Date Surrendered"; Rec."Date Surrendered")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Surrendered field.';
                }
                field("Surrendered By"; Rec."Surrendered By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Surrendered By field.';
                }
                field("Actual Petty Cash Amount Spent"; Rec."Actual Petty Cash Amount Spent")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Petty Cash Amount Spent field.';
                }
                field("Shortcut Dimension 5 Code"; Rec."Shortcut Dimension 5 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 5 Code field.';
                }
                field("Remaining Petty Cash Amount"; Rec."Remaining Petty Cash Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Remaining Petty Cash Amount field.';
                }
                field("Receipted Petty Cash Amount"; Rec."Receipted Petty Cash Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Receipted Petty Cash Amount field.';
                }
                field("Imprest Memo Surrender No"; Rec."Imprest Memo Surrender No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Memo Surrender No field.';
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dimension Set ID field.';
                }
                field("VAT Wthheld six %"; Rec."VAT Wthheld six %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the VAT Wthheld six % field.';
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Name field.';
                }
                field("Project Budget"; Rec."Project Budget")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Project Budget field.';
                }
                field("Actual Project Costs"; Rec."Actual Project Costs")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Project Costs field.';
                }
                field("PO Commitments"; Rec."PO Commitments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Purchase Order Commitments field.';
                }
                field("PRN Commitments"; Rec."PRN Commitments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Purchase Requisition(PRN) Commitments field.';
                }
                field("Store Requisition Commitments"; Rec."Store Requisition Commitments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Store Requisition(S11) Commitments field.';
                }
                field("Imprest Application Commitment"; Rec."Imprest Application Commitment")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Applications Commitments field.';
                }
                field("Total Budget Commitments"; Rec."Total Budget Commitments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Budget Commitments field.';
                }
                field("Available Funds"; Rec."Available Funds")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Available Funds field.';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department Name field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field("Unit  Name"; Rec."Unit  Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit  Name field.';
                }
                field("Division Name"; Rec."Division Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Division Name field.';
                }
                field("Notification Sent"; Rec."Notification Sent")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notification Sent field.';
                }
                field("DateTime Sent"; Rec."DateTime Sent")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the DateTime Sent field.';
                }
                field("Destination Name"; Rec."Destination Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Destination Name field.';
                }
                field(Reversed; Rec.Reversed)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reversed field.';
                }
                field("Imprest Memo No"; Rec."Imprest Memo No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Memo No field.';
                }
                field("Job Group"; Rec."Job Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Group field.';
                }
                field("Imprest Bank Account Number"; Rec."Imprest Bank Account Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Bank Account Number field.';
                }
                field("Imprest Bank Name"; Rec."Imprest Bank Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Bank Name field.';
                }
                field("Imprest Bank Branch Name"; Rec."Imprest Bank Branch Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Bank Branch Name field.';
                }
                field("Vendor Bank"; Rec."Vendor Bank")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor Bank field.';
                }
                field("Vendor Bank Branch"; Rec."Vendor Bank Branch")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor Bank Branch field.';
                }
                field("Vendor Bank Account"; Rec."Vendor Bank Account")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vendor Bank Account field.';
                }
                field("Advance Recovery"; Rec."Advance Recovery")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Advance Recovery field.';
                }
                field("Total Net Pay"; Rec."Total Net Pay")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Net Pay field.';
                }
                field(Test; Rec.Test)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Test field.';
                }
                field("Used Claim"; Rec."Used Claim")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Used Claim field.';
                }
                field("Amount Paid"; Rec."Amount Paid")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount Paid field.';
                }
                field("PV Remaining Amount"; Rec."PV Remaining Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PV Remaining Amount field.';
                }
                field("Part Payment"; Rec."Part Payment")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Part Payment field.';
                }
                field("User ID Filter"; Rec."User ID Filter")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User ID Filter field.';
                }
                field("Reasons to Reopen"; Rec."Reasons to Reopen")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reasons to Reopen field.';
                }
                field("Payment processed"; Rec."Payment processed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment processed field.';
                }
                field("Imprest Created"; Rec."Imprest Created")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest Created field.';
                }
                field(Imprest; Rec.Imprest)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Imprest field.';
                }
                field("Converted By"; Rec."Converted By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Converted By field.';
                }
                field("Date converted"; Rec."Date converted")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date converted field.';
                }
                field("Time converted"; Rec."Time converted")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time converted field.';
                }
                field("Vote Item"; Rec."Vote Item")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vote Item field.';
                }
                field("Vote Amount"; Rec."Vote Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vote Amount field.';
                }
                field(Commitments; Rec.Commitments)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Commitments field.';
                }
                field("Actual Amount"; Rec."Actual Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Amount field.';
                }
                field("Available Amount"; Rec."Available Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Available Amount field.';
                }
                field("Reference No."; Rec."Reference No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reference No. field.';
                }
                field(Selected; Rec.Selected)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Selected field.';
                }
                field(Job; Rec.Job)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job field.';
                }
                field("Job Task No"; Rec."Job Task No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Task No field.';
                }
                field("Job Name"; Rec."Job Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Name field.';
                }
                field("Send for Posting"; Rec."Send for Posting")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Send for Posting field.';
                }
                field("Standing Imprest Type"; Rec."Standing Imprest Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Standing Imprest Type field.';
                }
                field("Salary Advance"; Rec."Salary Advance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Salary Advance field.';
                }
                field("Salary Last Drawn"; Rec."Salary Last Drawn")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Salary Last Drawn field.';
                }
                field("Date of Joining"; Rec."Date of Joining")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Joining field.';
                }
                field("No of months deducted"; Rec."No of months deducted")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No of months deducted field.';
                }
                field("Amount Pending"; Rec."Amount Pending")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount Pending field.';
                }
                field("Recovery Start Month"; Rec."Recovery Start Month")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recovery Start Month field.';
                }
                field("Monthly Installment"; Rec."Monthly Installment")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Monthly Installment field.';
                }
                field(Purpose; Rec.Purpose)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Purpose field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
                field("Amount Approved"; Rec."Amount Approved")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount Approved field.';
                }
                field("Effective from Month"; Rec."Effective from Month")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Effective from Month field.';
                }
                field("Float Reimbursement"; Rec."Float Reimbursement")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Float Reimbursement field.';
                }
                field(Destination; Rec.Destination)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Destination field.';
                }
                field(Finance; Rec.Finance)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Finance field.';
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department Code field.';
                }
                field("Directorate Code"; Rec."Directorate Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directorate Code field.';
                }
                field(Division; Rec.Division)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Division field.';
                }
                field(HOD; Rec.HOD)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the HOD field.';
                }
                field(Select; Rec.Select)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Select field.';
                }
                field(banked; Rec.banked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the banked field.';
                }
                field("Commitments."; Rec."Commitments.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Commitments. field.';
                }
                field("Job Task Budget"; Rec."Job Task Budget")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Task Budget field.';
                }
                field("Job Task Remaining Amount"; Rec."Job Task Remaining Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Task Remaining Amount field.';
                }
                field("Funding Source"; Rec."Funding Source")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funding Source field.';
                }
                field("Archive Document"; Rec."Archive Document")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Archive Document field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

