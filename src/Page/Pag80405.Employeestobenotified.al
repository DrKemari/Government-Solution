#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80405 "Employees to be notified"
{
    PageType = List;
    SourceTable = "Employee to be Notified";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Email Address"; Rec."Email Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email Address field.';
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Send E-Invites")
            {
                ApplicationArea = Basic;
                Image = Email;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Send E-Invites action.';
                trigger OnAction()
                var
                    //ApprovalMgt: Codeunit "Approvals Mgmt.";
                    SMTPSetup: Codeunit "Email Message";
                    CompanyInfo: Record "Company Information";
                    UserSetup: Record "User Setup";
                    SenderAddress: Text[80];
                    Recipients: Text[80];
                    SenderName: Text[70];
                    Body: Text[500];
                    Subject: Text[80];
                    FileName: Text;
                    FileMangement: Codeunit "File Management";
                    ProgressWindow: Dialog;
                    SMTPMailSet: Record "Email Account";
                    FileDirectory: Text[100];
                    Window: Dialog;
                    WindowisOpen: Boolean;
                    Counter: Integer;
                    cu400: Codeunit "Email Message";
                    DocLog: Record "Document E-mail Log";
                    BranchName: Code[80];
                    DimValue: Record "Dimension Value";
                    CustEmail: Text[100];
                    HRSetup: Record "Human Resources Setup";
                    CompInfo: Record "Company Information";
                    FundingOpp: Record "Project Contract Header";
                    GrantsSetup: Record "Grants Setup";
                    PerfomanceContractHeader: Record "Perfomance Contract Header";
                    Employee: Record Employee;
                    Policy: Record Policy;
                begin
                    eBRInnovationSetup.Get;
                    EmployeetobeNotified.Reset;
                    EmployeetobeNotified.SetRange("Document No.", Rec."Document No.");
                    if EmployeetobeNotified.Find('-') then begin
                        repeat


                            eBRInnovationSetup.Get;
                            if eBRInnovationSetup."Enable Email Alerts" then begin
                                CompanyInfo.Get();
                                SMTPMailSet.Get;
                                // SenderAddress := SMTPMailSet."Email Sender Address";
                                // SenderName := CompanyInfo.Name + ' M&E';
                                // Subject := StrSubstNo('Survey Invite');

                                // FileDirectory := 'C:\DOCS\';
                                // FileName := 'PCA_' + EmployeetobeNotified."Document No." + '.pdf';
                                // //Window.OPEN('processing');
                                // Window.Open('PROCESSING SURVEY INVITES ############1##');
                                // Window.Update(1, EmployeetobeNotified."Document No." + '-' + EmployeetobeNotified."Employee Name");

                                // WindowisOpen := true;
                                // if FileName = '' then
                                //     Error('Please specify what the file should be saved as');
                                // BrResponse.Reset;
                                // BrResponse.SetRange("Document No.", EmployeetobeNotified."Document No.");
                                // if BrResponse.Find('-') then begin
                                //     //Report.SaveAsPdf(80024, FileDirectory + FileName, BrResponse);
                                // end;



                                // if Exists(FileDirectory + FileName) then begin
                                //     Counter := Counter + 1;

                                //     SMTPMailSet.Get;
                                //     SenderAddress := SMTPMailSet."Email Sender Address";

                                //     Recipients := EmployeetobeNotified."Email Address";

                                //     if Recipients <> '' then begin
                                //         Body := 'Dear ' + EmployeetobeNotified."Employee Name" + '<BR>This email is to invite you to Review Survey:<Br>'
                                //         + EmployeetobeNotified."Document No." +
                                //         '<BR>Please Login into the system give feedback and Recomendations:';
                                //         cu400.Create(CompanyInfo.Name, SenderAddress, Recipients, Subject, Body, true);

                                //         cu400.AppendToBody(
                                //         '<BR><BR>Kind Regards,');
                                //         cu400.AppendToBody('<BR>' + CompInfo.Name);
                                //         cu400.AddAttachment(FileDirectory + FileName, FileName);
                                //         cu400.Send;

                                //         Sleep(1000);
                                //         Window.Close;
                                //     end;
                                // end;
                            end;

                        until EmployeetobeNotified.Next = 0;

                    end;
                end;
            }
        }
    }

    var
        BRSurveyParticipant: Record "BR Survey Participant";
        BrSurveyNo: Code[50];
        PolicyManagementSetup: Record "Policy Management Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;
        BusinessResearchResponse: Record "Business Research Response";
        BRResponseQuestion: Record "BR Response Question";
        BRResponseSection: Record "BR Response Section";
        BRResponseScoreGuide: Record "BR Response Score Guide";
        BRSurveySection: Record "BR Survey Section";
        BRSurveyQuestion: Record "BR Survey Question";
        BRSurveyScoreGuide: Record "BR Survey Score Guide";
        BrResponse: Record "Business Research Response";
        eBRInnovationSetup: Record "e-BR & Innovation Setup";
        QInteger: Integer;
        QScoreGuide: Integer;
        BRBranchResponseQuestion: Record "BR Branch Response Question";
        BRBranchSurveyQuestion: Record "BR Branch Survey Question";
        ParentQuestionID: Integer;
        QuestionID: Integer;
        BRMultipleResponse: Record "BR Multiple Response";
        BusinessResearchSurvey: Record "Business Research Survey";
        EmployeetobeNotified: Record "Employee to be Notified";
}

#pragma implicitwith restore

