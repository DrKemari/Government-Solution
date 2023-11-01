#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50027 "CBRECDET"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = ListPart;
    SourceTable = CBRECDET;

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
                field(LastUser; Rec.LastUser)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the LastUser field.';
                }
                field(LastMaintained; Rec.LastMaintained)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the LastMaintained field.';
                }
                field(StudentName; Rec.StudentName)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the StudentName field.';
                }
                field(Category; Rec.Category)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Category field.';
                }
                field(TransactionDesc; Rec.TransactionDesc)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the TransactionDesc field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field(RegNo; Rec.RegNo)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the RegNo field.';
                }
                field(PostingCode; Rec.PostingCode)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PostingCode field.';
                }
                field(FullRegNo; Rec.FullRegNo)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the FullRegNo field.';
                }
                field(UnitPrice; Rec.UnitPrice)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the UnitPrice field.';
                }
                field(Units; Rec.Units)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Units field.';
                }
                field(NextRenewalDate; Rec.NextRenewalDate)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the NextRenewalDate field.';
                }
                field(FirstExamDate; Rec.FirstExamDate)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the FirstExamDate field.';
                }
                field(AdvancePayment; Rec.AdvancePayment)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the AdvancePayment field.';
                }
                field(DetailType; Rec.DetailType)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the DetailType field.';
                }
                field(MLineNo; Rec.MLineNo)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the MLineNo field.';
                }
                field(DateApplied; Rec.DateApplied)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the DateApplied field.';
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
                field(SubCategory; Rec.SubCategory)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the SubCategory field.';
                }
                field(CurrencyCode; Rec.CurrencyCode)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the CurrencyCode field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field(ReversalReason; Rec.ReversalReason)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ReversalReason field.';
                }
                field(Source; Rec.Source)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Source field.';
                }
            }
        }
    }

    actions
    {
    }
}

