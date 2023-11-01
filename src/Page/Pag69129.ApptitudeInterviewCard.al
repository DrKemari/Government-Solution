#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69129 "Apptitude Interview Card"
{
    PageType = Card;
    SourceTable = "Vacancy Requisition Lines";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Job Id"; Rec."Job Id")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Id field.';
                }
                field("Job Description"; Rec."Job Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Description field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Planned Qty"; Rec."Planned Qty")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned Qty field.';
                }
                field("Requested Qty"; Rec."Requested Qty")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requested Qty field.';
                }
                field("Planned Start Date"; Rec."Planned Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned Start Date field.';
                }
                field("Planned End Date"; Rec."Planned End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned End Date field.';
                }
                field("Applications End Time"; Rec."Applications End Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Applications End Time field.';
                }
                field("Applications End Date"; Rec."Applications End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Applications End Date field.';
                }
                field("Applications Start Date"; Rec."Applications Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Applications Start Date field.';
                }
                field("Advertised By"; Rec."Advertised By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Advertised By field.';
                }
                field("Advertised Date"; Rec."Advertised Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Advertised Date field.';
                }
                field("Requisition Type"; Rec."Requisition Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requisition Type field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            part(Control14; "Apptitude Interview Lines")
            {
                SubPageLink = "Job Id." = field("Job Id"),
                              Type = const(Closed);
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control11; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control12; Links)
            {
                ApplicationArea = Basic;
            }
            systempart(Control13; MyNotes)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Fu&nctions")
            {
                Caption = 'Fu&nctions';
                action("Get Shortlisted Applicants")
                {
                    ApplicationArea = Basic;
                    Caption = 'Get Shortlisted Applicants';
                    Image = Salutation;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Get Shortlisted Applicants action.';
                    trigger OnAction()
                    begin
                        VacancyApplicantsTable.Reset;
                        VacancyApplicantsTable.SetRange("Vacancy Requisition No.", Rec."Requisition No.");
                        VacancyApplicantsTable.SetRange("Job Id", Rec."Job Id");
                        VacancyApplicantsTable.SetRange(Status, VacancyApplicantsTable.Status::Closed);
                        if VacancyApplicantsTable.FindSet then begin
                            repeat
                                VacancyRequisitionLines.Init;
                                VacancyRequisitionLines.Type := VacancyRequisitionLines.Type::Closed;
                                VacancyRequisitionLines."Job Id." := VacancyApplicantsTable."Job Id";
                                VacancyRequisitionLines."Application No" := VacancyApplicantsTable."Application No";
                                VacancyRequisitionLines."Full Name" := VacancyApplicantsTable."First Name" + ' ' + VacancyApplicantsTable."Middle Name" + ' ' + VacancyApplicantsTable.Surname;
                                VacancyRequisitionLines.Email := VacancyApplicantsTable.Email;
                                VacancyRequisitionLines.Insert(true);
                            until VacancyApplicantsTable.Next = 0;
                            Message('Applicants Added');
                        end else
                            Message('There are no applicants shortlisted for the Apptitude interview category');
                    end;
                }
                action("Notify Applicants")
                {
                    ApplicationArea = Basic;
                    Image = Email;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Notify Applicants action.';
                    trigger OnAction()
                    begin
                        VacancyRequisitionLines.Reset;
                        VacancyApplicantsTable.SetRange("Vacancy Requisition No.", Rec."Requisition No.");
                        VacancyApplicantsTable.SetRange(Status, VacancyApplicantsTable.Status::Closed);

                        if VacancyRequisitionLines.FindSet then begin
                            VacancyRequisitionLines.TestField(Email);
                            SMTPMailSet.Get;
                            if Confirm('Are you sure you want to send email notifications to applicants ', false) then begin
                                repeat
                                    // Notification1.CreateMessage(CompanyInformation.Name, SMTPMailSet."Email Sender Address", VacancyRequisitionLines.Email, VacancyApplicantsTable."Job Applied For",
                                    //                 'Dear ' + VacancyRequisitionLines."Full Name" + ',<BR><BR>' +
                                    //                 ' You have succesfully been shortlisted for an apptitude interview for the job' + ' ' + UpperCase("Job Description") +
                                    // '<BR>' + '<BR>' + 'Venue' + ':' + '' + VacancyRequisitionLines."Interview Location" + '<BR>' + 'Date' + ':' + '' + Format(VacancyRequisitionLines."Interview Date") + '<BR>' +
                                    // 'Time' + ':' + '' + Format(VacancyRequisitionLines."Interview Time") + '<BR>', true);

                                    // Notification1.AppendToBody(
                                    // '<BR><BR>Kind Regards,' +
                                    // '<BR><BR>For any Information, Please Contact' + '<BR>' + CompanyInformation.Name + '<BR>' +
                                    // CompInfo.Name + '<BR>' +
                                    // CompInfo.Address + '<BR>' +
                                    // CompInfo."Address 2" + '<BR>' +
                                    // CompInfo."Phone No." + '<BR>' +
                                    // CompInfo.City);

                                //Notification1.Send;

                                until VacancyRequisitionLines.Next = 0;
                                Message('Email notifications sent succesfully');
                            end;
                        end;
                    end;
                }
                action("Close Interview")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Executes the Close Interview action.';
                    trigger OnAction()
                    begin
                        if Confirm('Are you sure you want to close the shortlisting process', false) then begin
                            Rec."Actual End Date" := Today;
                            Rec.Status := Rec.Status::"Re-Advertised";
                            Rec."Closed By" := UserId;
                            Rec."Closed Date" := Today;
                            Rec.Modify();
                        end;
                    end;
                }
            }
        }
    }

    var
        VacancyApplicantsTable: Record "Job Application Table";
        VacancyRequisitionLines: Record "Shortlisting Lines";
        SMTPMailSet: Record "Email Account";
        ServiceItem: Record "Service Item";
        Service: Text;
        Notification1: Codeunit "Email Message";
        objCustomer: Record Customer;
        CompInfo: Record "Company Information";
        Obj: BigText;
        ObjInstr: InStream;
        ObjOutStr: OutStream;
        ObjText: Text;
        Copyright: Record "Copyright Registration Table";
        CompanyInformation: Record "Company Information";
        VacancyRequisitionLines1: Record "Vacancy Requisition Lines";
}

#pragma implicitwith restore

