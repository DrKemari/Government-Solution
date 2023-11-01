#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51333 "QA Audit Plan"
{
    PageType = Card;
    SourceTable = "Audit Qualification Categories";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Category; Rec.Category)
                {
                    ApplicationArea = Basic;
                }
                // field("QA Calendar ID"; "QA Calendar ID")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Institution ID"; "Institution ID")
                // {
                //     ApplicationArea = Basic;
                //     Visible = false;
                // }
                // field("Institution Name"; "Institution Name")
                // {
                //     ApplicationArea = Basic;
                //     Visible = false;
                // }
                // field("Planned Start Date"; "Planned Start Date")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Plannned End Date"; "Plannned End Date")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Scope Summary"; "Scope Summary")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Approval Status"; "Approval Status")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Created By"; "Created By")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Created On"; "Created On")
                // {
                //     ApplicationArea = Basic;
                // }
            }
            group("Resource Summary")
            {
                // field("Responsible Employee No."; "Responsible Employee No.")
                // {
                //     ApplicationArea = Basic;
                // }
                // field(Designation; Designation)
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Employee Name"; "Employee Name")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Responsibility Center"; "Responsibility Center")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Responsibility Center Name"; "Responsibility Center Name")
                // {
                //     ApplicationArea = Basic;
                // }
            }
            group("Budget Estimate")
            {
                // field("Total Estimate Budget (LCY)"; "Total Estimate Budget (LCY)")
                // {
                //     ApplicationArea = Basic;
                // }
            }
        }
        area(factboxes)
        {
            systempart(Control23; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control24; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control25; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control26; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(ActionGroup29)
            {
                action("Audit Plan Objectives")
                {
                    ApplicationArea = Basic;
                    Caption = 'Audit Plan Objectives';
                    Image = Absence;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "QA Audit Plan Objectives";
                    RunPageLink = Description = field(Code);
                }
                action("Proposed Team/Resources")
                {
                    ApplicationArea = Basic;
                    Caption = 'Proposed Team/Resources';
                    Image = Agreement;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "QA Plan Resources";
                    // RunPageLink = "Document Type" = field(Code);
                }
                action("Budget Estimates")
                {
                    ApplicationArea = Basic;
                    Caption = 'Budget Estimates';
                    Image = Balance;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "QA Budget Estimates";
                    RunPageLink = "Quality Response No." = field(Code);
                }
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Enabled = not OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;

                    trigger OnAction()
                    var
                    //  //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin

                        /*//if //ApprovalsMgmt.CheckPurchaseApprovalPossible(Rec) THEN
                          //ApprovalsMgmt.OnSendPurchaseDocForApproval(Rec);*/

                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = OpenApprovalEntriesExist;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category9;

                    trigger OnAction()
                    var
                    //  //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ////ApprovalsMgmt.OnCancelPurchaseApprovalRequest(Rec);
                    end;
                }
            }
            group(Print)
            {
                Caption = 'Print';
                Image = Print;
                action("&Print")
                {
                    ApplicationArea = Basic;
                    Caption = '&Print';
                    Ellipsis = true;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;

                    trigger OnAction()
                    begin
                        //DocPrint.PrintPurchHeader(Rec);
                    end;
                }
            }
            action("Email Engagement Letter ")
            {
                ApplicationArea = Basic;
                Image = email;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = Process;
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = true;

                trigger OnAction()
                begin

                    //code to send email
                    /*
                    Rec.RESET;
                    Rec.SETRANGE(Rec."Insitution No", "Insitution No");
                    
                    SMTPMailSet.GET;
                    Cust.RESET;
                    Cust.GET("Insitution No.");
                    Customer:="Insitution No.";
                    IF CONFIRM('Are you sure you want to send the receipt to '+Cust."E-Mail",FALSE) THEN BEGIN
                    Notification1.CreateMessage('Commission for University Education',SMTPMailSet."Email Sender Address",Cust."E-Mail",'Receipt',
                                    'Dear '+ Cust.Name + ',<BR><BR>'+
                                    ' Your payment for' +' '+' '+UPPERCASE(FORMAT("Accreditation Type")+'accreditation') + ' '+'has been successfully processed.<BR>Find attached the Receipt<BR>'+'<BR>',TRUE);
                    
                    Notification1.AppendToBody(
                    '<BR><BR>Kind Regards,'+
                    '<BR><BR>For any Information, Please Contact'+'<BR>Finance Department<BR>'+
                    CompInfo.Name+'<BR>'+
                    CompInfo.Address+'<BR>'+
                    CompInfo."Address 2"+'<BR>'+
                    CompInfo."Phone No."+'<BR>'+
                    CompInfo.City);
                        ReceiptHeader.RESET;
                        CALCFIELDS("Receipt No.");
                        ReceiptHeader.SETRANGE("No.","Receipt No.");
                        IF ReceiptHeader.FINDSET THEN BEGIN
                    //can only send posted receipts
                            FileDirectory:= 'D:\Receipts';
                            FileName:='Receipt_'+FORMAT("Accreditation Type")+Customer+'.pdf';
                            IF FILE.EXISTS(FileDirectory+FileName) THEN
                            FILE.ERASE(FileDirectory+FileName);
                            //Report.SaveAsPdf(56003,FileDirectory+FileName,ReceiptHeader);//56231
                            Notification1.AddAttachment(FileDirectory+FileName,FileName);
                            Notification1.Send;
                            MESSAGE('The Receipt was successfully sent');
                    
                            IF FILE.EXISTS(FileDirectory+FileName) THEN
                            FILE.ERASE(FileDirectory+FileName);
                    
                            END ELSE BEGIN
                              MESSAGE('not found');
                            END
                        END
                        */

                end;
            }
        }
    }

    var
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
}

#pragma implicitwith restore

