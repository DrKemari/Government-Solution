#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
/// <summary>
/// Page Miscellaneous Application (ID 85232).
/// </summary>
#pragma implicitwith disable
Page 85232 "Miscellaneous Application"
{
    Caption = 'Miscellaneous Application';
    DeleteAllowed = false;
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
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Visible = true;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Pay Mode"; Rec."Pay Mode")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pay Mode field.';
                }
                field("Cheque No"; Rec."Cheque No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Transaction No';
                    ToolTip = 'Specifies the value of the Transaction No field.';
                }
                field("Cheque Date"; Rec."Cheque Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Transaction Date';
                    ToolTip = 'Specifies the value of the Transaction Date field.';
                }
                field("Bank Code"; Rec."Bank Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Code field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Currency Code field.';
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
                    ToolTip = 'Specifies the value of the Received From field.';
                    trigger OnValidate()
                    begin
                        Rec."Received From" := UpperCase(Rec."Received From");
                    end;
                }
                field("On Behalf Of"; Rec."On Behalf Of")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the On Behalf Of field.';
                    trigger OnValidate()
                    begin
                        Rec."On Behalf Of" := UpperCase(Rec."On Behalf Of");
                    end;
                }
                field("Payment Reference No."; Rec."Payment Reference No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment Reference No. field.';
                }
                // field("Paying Phone No"; PhoneNo)
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the PhoneNo field.';
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
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Amount(LCY)"; Rec."Amount(LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount(LCY) field.';
                }
                field("Posted Date"; Rec."Posted Date")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Posted Date field.';
                }
                field(Cashier; Rec.Cashier)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Cashier field.';
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
                ToolTip = 'Executes the Post action.';
                trigger OnAction()
                begin
                    Rec.TestField("Received From");
                    Examination.PostStudentReceipt(Rec);
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
                ToolTip = 'Executes the Pay Now action.';
                // trigger OnAction()
                // var
                //     TXT001: label 'Initiate an MPESA payment request?';
                //     Payment: Codeunit UnknownCodeunit50104;
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
                ToolTip = 'Executes the Payment Details action.';
            }
            action("&Print")
            {
                ApplicationArea = Basic;
                Caption = '&Print';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the &Print action.';
                trigger OnAction()
                begin
                    Rec.SetRange("No.", Rec."No.");
                    Report.Run(56003, true, true, Rec);
                end;
            }
            action("MPESA Payment Details")
            {
                ApplicationArea = Basic;
                Image = ApplicationWorksheet;
                Promoted = true;
                PromotedCategory = Category8;
                RunObject = Page "Mpesa Application";
                RunPageLink = MPESA_TXN_ID = field("Payment Reference No.");
                RunPageMode = View;
                ToolTip = 'Executes the MPESA Payment Details action.';
            }
            action("Attach Documents")
            {
                ApplicationArea = Basic;
                Image = Attach;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;
                ToolTip = 'Executes the Attach Documents action.';
                // trigger OnAction()
                // begin
                //     //DMSManagement.UploadImprestDocuments("No.", 'Imprest Naration', RecordId);
                // end;
            }
        }
    }
    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Student Receipt";
    end;

    var
        Examination: Codeunit Examination;
}

#pragma implicitwith restore
