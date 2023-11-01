#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50026 "CBRECEIPT HEADER"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = CBRECEIPTS;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(ReceiptNo; Rec.ReceiptNo)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ReceiptNo field.';
                }
                field(Exam; Rec.Exam)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Exam field.';
                }
                field(ReceivedFrom; Rec.ReceivedFrom)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ReceivedFrom field.';
                }
                field(RegNo; Rec.RegNo)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the RegNo field.';
                }
                field(FullRegNo; Rec.FullRegNo)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the FullRegNo field.';
                }
                field(LastUser; Rec.LastUser)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the LastUser field.';
                }
                field(MDate; Rec.MDate)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the MDate field.';
                }
                field(PaymentType; Rec.PaymentType)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PaymentType field.';
                }
                field(TotalAmount; Rec.TotalAmount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the TotalAmount field.';
                }
                field(RefNo; Rec.RefNo)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the RefNo field.';
                }
                field(CurrencyCode; Rec.CurrencyCode)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the CurrencyCode field.';
                }
                field(Amount1; Rec.Amount1)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount1 field.';
                }
                field(PaymentType1; Rec.PaymentType1)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PaymentType1 field.';
                }
                field(ChequeNo1; Rec.ChequeNo1)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ChequeNo1 field.';
                }
                field(ChequeDate1; Rec.ChequeDate1)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ChequeDate1 field.';
                }
                field(BankFrom1; Rec.BankFrom1)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the BankFrom1 field.';
                }
                field(Amount2; Rec.Amount2)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount2 field.';
                }
                field(PaymentType2; Rec.PaymentType2)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PaymentType2 field.';
                }
            }
            part(Control21; CBRECDET)
            {
                SubPageLink = ReceiptNo = field(ReceiptNo);
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

