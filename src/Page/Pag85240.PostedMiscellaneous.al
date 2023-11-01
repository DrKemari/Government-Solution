#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85240 "Posted Miscellaneous"
{
    Caption = 'Posted Miscellaneous';
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "Receipts Header1";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Visible = true;
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
                }
                field("Cheque No"; Rec."Cheque No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Transaction No';
                }
                field("Cheque Date"; Rec."Cheque Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Transaction Date';
                }
                field("Bank Code"; Rec."Bank Code")
                {
                    ApplicationArea = Basic;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;

                    // trigger OnAssistEdit()
                    // begin
                    //     Clear(ChangeExchangeRate);
                    //     if Date <> 0D then
                    //         ChangeExchangeRate.SetParameter("Currency Code", "Currency Factor", Date)
                    //     else
                    //         ChangeExchangeRate.SetParameter("Currency Code", "Currency Factor", WorkDate);
                    //     if ChangeExchangeRate.RunModal = Action::OK then begin
                    //         Validate("Currency Factor", ChangeExchangeRate.GetParameter);
                    //         CurrPage.Update;
                    //     end;
                    //     Clear(ChangeExchangeRate);
                    // end;

                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord;
                    end;
                }
                field("Received From"; Rec."Received From")
                {
                    ApplicationArea = Basic;
                }
                field("On Behalf Of"; Rec."On Behalf Of")
                {
                    ApplicationArea = Basic;
                }
                field("Payment Reference No."; Rec."Payment Reference No.")
                {
                    ApplicationArea = Basic;
                }
                // field("Paying Phone No"; PhoneNo)
                // {
                //     ApplicationArea = Basic;

                //     trigger OnValidate()
                //     begin
                //         //remove 0 the phoneno
                //         PhoneNo := DelChr(PhoneNo, '<', '0');
                //         PhoneNo := '254' + PhoneNo;
                //     end;
                // }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = true;
                }
                field("Amount(LCY)"; Rec."Amount(LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Posted Date"; Rec."Posted Date")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field(Cashier; Rec.Cashier)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
            part(Control8; "Miscellaneous Lines")
            {
                SubPageLink = "Receipt No." = field("No.");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control1000000023; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000024; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000025; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000026; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Dimensions)
            {
                AccessByPermission = TableData Dimension = R;
                ApplicationArea = Dimensions;
                Caption = 'Dimensions';
                Enabled = Rec."No." <> '';
                Image = Dimensions;
                Promoted = false;
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = false;
                ShortCutKey = 'Shift+Ctrl+D';
                ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';

                trigger OnAction()
                begin
                    Rec.ShowDocDim;
                    CurrPage.SaveRecord;
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;

                trigger OnAction()
                begin
                    Rec.TestField("Received From");
                    //  Examination.PostStudentReceipt(Rec);
                    CurrPage.Close;
                end;
            }
            action("Pay Now")
            {
                ApplicationArea = Basic;
                Image = Payment;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                // trigger OnAction()
                // var
                //     TXT001: label 'Initiate an MPESA payment request?';
                //    // Payment: Codeunit UnknownCodeunit50104;
                //     TXT002: label 'Kindy input a valid phone number';
                // begin
                //     CalcFields(Amount);
                //     if PhoneNo <> '' then begin
                //         if Amount > 0 then begin
                //             if Confirm(TXT001) = true then begin
                //                 Payment.FnSendstkpush("No.", PhoneNo, Amount);
                //                 CurrPage.Close;
                //             end
                //         end
                //     end else
                //         Error(TXT002);
                // end;
            }
            action("Payment Details")
            {
                ApplicationArea = Basic;
                Image = AnalysisView;
                Promoted = true;
                PromotedCategory = Category8;
                RunObject = Page "Bank Payment Details";
                RunPageLink = "Reference No." = field("Payment Reference No.");
                RunPageMode = View;
            }
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
                    Rec.SetRange("No.", Rec."No.");
                    Report.Run(56003, true, true, Rec);
                end;
            }
            action("Attach Documents")
            {
                ApplicationArea = Basic;
                Image = Attach;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    //DMSManagement.UploadImprestDocuments("No.", 'Imprest Naration', RecordId);
                end;
            }
        }
        //Codeunit ExaminationPage "Change Exchange Rate";
        //ApprovalsMgmt;
        // DMSManagement;
        // ""
    }
}
#pragma implicitwith restore
