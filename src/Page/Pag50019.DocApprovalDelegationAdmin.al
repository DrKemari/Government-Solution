#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50019 "Doc Approval Delegation Admin"
{
    PageType = Card;
    SourceTable = "Document Approval Delegation";
    SourceTableView = where(Status = const(Open));

    layout
    {
        area(content)
        {
            group("Approval Delegation")
            {
                Caption = 'Approval Delegation';
                field("Delegation No"; Rec."Delegation No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Delegation No field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field(Duration; Rec.Duration)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Duration field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field("New Approver ID"; Rec."New Approver ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Approver ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Current Approver ID"; Rec."Current Approver ID")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Current Approver ID field.';
                }
                field("Alternate Approver ID"; Rec."Alternate Approver ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Alternate Approver ID field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Functions)
            {
                Caption = 'Functions';
                action("Delegate Approval")
                {
                    ApplicationArea = Basic;
                    Caption = 'Delegate Approval';
                    ToolTip = 'Executes the Delegate Approval action.';
                    trigger OnAction()
                    begin
                        Rec.Delegate(Rec);

                        if UserSetup.Get(Rec."Current Approver ID") then begin
                            UserSetup.TestField("E-Mail");
                            SenderAddress := UserSetup."E-Mail";
                            if Employee.Get(UserSetup."Employee No.") then
                                SenderName := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                        end;

                        if UserSetup.Get(Rec."New Approver ID") then begin
                            UserSetup.TestField("E-Mail");
                            Recipient := UserSetup."E-Mail";
                        end;

                        Subject := StrSubstNo('Document Approval Delegation');
                        Body := 'This is to inform you that I,' + SenderName + 'have delegated my document approval functions to you for a period of ' + Format(Rec.Duration) + ' days starting ' + Format(Rec."Start Date") + ' to ' + Format(Rec."End Date") +
                        '. Please be regularly checking your Approval Entries for any pending requests';
                        // SMTPSetup.CreateMessage(SenderName, SenderAddress, Recipient, Subject, Body, true);
                        // SMTPSetup.Send;
                    end;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        //"Current Approver ID":=USERID;
    end;

    trigger OnOpenPage()
    begin
        //SETRANGE("Current Approver ID",USERID);
    end;

    var
        SMTPSetup: Codeunit "Email Message";
        UserSetup: Record "User Setup";
        SenderName: Text[50];
        SenderAddress: Text[50];
        Recipient: Text[50];
        Employee: Record Employee;
        Subject: Text[80];
        Body: Text[250];
}

