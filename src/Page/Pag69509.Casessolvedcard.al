#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69509 "Cases solved card"
{
    DeleteAllowed = false;
    Editable = false;
    PageType = Card;
    SourceTable = "Cases Management";
    SourceTableView = where(Status = filter(Resolved));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Enquiry Number"; Rec."Enquiry Number")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the <Complaint Number> field.';
                }
                field("Date of Complaint"; Rec."Date of Complaint")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Complaint field.';
                }
                field("Type of cases"; Rec."Type of cases")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Nature of Enquiry field.';
                }
                field("Recommended Action"; Rec."Recommended Action")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recommended Action field.';
                }
                field("Case Description"; Rec."Case Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Enquiry Description field.';
                }
                field("Resource #2"; Rec."Resource #2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Resource #2 field.';
                }
                field("Action Taken"; Rec."Action Taken")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Action Taken field.';
                }
            }
            group("Case Information")
            {
                field("Date To Settle Case"; Rec."Date To Settle Case")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Due Date field.';
                }
                field("Document Link"; Rec."Document Link")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Link field.';
                }
                field("Solution Remarks"; Rec."Solution Remarks")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Solution Remarks field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
                field("Body Handling The Complaint"; Rec."Body Handling The Complaint")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field(Recomendations; Rec.Recomendations)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recomendations field.';
                }
                field("Support Documents"; Rec."Support Documents")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Support Documents field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Resource Assigned"; Rec."Resource Assigned")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Resource Assigned field.';
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsibility Center field.';
                }
                field("Member No."; Rec."Member No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Customer No field.';
                }
                field("Account Name."; Rec."Account Name.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Account Name. field.';
                }
                field("Loan No"; Rec."Loan No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project field.';
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Print Resolved Confirmation Sheet")
            {
                ApplicationArea = Basic;
                Image = PrintAcknowledgement;
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;
                ToolTip = 'Executes the Print Resolved Confirmation Sheet action.';
                trigger OnAction()
                begin
                    /*IF Status<>Status::Resolved THEN
                      ERROR('only resolved cases can be printed');
                    casep.RESET;
                    casep.SETRANGE(casep."Case Number","Case Number");
                     IF casep.FINDFIRST THEN BEGIN
                      REPORT.RUN(REPORT::"Case solved  confirmation",TRUE,FALSE,casep);
                     END;*/

                end;
            }
            action(Resolved)
            {
                ApplicationArea = Basic;
                Promoted = true;
                PromotedCategory = Category5;
                Visible = false;
                ToolTip = 'Executes the Resolved action.';
                trigger OnAction()
                begin

                    if Rec.Status = Rec.Status::Resolved then begin
                        Error('Customer query has already been %1', Rec.Status);
                    end else



                        //TO ENABLE RESOLUTION OF CUSTOMER QUERIES LOGGED INTO THE SYSTEM
                        CustCare.SetRange(CustCare.No, Rec."Enquiry Number");
                    if CustCare.Find('-') then begin
                        CustCare.Status := CustCare.Status::Resolved;
                        CustCare."Resolved User" := UserId;
                        CustCare."Resolved Date" := WorkDate;
                        CustCare."Resolved Time" := Time;
                        CustCare.Modify;
                    end;
                    caseCare.SetRange(caseCare."Enquiry Number", Rec."Enquiry Number");
                    if caseCare.Find('-') then begin
                        caseCare.Status := caseCare.Status::Resolved;
                        caseCare."Resolved User" := UserId;
                        caseCare."Resolved Date" := WorkDate;
                        caseCare."Resolved Time" := Time;
                        caseCare.Modify;
                        smsResolved();
                        Message('The case has been successfully resolved');
                    end;
                    CurrPage.Editable := false;
                end;
            }
        }
    }

    trigger OnInit()
    begin
        Rec.SetRange("Resource Assigned", UserId);
    end;

    trigger OnOpenPage()
    begin
        Rec.SetRange("Resource Assigned", UserId);
    end;

    var
        CustCare: Record "General Equiries.";
        AssignedReas: Record "Cases Management";
        caseCare: Record "Cases Management";
        casep: Record "Cases Management";

    local procedure sms()
    var
        iEntryNo: Integer;
    begin

        //SMS MESSAGE
        /* SMSMessages.RESET;
         IF SMSMessages.FIND('+') THEN BEGIN
         iEntryNo:=SMSMessages."Entry No";
         iEntryNo:=iEntryNo+1;
         END
         ELSE BEGIN
         iEntryNo:=1;
         END;

         SMSMessages.RESET;
         SMSMessages.INIT;
         SMSMessages."Entry No":=iEntryNo;
         SMSMessages."Account No":="Member No.";
         SMSMessages."Date Entered":=TODAY;
         SMSMessages."Time Entered":=TIME;
         SMSMessages.Source:='Cases';
         SMSMessages."Entered By":=USERID;
         SMSMessages."Sent To Server":=SMSMessages."Sent To Server"::No;
         //SMSMessages."Sent To Server":=SMSMessages."Sent To Server::No;
         SMSMessages."SMS Message":='Your case/complain has been received and assigned to.'+"Resource #2"+
                                   ' kindly contact the resource for follow ups';
         Cust.RESET;
         IF Cust.GET("Member No.") THEN
         SMSMessages."Telephone No" := Cust."Phone No.";
         SMSMessages.INSERT;*/

    end;

    local procedure smsResolved()
    var
        iEntryNo: Integer;
    begin

        //SMS MESSAGE
        /*  SMSMessages.RESET;
          IF SMSMessages.FIND('+') THEN BEGIN
          iEntryNo:=SMSMessages."Entry No";
          iEntryNo:=iEntryNo+1;
          END
          ELSE BEGIN
          iEntryNo:=1;
          END;

          SMSMessages.RESET;
          SMSMessages.INIT;
          SMSMessages."Entry No":=iEntryNo;
          SMSMessages."Account No":="Member No.";
          SMSMessages."Date Entered":=TODAY;
          SMSMessages."Time Entered":=TIME;
          SMSMessages.Source:='Cases';
          SMSMessages."Entered By":=USERID;
          SMSMessages."Sent To Server":=SMSMessages."Sent To Server"::No;
          //SMSMessages."Sent To Server":=SMSMessages."Sent To Server::No;
          SMSMessages."SMS Message":='Your case/complain has been resolved by.'+"Resolved User"+
                                    ' Thank you for your being our priority customer';
          cust.RESET;
          IF cust.GET("Member No.") THEN
          SMSMessages."Telephone No" := cust."Phone No.";
          SMSMessages.INSERT;
          */

    end;
}

#pragma implicitwith restore

