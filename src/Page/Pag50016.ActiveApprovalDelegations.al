#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 50016 "Active Approval Delegations"
{
    Editable = false;
    PageType = List;
    SourceTable = "Document Approval Delegation";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Delegation No"; Rec."Delegation No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Delegation No field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Current Approver ID"; Rec."Current Approver ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Approver ID field.';
                }
                field("New Approver ID"; Rec."New Approver ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Approver ID field.';
                }
                field("Delegation Limits Approver ID"; Rec."Delegation Limits Approver ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Delegation Limits Approver ID field.';
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
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Line)
            {
                Caption = 'Line';
                action("Resume Approval Duties")
                {
                    ApplicationArea = Basic;
                    Caption = 'Resume Approval Duties';
                    ToolTip = 'Executes the Resume Approval Duties action.';
                    trigger OnAction()
                    begin
                        Rec.Resume(Rec);

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

                        Subject := StrSubstNo('Resumption of Delegated Document Approval');
                        Body := 'This is to inform you that I,' + SenderName + 'have resumed the document approval functions I had delegated to you';

                        //SMTPSetup.Create(SenderName, SenderAddress, Recipient, Subject, Body, true);
                        // SMTPSetup.Send;
                    end;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        ActiveDelegations(Rec);
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


    procedure ActiveDelegations(var Delegations: Record "Document Approval Delegation")
    begin
        Delegations.Reset;
        Delegations.SetCurrentkey("Delegation No");
        Delegations.SetRange("Current Approver ID", UserId);
        //Delegations.SETFILTER("Start Date",'<=%1',TODAY);
        //Delegations.SETFILTER("End Date",'>=%1',TODAY);
        Delegations.SetRange(Status, Delegations.Status::Processed);
    end;
}

