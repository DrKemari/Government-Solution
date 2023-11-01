#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57014 "Approved Imprest Requisitions"
{
    ApplicationArea = Basic;
    CardPageID = "Approved Imprest Requisition";
    Editable = true;
    PageType = List;
    SourceTable = Payments;
    SourceTableView = where("Payment Type" = const(Imprest),
                            Status = filter(Released),
                            Posted = const(false),
                            "Send for Posting" = const(false),
                            banked = const(false),
                            "Archive Document" = const(false));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Select; Rec.Select)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Select field.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Account Type field.';
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Payroll No.';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Payroll No. field.';
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Account Name field.';
                }
                field("Imprest Amount"; Rec."Imprest Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Imprest Amount field.';
                }
                field("Imprest Deadline"; Rec."Imprest Deadline")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Imprest Deadline field.';
                }
                field(Payee; Rec.Payee)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Payee field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 1 Code field.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Shortcut Dimension 2 Code field.';
                }
                field(Job; Rec.Job)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Job field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000015; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000016; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(reporting)
        {
        }
        area(navigation)
        {
            group("P&osting")
            {
                Caption = 'P&osting';
                Image = Post;
                action("Banked Imprest Requisition")
                {
                    ApplicationArea = Basic;
                    Image = SendTo;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Banked Imprest Requisition action.';
                    trigger OnAction()
                    begin
                        Payments.Reset;
                        Payments.SetRange(Select, true);
                        Payments.SetRange("Payment Type", Payments."payment type"::Imprest);
                        Payments.SetRange(banked, false);
                        if Payments.Find('-') then begin
                            repeat
                                Payments.banked := true;
                                //SendEmail
                                SendEmail(Payments);
                                Payments.Modify(true);
                                ;
                            until Payments.Next = 0;
                        end;
                        Message('Banked Successfully');
                    end;
                }
                action("Archive Document")
                {
                    ApplicationArea = Basic;
                    Image = Archive;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the Archive Document action.';
                    trigger OnAction()
                    begin
                        UserSetup.Reset;
                        UserSetup.SetRange("User ID", UserId);
                        UserSetup.SetRange("Archive Document", true);
                        if UserSetup.Find('-') then begin
                            Payments.Reset;
                            Payments.SetRange("Document Type", Rec."document type"::Imprest);
                            Payments.SetRange("No.", Rec."No.");
                            if Payments.FindFirst then begin
                                repeat
                                    Payments."Archive Document" := true;
                                    Payments.Modify;
                                until Payments.Next = 0;
                            end;
                        end else
                            Error('You don''t have rights to archive finance documents,Contact System administrator');
                    end;
                }
                action(EFT)
                {
                    ApplicationArea = Basic;
                    Image = ElectronicDoc;
                    Promoted = true;
                   // RunObject = Report "EFT Imprest";
                    ToolTip = 'Executes the EFT action.';
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        if UserSetup.Get(UserId) then begin
            if UserSetup."Post Requisition" = false then
                Rec.SetRange("Created By", UserId);
        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Imprest Type" := Rec."imprest type"::"Project Imprest";
    end;

    trigger OnOpenPage()
    begin
        if UserSetup.Get(UserId) then begin
            if UserSetup."Post Requisition" = false then
                Rec.SetRange("Created By", UserId);
        end;
    end;

    var
        UserSetup: Record "User Setup";
        Payments: Record Payments;


    procedure SendEmail(Payments: Record Payments)
    var
        ImprestMemo: Record "Imprest Memo";
        UserSetup: Record "User Setup";
        Email: Text;
        Body: Text;
        SMTP: Codeunit "Email Message";
        Email2: Text[250];
        CompInfo: Record "Company Information";
        EmailHOD: Text;
        ImprestOther: Decimal;
        CashMgt: Record "Cash Management Setup";
        Payments1: Record Payments;
    begin
        UserSetup.Reset;
        UserSetup.SetRange("Employee No.", Payments."Account No.");
        if UserSetup.FindSet then
            Email := UserSetup."E-Mail";
        //send notification email
        CashMgt.Get;
        Email2 := CashMgt."Imprest Email";

        //SMTP.Create('KASNEB-IMPREST BANKING', Email2,
        // Email, 'Imprest ' + 'No: ' + Payments."No.",
        // 'Dear ' + Payments.Payee + ',<BR><BR>' +
        // 'Your imprest request for the trip to<b>' + ' ' + Payments."Payment Narration" + ' ' + 'has been banked' +
        // ' ', true);

        //SMTP.AddBCC(Email2);
        //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>Finance Department.<BR>' + '<BR>');
        //SMTP.Send();

    end;
}

#pragma implicitwith restore

