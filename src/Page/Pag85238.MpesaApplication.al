#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85238 "Mpesa Application"
{
    Editable = true;
    PageType = Worksheet;
    SourceTable = "MPESA Integration Table";
    SourceTableView = where(Fetch = filter(false));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(MPESA_TXN_ID; Rec.MPESA_TXN_ID)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the MPESA_TXN_ID field.';
                }
                field(MPESA_AMOUNT; Rec.MPESA_AMOUNT)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the MPESA_AMOUNT field.';
                }
                field(MPESA_TXN_DATE; Rec.MPESA_TXN_DATE)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the MPESA_TXN_DATE field.';
                }
                field(MPESA_TXN_TIME; Rec.MPESA_TXN_TIME)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the MPESA_TXN_TIME field.';
                }
                field(MSISDN_CUSTOMER; Rec.MSISDN_CUSTOMER)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the MSISDN_CUSTOMER field.';
                }
                field(ACCOUNT_NUMBER; Rec.ACCOUNT_NUMBER)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ACCOUNT_NUMBER field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Allocate)
            {
                ApplicationArea = Basic;
                Image = Allocate;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Allocate action.';
                trigger OnAction()
                var
                    TXT001: label 'Allocate the payment %1';
                    ProcessingHeader: Record "Student Processing Header";
                    ReceiptsHeader: Record "Receipts Header1";
                begin
                    if Confirm('Apply payment for  the document') = true then begin
                        ProcessingHeader.Reset;
                        ProcessingHeader.SetRange(Posted, false);
                        ProcessingHeader.SetRange("Payment Reference No.", Rec.MPESA_TXN_ID);
                        if ProcessingHeader.FindFirst then begin
                            Examination.MPESAApplyPaymentEntry(ProcessingHeader);
                        end;
                        ReceiptsHeader.Reset;
                        ReceiptsHeader.SetRange("Payment Reference No.", Rec.MPESA_TXN_ID);
                        if ReceiptsHeader.FindFirst then begin
                            Examination.ApplyMiscMPESAPaymentEntry(ReceiptsHeader);
                            CurrPage.Close;
                        end
                    end
                end;
            }
        }
    }

    var
        Examination: Codeunit Examination;
}

#pragma implicitwith restore

