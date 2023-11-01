#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
XmlPort 50025 "Export Absa Payments"
{
    Direction = Import;
    Format = VariableText;

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
                fieldelement(MpesaNo;"Payment Entries"."Mpesa Mobile No")
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
                fieldelement(Amount;"Payment Entries".Amount)
                {
                }

                trigger OnAfterInsertRecord()
                begin
                    "Payment Entries"."Line No":="Payment Entries"."Line No"+1;
                end;

                trigger OnBeforeInsertRecord()
                begin
                    //check if pin exists
                    "Payment Entries".TestField("Payment Entries".PIN);
                    NoSeries:='';
                    "Payment Entries"."Account Type":="Payment Entries"."account type"::Resource;
                    "Payment Entries".No:=ReqNo;
                    Resource.Reset;
                    Resource.SetRange("Social Security No.","Payment Entries".PIN);
                    if Resource.FindSet then begin
                       ResourceNo:=Resource."No.";
                    
                    "Payment Entries"."Account No":=ResourceNo;
                      end else begin
                    
                    Resource.Init;
                    ResSetup.Get;
                      ResSetup.TestField("Resource Nos.");
                      NoSeriesMgt.InitSeries(ResSetup."Resource Nos.",Resource."No. Series",0D,NoSeries,Resource."No. Series");
                      Resource."No.":=NoSeries;
                    Resource.Name:="Payment Entries"."Account Name";
                    Resource."Bank Account No.":="Payment Entries"."Bank Account No.";
                    Resource."Bank Name":="Payment Entries"."Bank Name";
                    Resource."Social Security No.":="Payment Entries".PIN;
                    Resource."Branch Name":="Payment Entries"."Branch Name";
                    Resource.Insert;
                    "Payment Entries"."Account No":=Resource."No.";
                    
                    end;
                    //calculate the tax
                    
                    /*Resource.RESET;
                    Resource.SETRANGE("No.","Payment Entries"."Account No");
                    IF Resource.FINDSET THEN BEGIN
                      IF Resource.Interns=FALSE THEN BEGIN*/
                    CashManagementSetup.Get;
                    
                    if "Payment Entries".Amount>CashManagementSetup."Tax Threshhold" then
                      begin
                       "Payment Entries"."W/Tax Amount":=(CashManagementSetup."Tax Rate")/100*"Payment Entries".Amount;
                    
                      end;
                       "Payment Entries"."Net Amount":="Payment Entries".Amount-"Payment Entries"."W/Tax Amount";
                       //END;
                       //END;

                end;
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

    trigger OnPreXmlPort()
    begin
            LineNo:=10;

    end;

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

