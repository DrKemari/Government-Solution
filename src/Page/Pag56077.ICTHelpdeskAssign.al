#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
/// <summary>
/// Page ICT Helpdesk Assign (ID 56077).
/// </summary>
#pragma implicitwith disable
Page 56077 "ICT Helpdesk Assign"
{
    PageType = Card;
    SourceTable = "ICT Helpdesk";

    layout
    {
        area(content)
        {
            group("Part 1: User Information")
            {
                Editable = false;
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issue No. field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Department Name field.';
                }
                field("Physical Station"; Rec."Physical Station")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Physical Station field.';
                }
                field("Nature of Service"; Rec."Nature of Service")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Nature of Service field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Branch Name';
                    ToolTip = 'Specifies the value of the Branch Name field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Division/Unit Name';
                    ToolTip = 'Specifies the value of the Division/Unit Name field.';
                }
                field("Requesting Officer"; Rec."Requesting Officer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requesting Officer field.';
                }
                field("Requesting Officer Name"; Rec."Requesting Officer Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requesting Officer Name field.';
                }
                field(Phone; Rec.Phone)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field("Request Date"; Rec."Request Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Request Date field.';
                }
                field("Request Time"; Rec."Request Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Request Time field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            group("Part 2.1: Hardware Issues")
            {
                Editable = false;
                Visible = false;
                field("Computer not Starting up"; Rec."Computer not Starting up")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Computer not Starting up field.';
                }
                field("Keyboard, Mouse Failure"; Rec."Keyboard, Mouse Failure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Keyboard, Mouse Failure field.';
                }
                field("Printer Failure"; Rec."Printer Failure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Printer Failure field.';
                }
                field("UPS Failure"; Rec."UPS Failure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the UPS Failure field.';
                }
                field("LCD /Monitor Failure"; Rec."LCD /Monitor Failure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the LCD /Monitor Failure field.';
                }
                field("Storage Device Failure"; Rec."Storage Device Failure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Storage Device Failure field.';
                }
                field("Hardware Installation"; Rec."Hardware Installation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Hardware Installation field.';
                }
                field("Others, specify HW"; Rec."Others, specify HW")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Others, specify HW field.';
                }
            }
            group("Part 2.2: Software Issues")
            {
                Editable = false;
                Visible = false;
                field("Computer Running /Loading Slow"; Rec."Computer Running /Loading Slow")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Computer Running /Loading Slow field.';
                }
                field("Network Access Problems"; Rec."Network Access Problems")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Network Access Problems field.';
                }
                field("Antivirus Inefficiency"; Rec."Antivirus Inefficiency")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Antivirus Inefficiency field.';
                }
                field(Applications; Rec.Applications)
                {
                    ApplicationArea = Basic;
                    Caption = 'Applications Software (MS Word, MS Excel, MS Access, MS PowerPoint etc)';
                    ToolTip = 'Specifies the value of the Applications Software (MS Word, MS Excel, MS Access, MS PowerPoint etc) field.';
                }
                field("Software Installation"; Rec."Software Installation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Software Installation field.';
                }
                field("Others, specify SW"; Rec."Others, specify SW")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Others, specify SW field.';
                }
            }
            group("Please describe the issue here")
            {
                Editable = false;
                field("Description of the issue"; Rec."Description of the issue")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Description of the issue field.';
                }
            }
            group(Assigned)
            {
                Caption = 'Assigned';
                Editable = false;
                Enabled = true;
                field("Assigned To"; Rec."Assigned To")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assigned To field.';
                }
                field("Assigned Date"; Rec."Assigned Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Assigned Date field.';
                }
            }
            group("Re-Assign Details")
            {
                field("Re-Assign To"; Rec."Re-Assign To")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Re-Assign To field.';
                }
                field("Re-Assigned By"; Rec."Re-Assigned By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Re-Assigned By field.';
                }
            }
            group(Diagnosis)
            {
                Caption = 'Diagnosis';
                field("Action Taken"; Rec."Action Taken")
                {
                    ApplicationArea = Basic;
                    Caption = 'Describe the action taken to resolve the issue here';
                    MultiLine = true;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Describe the action taken to resolve the issue here field.';
                }
            }
            group("Escalation Details")
            {
                Caption = 'Escalation Details';
                field("Ascalation Details"; Rec."Ascalation Details")
                {
                    ApplicationArea = Basic;
                    Caption = 'Escalation Details';
                    ToolTip = 'Specifies the value of the Escalation Details field.';
                }
                field("Escalated To"; Rec."Escalated To")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Escalated To field.';
                }
                field("Escalated By"; Rec."Escalated By")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Escalated By field.';
                }
                field("Escalated Date"; Rec."Escalated Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Escalated Date field.';
                }
                field("Escalated Time"; Rec."Escalated Time")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Escalated Time field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Assign)
            {
                ApplicationArea = Basic;
                Image = Delegate;
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;
                ToolTip = 'Executes the Assign action.';
                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to assign the ICT helpdesk issue?' + ' ' + Rec."Job No.") = true then begin
                        Rec."Assigned Date" := Today;
                        Rec."Assigned Time" := Time;
                        Rec.Status := Rec.Status::Assigned;
                        Rec.Modify;
                    end;
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    Rec.SetFilter("Job No.", Rec."Job No.");
                    Report.Run(56238, true, true, Rec);
                end;
            }
            action(Resolve)
            {
                ApplicationArea = Basic;
                Image = Close;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Resolve action.';
                trigger OnAction()
                begin
                    Rec.TestField("Action Taken");
                    if Confirm('Are you sure you want to Close the ICT helpdesk issue?') = true then begin
                        Rec."Attended Date" := Today;
                        Rec."Attended By" := UpperCase(UserId);
                        Rec."Attended Time" := Time;
                        Rec.Status := Rec.Status::Resolved;
                        Rec.Modify;
                    end;

                    //Release the  Officer
                    Mapping.Reset;
                    Mapping.SetRange(Mapping.UserName, Rec."Attended By");
                    Mapping.SetRange(Mapping."Help Desk Category", Rec."ICT Issue Category");
                    if Mapping.FindSet then begin
                        Mapping.Assigned := false;
                        Mapping.Modify;
                    end;
                    //Release the  Officer

                    //Notify the requester that the issue has been closed
                    ObjComInfo.Get;
                    SenderEmailAddress := ObjComInfo."Administrator Email";
                    SenderName := COMPANYNAME;
                    if UserSetup.Get(Rec."Requesting Officer") then
                        Recipient := Rec.Email;
                    Subject := 'Issue Resolved' + ' ' + Rec."Job No.";
                    Body := 'Please note that the issue on the subject above has been resolved by' + '  ' + Rec."Assigned To" + 'and shall be closed after 24 hours. Kinldy login to the system and confirm.';
                    ObjNotify.FnSendEmail(SenderEmailAddress, SenderName, Recipient, Subject, Body);
                    // //SMTP.Create(COMPANYNAME, ObjComInfo."E-Mail", Recipient, 'ICT Heldesk Notification', Body, true);
                    // //SMTP.AddBCC(Email);
                    // //SMTP.Send();
                    Message('Resolved SuccessFully');
                end;
            }
            action(Escalate)
            {
                ApplicationArea = Basic;
                Image = Forecast;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Escalate action.';
                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to escalate the ICT helpdesk issue?' + ' ' + Rec."Job No.") = true then begin
                        Rec."Escalated By" := UpperCase(UserId);
                        Rec."Escalated Date" := Today;
                        Rec."Escalated Time" := Time;
                        Rec."Assigned To" := Rec."Escalated To";
                        Rec.Status := Rec.Status::Escalated;
                        Rec.Modify(true);
                    end;

                    //Notify the requester that the issue has been escalated
                    ObjComInfo.Get;
                    SenderEmailAddress := ObjComInfo."Administrator Email";
                    SenderName := COMPANYNAME;
                    // IF UserSetup.GET("Requesting Officer") THEN
                    Recipient := Rec.Email;
                    Subject := 'ICT ISSUE ESCALATION' + ' ' + Rec."Job No.";
                    Body := 'Please note that the issue on the subject above has been escalated to ' + '  ' + Rec."Escalated To";
                    // //SMTP.Create(COMPANYNAME, ObjComInfo."E-Mail", Recipient, 'ICT Heldesk Notification', Body, true);
                    // //SMTP.AddBCC(Email);
                    // //SMTP.Send();

                    //Notify the Escalted To that the issue has been escalated
                    ObjComInfo.Get;
                    SenderEmailAddress := ObjComInfo."Administrator Email";
                    SenderName := COMPANYNAME;
                    if UserSetup.Get(Rec."Escalated To") then
                        Recipient := UserSetup."E-Mail";
                    Body := 'Please note that the issue on the subject above has been escalated to you by' + ' ' + Rec."Assigned To";
                    Subject := 'ICT ISSUE ESCALATION' + ' ' + Rec."Job No.";
                    // //SMTP.Create(COMPANYNAME, ObjComInfo."E-Mail", Recipient, 'ICT Heldesk Notification', Body, true);
                    // //SMTP.AddBCC(Email);
                    // //SMTP.Send();
                    Message('Successfully Escalated to %1', Rec."Escalated To");
                end;
            }
            action("Re-Assign")
            {
                ApplicationArea = Basic;
                Image = Forecast;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Re-Assign action.';
                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to Re-assign the ICT helpdesk issue?' + ' ' + Rec."Job No.") = true then begin
                        Rec."Assigned To" := Rec."Re-Assign To";
                        Rec."Re-Assigned By" := UserId;
                        Rec."Assigned Date" := Today;
                        Rec."Assigned Time" := Time;
                        Rec.Status := Rec.Status::Assigned;
                        Rec.Modify(true);
                    end;

                    //Notify the requester that the issue has been escalated
                    ObjComInfo.Get;
                    SenderEmailAddress := ObjComInfo."Administrator Email";
                    SenderName := COMPANYNAME;
                    if UserSetup.Get(Rec."Requesting Officer") then
                        Recipient := UserSetup."E-Mail";
                    Subject := 'ISSUE ASSIGNMENT' + ' ' + Rec."Job No.";
                    Body := 'Please note that the issue on the subject above has been re-assigned to ' + '  ' + Rec."Assigned To";
                    // //SMTP.Create(COMPANYNAME, ObjComInfo."E-Mail", Recipient, 'ICT Heldesk Notification', Body, true);
                    // //SMTP.AddBCC(Email);
                    // //SMTP.Send();

                    //Notify the Escalted To that the issue has been escalated
                    ObjComInfo.Get;
                    SenderEmailAddress := ObjComInfo."Administrator Email";
                    SenderName := COMPANYNAME;
                    if UserSetup.Get(Rec."Assigned To") then
                        Recipient := UserSetup."E-Mail";
                    Subject := 'ICT ISSUE ASSIGNMENT' + ' ' + Rec."Job No.";
                    Body := 'Please note that the issue on the subject above has been assigned to you';
                    // //SMTP.Create(COMPANYNAME, ObjComInfo."E-Mail", Recipient, 'ICT Heldesk Notification', Body, true);
                    // //SMTP.AddBCC(Email);
                    // //SMTP.Send();
                    CurrPage.Close;
                end;
            }
            action("External Resolution Required")
            {
                ApplicationArea = Basic;
                Image = ExportMessage;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the External Resolution Required action.';
                trigger OnAction()
                begin
                    Rec."External Resolution" := true;
                    Rec.Modify(true);
                end;
            }
        }
    }

    var
        ObjNotify: Codeunit "Insurance Notifications";
        SenderEmailAddress: Text[250];
        SenderName: Text[250];
        Recipient: Text[250];
        Subject: Text[250];
        Body: Text[250];
        ObjComInfo: Record "Company Information";
        UserSetup: Record "User Setup";
        ICTHelpdesk: Record "ICT Helpdesk";
        Mapping: Record "ICT Officers Category Mapping";
        SMTP: Codeunit "Email Message";
}

#pragma implicitwith restore

