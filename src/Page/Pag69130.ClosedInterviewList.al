#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69130 "Closed Interview  List"
{
    CardPageID = "Closed Interview Card";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Vacancy Requisition Lines";
    SourceTableView = where(Status = filter("Re-Advertised"));

    layout
    {
        area(content)
        {
            repeater(Group)
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
        }
    }

    actions
    {
        area(navigation)
        {
            group(ActionGroup29)
            {
                separator(Action33)
                {
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

                        /*CurrPage.SETSELECTIONFILTER(VacancyApplicantsTable);
                        IF VacancyApplicantsTable.FINDSET THEN BEGIN
                          REPEAT
                          //Code to send email notification
                        SMTPMailSet.GET;
                        IF CONFIRM('Are you sure you want to send email notifications to applicants ',FALSE) THEN BEGIN
                        Notification1.CreateMessage(CompanyInformation.Name,SMTPMailSet."Email Sender Address","E-Mail","Job Applied For",
                                        'Dear '+"First Name"+','+"Last Name"+ ',<BR><BR>'+
                                        ' You have succesfully been shortlisted for an oral interview for the job' +UPPERCASE("Job Applied For")+
                        '<BR>'+'<BR>',TRUE);
                        
                        Notification1.AppendToBody(
                        '<BR><BR>Kind Regards,'+
                        '<BR><BR>For any Information, Please Contact'+'<BR>'+CompanyInformation.Name+'<BR>'+
                        CompInfo.Name+'<BR>'+
                        CompInfo.Address+'<BR>'+
                        CompInfo."Address 2"+'<BR>'+
                        CompInfo."Phone No."+'<BR>'+
                        CompInfo.City);
                        
                        Notification1.Send;
                        END;
                            MESSAGE('Applicants succesfully notified');
                          UNTIL VacancyApplicantsTable.NEXT = 0;
                          CLEAR(VacancyApplicantsTable);
                         END;
                         */

                    end;
                }
            }
        }
    }

    var
        VacancyApplicantsTable: Record "Vacancy  Requisitions Table";
        TempVacancy: Record "Vacancy  Requisitions Table";
        noFilter: Text;
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
}

#pragma implicitwith restore

