#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Report 59007 "Budget Utilization batch"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Budget Utilization batch.rdlc';

    dataset
    {
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

    labels
    {
    }

    trigger OnPreReport()
    begin

        Cashmgtsetup.Get();
        Jobs.Reset();
        Jobs.SetRange("No.", Cashmgtsetup."Current Budget");
        Jobs.SetRange(exchequer, true);
        if Jobs.FindFirst() then
            joblines.Reset();
        joblines.SetRange("Job No.", Jobs."No.");
        joblines.SetRange("Job Task Type", joblines."Job Task Type"::Posting);
        if joblines.FindSet() then begin
            repeat
                joblines.CalcFields("Schedule (Total Cost)", "Usage (Total Cost)", Commitments);
                IF joblines."Schedule (Total Cost)" > 0 THEN
                    TENPC := (0.1 * joblines."Schedule (Total Cost)");
                ACTUSAGE := joblines."Usage (Total Cost)" + joblines.Commitments;
                IF ACTUSAGE < TENPC then begin

                    EmailMessage.Create(Cashmgtsetup."Budget Controller Email", 'BUDGET VOTE NOTIFICATION',
                    'This is to notify you that the budget utilization for vote ' + joblines.Description + ' is below 10% utilization.');


                    Email.Send(EmailMessage, Enum::"Email Scenario"::Default);


                end;
            until joblines.Next() = 0;
        end;
    end;

    var
        InsCoverageLedgerEntry: Record "Ins. Coverage Ledger Entry";
        InsuranceReg: Record Insurance;
        Cashmgtsetup: Record "Cash Management Setup";
        Jobs: record Job;
        joblines: record "Job Task";
        Window: Dialog;
        EmailBody: array[2] of Text[30];
        BodyText: Text[250];
        mymail: Codeunit Mail;
        WindowisOpen: Boolean;
        SendingDate: Date;
        SendingTime: Time;
        Counter: Integer;
        SenderAddress: Text[100];
        UserSetup: Record "User Setup";
        HRSetup: Record "Human Resources Setup";
        CompInfo: Record "Company Information";
        RequesterName: Text[100];
        RequesterEmail: Text[100];
        emailhdr: Text[100];
        ProcNote: Text[1000];
        LoginDetails: Text[1000];
        CustEmail: Text[100];
        CompanyDetails: Text[250];
        SupplierDetails: Text[1000];
        SenderMessage: Text[1000];
        FileDirectory: Text[100];
        FileName: Text[100];
        TENPC: Decimal;
        ACTUSAGE: Decimal;

        ///
        TempBlob: Codeunit "Temp Blob";
        RecRef: RecordRef;
        Recipients: List of [Text];
        OutStr: OutStream;
        InStr: InStream;
        OutStr2: OutStream;
        InStr2: InStream;
        BodyTxt: Text;

        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
}
