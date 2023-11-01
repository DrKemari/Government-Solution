#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 50044 "Cancelled Pos Receipts"
{
    ApplicationArea = Basic;
    CardPageID = "CBRECEIPT HEADER";
    Editable = false;
    PageType = List;
    SourceTable = CBRECEIPTS;
    SourceTableView = where(MCancelled = const(1));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
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
                field(ChequeNo2; Rec.ChequeNo2)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ChequeNo2 field.';
                }
                field(ChequeDate2; Rec.ChequeDate2)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ChequeDate2 field.';
                }
                field(BankFrom2; Rec.BankFrom2)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the BankFrom2 field.';
                }
                field(UnAppliedAmount; Rec.UnAppliedAmount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the UnAppliedAmount field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
                field(ReceiptSource; Rec.ReceiptSource)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ReceiptSource field.';
                }
                field(FirstExam; Rec.FirstExam)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the FirstExam field.';
                }
                field(FirstRenewal; Rec.FirstRenewal)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the FirstRenewal field.';
                }
                field(MStream; Rec.MStream)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the MStream field.';
                }
                field(PaymentMode; Rec.PaymentMode)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PaymentMode field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field(CancelReason; Rec.CancelReason)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the CancelReason field.';
                }
                field(MCancelled; Rec.MCancelled)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the MCancelled field.';
                }
                field(Printed; Rec.Printed)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Printed field.';
                }
                field(IDNo; Rec.IDNo)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the IDNo field.';
                }
                field(OtherDetails; Rec.OtherDetails)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the OtherDetails field.';
                }
                field(AmountApplied; Rec.AmountApplied)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the AmountApplied field.';
                }
                field(UnappliedRefunded; Rec.UnappliedRefunded)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the UnappliedRefunded field.';
                }
                field(ExamsRefunded; Rec.ExamsRefunded)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ExamsRefunded field.';
                }
                field(MLastNo; Rec.MLastNo)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the MLastNo field.';
                }
                field(Audited; Rec.Audited)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audited field.';
                }
                field(AuditedBy; Rec.AuditedBy)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the AuditedBy field.';
                }
                field(AuditedOn; Rec.AuditedOn)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the AuditedOn field.';
                }
                field(AuditComment; Rec.AuditComment)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the AuditComment field.';
                }
                field(ClearedBy; Rec.ClearedBy)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ClearedBy field.';
                }
                field(ClearedOn; Rec.ClearedOn)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ClearedOn field.';
                }
                field(ClearComment; Rec.ClearComment)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ClearComment field.';
                }
                field(Address1; Rec.Address1)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address1 field.';
                }
                field(Address2; Rec.Address2)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address2 field.';
                }
                field(Address3; Rec.Address3)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address3 field.';
                }
                field(Address4; Rec.Address4)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address4 field.';
                }
                field(Address5; Rec.Address5)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address5 field.';
                }
                field(TranType; Rec.TranType)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the TranType field.';
                }
                field(TranMode; Rec.TranMode)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the TranMode field.';
                }
                field(TelephoneNo; Rec.TelephoneNo)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the TelephoneNo field.';
                }
                field(AllExams; Rec.AllExams)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the AllExams field.';
                }
                field(AllRenewal; Rec.AllRenewal)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the AllRenewal field.';
                }
                field(AllExemption; Rec.AllExemption)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the AllExemption field.';
                }
                field(AllExamsAdv; Rec.AllExamsAdv)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the AllExamsAdv field.';
                }
                field(AllRegistration; Rec.AllRegistration)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the AllRegistration field.';
                }
                field(MRegNo; Rec.MRegNo)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the MRegNo field.';
                }
                field(Source; Rec.Source)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Source field.';
                }
                field(jptranid; Rec.jptranid)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the jptranid field.';
                }
                field(BankEntryNo; Rec.BankEntryNo)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the BankEntryNo field.';
                }
                field(TimeEntered; Rec.TimeEntered)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the TimeEntered field.';
                }
                field(status; Rec.status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the status field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

