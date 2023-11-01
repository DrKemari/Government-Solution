codeunit 50107 "Dynasoft Email"
{
    procedure SendEmailNotification(recepient: Text; emailSubject: Text; emailBody: Text)
    var
        Customer: Record Customer;
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        Body: Text;
    begin
        EmailMessage.Create(recepient, emailSubject, emailBody, true);
        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
    end;

    procedure SendEmailNotif2(BulkProcessingHeader: Record "Student Processing Header")
    var
        Customer: Record Customer;
        // SMTPMail: Codeunit "SMTP Mail";
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
        BulkProcessingHead: Record "Student Processing Header";
    begin

        Recipients.Add('edwinmatara@dynasoft.co.ke');

        // get the customer record and save the report to outstream then do instream and wrtie it to text
        BulkProcessingHead.SetRange("No.", BulkProcessingHeader."No.");
        RecRef.GetTable(BulkProcessingHead);
        TempBlob.CreateOutStream(OutStr);
        Report.SaveAs(Report::"Registration Invoice", '', ReportFormat::Pdf, OutStr, RecRef);
        TempBlob.CreateInStream(InStr);
        InStr.ReadText(BodyTxt);

        EmailMessage.Create('drkemari@gmail.com', 'Hello SMTP', BodyTxt);

        // add attachment for with pdf
        TempBlob.CreateOutStream(OutStr2);
        Report.SaveAs(Report::"Registration Invoice", '', ReportFormat::Pdf, OutStr, RecRef);
        TempBlob.CreateInStream(InStr2);
        // EmailMessage.AddAttachmentStream(InStr2, 'attachment.pdf');
        // EmailMessage.add
        EmailMessage.AddAttachment('attachment.pdf', 'PDF', InStr2);
        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
    end;



    //    procedure Invoice("code": Code[50]) status: Text
    // var
    //     StudentProcessingHeader: Record "Student Processing Header";
    //     HRSetupNew: Record "Examination Setup";
    //     emailBody: Text;
    //     emailhdr: Text;
    //     TempBlob: Codeunit "Temp Blob";
    //     RecRef: RecordRef;
    //     Recipients: List of [Text];
    //     OutStr: OutStream;
    //     InStr: InStream;
    //     OutStr2: OutStream;
    //     InStr2: InStream;
    //     BodyTxt: Text;

    //     Email: Codeunit Email;
    //     EmailMessage: Codeunit "Email Message";
    //     BulkProcessingHead: Record "Student Processing Header";
    // begin
    //     StudentProcessingHeader.Reset;
    //     StudentProcessingHeader.SetRange(StudentProcessingHeader."No.", code);
    //     StudentProcessingHeader.SetFilter(StudentProcessingHeader."No.", '%1', code);
    //     if StudentProcessingHeader.FindSet then begin
    //         appNo := ConvertStr(code, '-', '_');
    //         appNo := ConvertStr(code, ':', '_');



    //         if FILE.Exists(FILESPATH9 + appNo + '.pdf') then begin
    //             FILE.Erase(FILESPATH9 + appNo + '.pdf');


    //             Report.SaveAsPdf(85042, FILESPATH9 + appNo + '.pdf', StudentProcessingHeader);
    //             FileName := FILESPATH9 + appNo + '.pdf';
    //             //SMTPMailSetup.GET;
    //             //     Email2 := SMTPMailSetup."Email Sender Address";
    //             //     Body := 'Registration Invoice';
    //             //     SMTP.Create('Invoice', Email2, StudentProcessingHeader.Email,
    //             //      'Invoice',
    //             //     'Dear ' + StudentProcessingHeader."First Name" + ',<BR><BR>' +
    //             //     'Please find Attached Invoice For the registration of <b>' + '</b><BR>' +
    //             //    'Use the following link to acess the Student Portal.' + ' ' + '<b><a href="184.174.39.195:8090/">Student Portal</a></b><BR>'
    //             //     + '<BR>'
    //             //    , TRUE);
    //             //     SMTP.AddBCC(HRSetupNew."Student Module EMail BCC");
    //             //     SMTP.AddAttachment(FILESPATH9 + appNo + '.pdf', FileName);
    //             //     SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>Examination <BR><BR>[THIS IS AN AUTOMATED MESSAGE - PLEASE DO NOT REPLY DIRECTLY TO THIS EMAIL]<BR>');
    //             //     SMTP.Send();

    //             emailBody := 'Dear ' + StudentProcessingHeader."First Name" + ',<BR><BR>' +
    //                 'Please find Attached Invoice For the registration of <b>' + '</b><BR>' +
    //                'Use the following link to acess the Student Portal.' + ' ' + '<b><a href="online.hrmpeb.or.ke/">Student Portal</a></b><BR>'
    //                 + '<BR>';

    //             emailhdr := 'Registration Invoice';

    //             //  SendEmailNotification(StudentProcessingHeader.Email, emailhdr, emailBody);
    //             //SendEmailNotification(StudentProcessingHeader.Email, 'Registration Invoice', Body);
    //             //-----------------------------------------------------Matara...............................
    //             //  Recipients.Add('edwinmatara@dynasoft.co.ke');

    //             // get the customer record and save the report to outstream then do instream and wrtie it to text
    //             BulkProcessingHead.reset();
    //             BulkProcessingHead.SetRange("No.", code);
    //             RecRef.GetTable(BulkProcessingHead);
    //             TempBlob.CreateOutStream(OutStr);
    //             Report.SaveAs(Report::"Registration Invoice", '', ReportFormat::Pdf, OutStr, RecRef);
    //             TempBlob.CreateInStream(InStr);
    //             InStr.ReadText(BodyTxt);

    //             EmailMessage.Create(StudentProcessingHeader.Email, 'Registration Invoice', 'Dear ' + StudentProcessingHeader."First Name" + ' ' + StudentProcessingHeader."Middle Name" + ' ' + StudentProcessingHeader.Surname + ',<BR></BR>' +
    //                 'Please find Attached Invoice For the registration.<BR></BR>' +
    //                'Use the following link to acess the Student Portal.' + ' ' + '<b><a href="https://online.hrmpeb.or.ke/">Student Portal</a></b><BR>'
    //                 + '</BR>',true);

    //             // add attachment for with pdf
    //             TempBlob.CreateOutStream(OutStr2);
    //             Report.SaveAs(Report::"Registration Invoice", '', ReportFormat::Pdf, OutStr, RecRef);
    //             TempBlob.CreateInStream(InStr2);
    //             // EmailMessage.AddAttachmentStream(InStr2, 'attachment.pdf');
    //             // EmailMessage.add
    //             EmailMessage.AddAttachment('Registration_Invoice.pdf', 'PDF', InStr2);
    //             Email.Send(EmailMessage, Enum::"Email Scenario"::Default);

    //             //------------------------------------------------------Matara Email----------------------------------

    //             status := 'success*downloads\SubmitInvoice\' + appNo + '.pdf';

    //         end else begin

    //             Report.SaveAsPdf(85042, FILESPATH9 + appNo + '.pdf', StudentProcessingHeader);
    //             status := 'success*downloads\SubmitInvoice\' + appNo + '.pdf';
    //         end
    //     end else begin
    //         status := 'danger*The Proforma Invoice could not be generated';
    //     end;
    // end;
}
