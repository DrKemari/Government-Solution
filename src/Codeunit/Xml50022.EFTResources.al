#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 50022 "EFT Resources"
{
    Direction = Export;
    FieldSeparator = '<TAB>';
    Format = VariableText;
    FormatEvaluate = Legacy;

    schema
    {
        textelement(Resources)
        {
            tableelement("Payment Entries";"Payment Entries")
            {
                XmlName = 'ScheduleLines';
                fieldelement(Name;"Payment Entries"."Account Name")
                {
                }
                fieldelement(PIN;"Payment Entries".PIN)
                {
                }
                fieldelement(BankName;"Payment Entries"."Bank Name")
                {
                }
                fieldelement(BranchName;"Payment Entries"."Branch Name")
                {
                }
                fieldelement(BankAccountNo;"Payment Entries"."Bank Account No.")
                {
                }
                fieldelement(Amount;"Payment Entries"."Net Amount")
                {
                }
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    var
        ReqNo: Code[30];
        LineNo: Integer;
        PVLines: Record "PV Lines";
        Payments: Record Payments;
        ResourceAmount: Decimal;
        Resource: Record Resource;
        ResourceNo: Code[30];
        ResSetup: Record "Resources Setup";
        NoSeries: Code[30];
        NoSeriesMgt: Codeunit NoSeriesManagement;
        CashManagementSetup: Record "Cash Management Setup";


    procedure GetRec(var Req: Record Payments)
    begin
        ReqNo:=Req."No.";
    end;
}

