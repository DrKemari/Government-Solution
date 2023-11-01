/// <summary>
/// Codeunit Matara Email Notification Samp (ID 50006).
/// </summary>
codeunit 50006 "Matara Email Notification Samp"
{

    /// <summary>
    /// SendEasiestEMail.
    /// </summary>
    /// 
    procedure SendEasiestEMail()
    var
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
    begin
        EmailMessage.Create('alberto.soben@businesscentralgeek.com', 'This is the subject', 'This is the body');
        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
    end;
    /// <summary>
    /// SendEmailWithAttachment.
    /// </summary>
    procedure SendEmailWithAttachment()
    var
        ReportExample: Report "Standard Sales - Invoice";
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        TempBlob: Codeunit "Temp Blob";
        InStr: Instream;
        OutStr: OutStream;
        ReportParameters: Text;
    begin
        ReportParameters := ReportExample.RunRequestPage();
        TempBlob.CreateOutStream(OutStr);
        Report.SaveAs(Report::"Standard Sales - Invoice", ReportParameters, ReportFormat::Pdf, OutStr);
        TempBlob.CreateInStream(InStr);

        EmailMessage.Create('alberto.soben@businesscentralgeek.com', 'This is the subject', 'This is the body');
        EmailMessage.AddAttachment('FileName.pdf', 'PDF', InStr);
        Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
    end;

    /// <summary>
    /// SendEmailWithPreviewWindow.
    /// </summary>
    procedure SendEmailWithPreviewWindow()
    var
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
    begin
        EmailMessage.Create('alberto.soben@businesscentralgeek.com', 'This is the subject', 'This is the body');
        Email.OpenInEditor(EmailMessage, Enum::"Email Scenario"::Default);
    end;

    /// <summary>
    /// SendEmailWithPreviewWindowHtmlFormatBody.
    /// </summary>
    procedure SendEmailWithPreviewWindowHtmlFormatBody()
    var
        Customer: Record Customer;
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        Body: Text;
    begin
        Customer.FindFirst();
        Customer.CalcFields(Balance);
        Body := '<h3>TO MESSRS: ' + Customer.Name + '</h3>ATT : ACCOUNTING DEPARTMENT </br> </h3> <hr></br>Your current balance with us is:</br></br><strong>' + format(Customer.Balance) + '</strong></br></br><hr></br>Best regards,</br></br>Financial Department</br></br>Spain</br> <img src="https://businesscentralgeek.com/wp-content/uploads/2022/06/Imagen3.jpg" />';

        EmailMessage.Create('alberto.soben@businesscentralgeek.com', 'This is the subject', Body, true);
        Email.OpenInEditorModally(EmailMessage, Enum::"Email Scenario"::Default);
    end;

    /// <summary>
    /// SendEMail.
    /// </summary>
    procedure SendEMail()
    var
        Email: Codeunit Email;
        EmailMessage: Codeunit "Email Message";
        Cancelled: Boolean;
        MailSent: Boolean;
        Selection: Integer;
        OptionsLbl: Label 'Send,Open Preview';
        ListTo: List of [Text];
    begin
        Selection := Dialog.StrMenu(OptionsLbl);
        ListTo.Add('alberto.soben@businesscentralgeek.com');
        EmailMessage.Create(ListTo, 'This is the subject', 'This is the body', true);
        Cancelled := false;
        if Selection = 1 then
            MailSent := Email.Send(EmailMessage, Enum::"Email Scenario"::Default);
        if Selection = 2 then begin

            MailSent := Email.OpenInEditorModally(
                EmailMessage, Enum::"Email Scenario"::Default) = Enum::"Email Action"::Sent;
            Cancelled := not MailSent;
        end;

        if (Selection <> 0) and not MailSent and not Cancelled then
            Error(GetLastErrorText());
    end;



    //     [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterDeleteAfterPosting', '', false, false)]
    //     local procedure OnAfterDeleteAfterPosting(SalesHeader: Record "Sales Header"; SalesInvoiceHeader: Record "Sales Invoice Header"; SalesCrMemoHeader: Record "Sales Cr.Memo Header"; CommitIsSuppressed: Boolean)
    //     var
    //         SmtpMailSetup: Record "SMTP Mail Setup";
    //         Mail: Codeunit "SMTP Mail";
    //         Recipients: List of [Text];
    //         Subject: Text;
    //         Body: Text;
    //         SalesPostedTitle: Label 'The Sales Document %2 of Customer %1 has been posted.';
    //         SalesPostedMsg: Label 'Dear Manager<br><br>The Sales Document <font color="red"><strong>%2</strong></font> of Customer <strong>%1</strong> has been posted.<br> The total amount is <strong>%3</strong>. <br>The Posted Invoice Number is <strong>%4</strong>. <br> User ID <strong>%5</strong>';
    //     begin
    //         if not SmtpMailSetup.Get() then
    //             exit;
    //         Recipients.Add('yzhums@outlook.jp');
    //         Recipients.Add('admin@CRMbc565011.onmicrosoft.com');
    //         Recipients.Add('admin@CRMbc350034.onmicrosoft.com');
    //         SalesInvoiceHeader.CalcFields("Amount Including VAT");
    //         Subject := StrSubstNo(SalesPostedTitle, SalesHeader."Sell-to Customer Name", SalesHeader."No.");
    //         Body := StrSubstNo(SalesPostedMsg, SalesHeader."Sell-to Customer Name", SalesHeader."No.", SalesInvoiceHeader."Amount Including VAT", SalesInvoiceHeader."No.", UserId);
    //         Mail.CreateMessage('Business Central', SmtpMailSetup."User ID", Recipients, Subject, Body, true);
    //         if not Mail.Send() then
    //             Message(Mail.GetLastSendMailErrorText());
    //     end;
}

