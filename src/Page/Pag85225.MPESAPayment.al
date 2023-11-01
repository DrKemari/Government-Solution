#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85225 "MPESA Payment"
{
    PageType = Card;
    SourceTable = "Student Processing Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("MPESA Number"; PhoneNo)
                {
                    ApplicationArea = Basic;
                    Caption = 'MPESA Phone Number';
                    ToolTip = 'Specifies the value of the MPESA Phone Number field.';
                    trigger OnValidate()
                    begin
                        //remove 0 the phoneno
                        PhoneNo := DelChr(PhoneNo, '<', '0');
                        PhoneNo := '254' + PhoneNo;
                    end;
                }
            }
        }
        area(factboxes)
        {
            part(Control45; "Applicant Picture")
            {
                ApplicationArea = Basic, Suite;
                Editable = false;
                SubPageLink = "No." = field("No.");
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Pay Now")
            {
                ApplicationArea = Basic;
                Image = Payment;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Pay Now action.';
                trigger OnAction()
                var
                    TXT001: label 'Initiate an MPESA payment request?';
                   // Payment: Codeunit UnknownCodeunit50104;
                    TXT002: label 'Kindy input a valid phone number';
                begin

                    if Rec."Document Type" = Rec."document type"::Booking then begin
                        Rec.CalcFields("Booking Amount");
                        if PhoneNo <> '' then begin
                            if Rec."Booking Amount" > 0 then begin
                                if Confirm(TXT001) = true then begin
                                    Rec.TestField("Booking Invoice No.");
                                  //  Payment.FnSendstkpush("No.", PhoneNo, "Booking Amount");
                                    CurrPage.Close;
                                end
                            end
                        end else
                            Error(TXT002);
                    end;
                    if Rec."Document Type" = Rec."document type"::Registration then begin
                        if PhoneNo <> '' then begin
                            if Rec."Application Amount" > 0 then begin
                                if Confirm(TXT001) = true then begin
                                    Rec.TestField("Application Invoice");
                                    //Payment.FnSendstkpush("No.", PhoneNo, "Application Amount");
                                    CurrPage.Close;
                                end
                            end
                        end else
                            Error(TXT002);
                    end;
                    if Rec."Document Type" = Rec."document type"::Exemption then begin
                        Rec.CalcFields("Exemption Amount");
                        if PhoneNo <> '' then begin
                            if Rec."Exemption Amount" > 0 then begin
                                if Confirm(TXT001) = true then begin
                                    Rec.TestField("Exemption Invoice No.");
                                   // Payment.FnSendstkpush("No.", PhoneNo, "Exemption Amount");

                                    CurrPage.Close;
                                end
                            end
                        end else
                            Error(TXT002);
                    end;
                    if Rec."Document Type" = Rec."document type"::Renewal then begin
                        Rec.CalcFields("Renewal Amount");
                        if PhoneNo <> '' then begin
                            if Rec."Renewal Amount" > 0 then begin
                                if Confirm(TXT001) = true then begin
                                    Rec.TestField("Renewal Invoice No.");
                                  //  Payment.FnSendstkpush("No.", PhoneNo, "Renewal Amount");

                                    CurrPage.Close;
                                end
                            end
                        end else
                            Error(TXT002);
                    end;
                end;
            }
        }
    }

    var
        PhoneNo: Text;
}

#pragma implicitwith restore

