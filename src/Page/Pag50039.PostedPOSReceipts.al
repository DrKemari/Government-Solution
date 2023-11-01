#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
/// <summary>
/// Page Posted POS Receipts (ID 50039).
/// </summary>
Page 50039 "Posted POS Receipts"
{
    ApplicationArea = Basic;
    CardPageID = "CBRECEIPT HEADER";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = CBRECEIPTS;
    SourceTableView = where("Nav Posted" = const(true));
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(ReceiptNo; Rec.ReceiptNo)
                {
                    ApplicationArea = Basic;
                }
                field(Exam; Rec.Exam)
                {
                    ApplicationArea = Basic;
                }
                field(ReceivedFrom; Rec.ReceivedFrom)
                {
                    ApplicationArea = Basic;
                }
                field(RegNo; Rec.RegNo)
                {
                    ApplicationArea = Basic;
                }
                field(FullRegNo; Rec.FullRegNo)
                {
                    ApplicationArea = Basic;
                }
                field(LastUser; Rec.LastUser)
                {
                    ApplicationArea = Basic;
                }
                field(MDate; Rec.MDate)
                {
                    ApplicationArea = Basic;
                }
                field(PaymentType; Rec.PaymentType)
                {
                    ApplicationArea = Basic;
                }
                field(TotalAmount; Rec.TotalAmount)
                {
                    ApplicationArea = Basic;
                }
                field(RefNo; Rec.RefNo)
                {
                    ApplicationArea = Basic;
                }
                field(CurrencyCode; Rec.CurrencyCode)
                {
                    ApplicationArea = Basic;
                }
                field(Amount1; Rec.Amount1)
                {
                    ApplicationArea = Basic;
                }
                field(PaymentType1; Rec.PaymentType1)
                {
                    ApplicationArea = Basic;
                }
                field(ChequeNo1; Rec.ChequeNo1)
                {
                    ApplicationArea = Basic;
                }
                field(ChequeDate1; Rec.ChequeDate1)
                {
                    ApplicationArea = Basic;
                }
                field(BankFrom1; Rec.BankFrom1)
                {
                    ApplicationArea = Basic;
                }
                field(Amount2; Rec.Amount2)
                {
                    ApplicationArea = Basic;
                }
                field(PaymentType2; Rec.PaymentType2)
                {
                    ApplicationArea = Basic;
                }
                field(ChequeNo2; Rec.ChequeNo2)
                {
                    ApplicationArea = Basic;
                }
                field(ChequeDate2; Rec.ChequeDate2)
                {
                    ApplicationArea = Basic;
                }
                field(BankFrom2; Rec.BankFrom2)
                {
                    ApplicationArea = Basic;
                }
                field(UnAppliedAmount; Rec.UnAppliedAmount)
                {
                    ApplicationArea = Basic;
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                }
                field(ReceiptSource; Rec.ReceiptSource)
                {
                    ApplicationArea = Basic;
                }
                field(FirstExam; Rec.FirstExam)
                {
                    ApplicationArea = Basic;
                }
                field(FirstRenewal; Rec.FirstRenewal)
                {
                    ApplicationArea = Basic;
                }
                field(MStream; Rec.MStream)
                {
                    ApplicationArea = Basic;
                }
                field(PaymentMode; Rec.PaymentMode)
                {
                    ApplicationArea = Basic;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                }
                field(CancelReason; Rec.CancelReason)
                {
                    ApplicationArea = Basic;
                }
                field(MCancelled; Rec.MCancelled)
                {
                    ApplicationArea = Basic;
                }
                field(Printed; Rec.Printed)
                {
                    ApplicationArea = Basic;
                }
                field(IDNo; Rec.IDNo)
                {
                    ApplicationArea = Basic;
                }
                field(OtherDetails; Rec.OtherDetails)
                {
                    ApplicationArea = Basic;
                }
                field(AmountApplied; Rec.AmountApplied)
                {
                    ApplicationArea = Basic;
                }
                field(UnappliedRefunded; Rec.UnappliedRefunded)
                {
                    ApplicationArea = Basic;
                }
                field(ExamsRefunded; Rec.ExamsRefunded)
                {
                    ApplicationArea = Basic;
                }
                field(MLastNo; Rec.MLastNo)
                {
                    ApplicationArea = Basic;
                }
                field(Audited; Rec.Audited)
                {
                    ApplicationArea = Basic;
                }
                field(AuditedBy; Rec.AuditedBy)
                {
                    ApplicationArea = Basic;
                }
                field(AuditedOn; Rec.AuditedOn)
                {
                    ApplicationArea = Basic;
                }
                field(AuditComment; Rec.AuditComment)
                {
                    ApplicationArea = Basic;
                }
                field(ClearedBy; Rec.ClearedBy)
                {
                    ApplicationArea = Basic;
                }
                field(ClearedOn; Rec.ClearedOn)
                {
                    ApplicationArea = Basic;
                }
                field(ClearComment; Rec.ClearComment)
                {
                    ApplicationArea = Basic;
                }
                field(Address1; Rec.Address1)
                {
                    ApplicationArea = Basic;
                }
                field(Address2; Rec.Address2)
                {
                    ApplicationArea = Basic;
                }
                field(Address3; Rec.Address3)
                {
                    ApplicationArea = Basic;
                }
                field(Address4; Rec.Address4)
                {
                    ApplicationArea = Basic;
                }
                field(Address5; Rec.Address5)
                {
                    ApplicationArea = Basic;
                }
                field(TranType; Rec.TranType)
                {
                    ApplicationArea = Basic;
                }
                field(TranMode; Rec.TranMode)
                {
                    ApplicationArea = Basic;
                }
                field(TelephoneNo; Rec.TelephoneNo)
                {
                    ApplicationArea = Basic;
                }
                field(AllExams; Rec.AllExams)
                {
                    ApplicationArea = Basic;
                }
                field(AllRenewal; Rec.AllRenewal)
                {
                    ApplicationArea = Basic;
                }
                field(AllExemption; Rec.AllExemption)
                {
                    ApplicationArea = Basic;
                }
                field(AllExamsAdv; Rec.AllExamsAdv)
                {
                    ApplicationArea = Basic;
                }
                field(AllRegistration; Rec.AllRegistration)
                {
                    ApplicationArea = Basic;
                }
                field(MRegNo; Rec.MRegNo)
                {
                    ApplicationArea = Basic;
                }
                field(Source; Rec.Source)
                {
                    ApplicationArea = Basic;
                }
                field(jptranid; Rec.jptranid)
                {
                    ApplicationArea = Basic;
                }
                field(BankEntryNo; Rec.BankEntryNo)
                {
                    ApplicationArea = Basic;
                }
                field(TimeEntered; Rec.TimeEntered)
                {
                    ApplicationArea = Basic;
                }
                field(status; Rec.status)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

