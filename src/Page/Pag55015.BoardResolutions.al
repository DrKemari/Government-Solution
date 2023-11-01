#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 55015 "Board Resolutions"
{
    ApplicationArea = Basic;
    Caption = 'Board Resolutions';
    CardPageID = "Board Resolutions Card";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Board Resolutions Header";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Resolution No."; Rec."Resolution No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Resolution No. field.';
                }
                field("Meeting Group"; Rec."Meeting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Meeting Group field.';
                }
                field("Meeting Group Name"; Rec."Meeting Group Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Meeting Group Name field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field(Time; Rec.Time)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time field.';
                }
                field("No.Series"; Rec."No.Series")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the No.Series field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control22; Notes)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(ActionGroup24)
            {
                action("Board Meeting Attendance")
                {
                    ApplicationArea = Basic;
                    Caption = 'Board Meeting Attendance';
                    Image = Absence;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Board Meeting Attendance";
                    RunPageLink = "Meeting Code" = field("No.Series");
                    Visible = false;
                    ToolTip = 'Executes the Board Meeting Attendance action.';
                }
                action("Publish the Meeting")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Executes the Publish the Meeting action.';
                    trigger OnAction()
                    begin
                        /*IF CONFIRM('Are you sure you want to publish meeting No. '+No+' ?')=TRUE THEN
                        BEGIN
                          Published := TRUE;
                          Status := Status::Upcoming;
                          "Published By":=USERID;
                          "Date Published":=TODAY;
                          "Time Published":=TIME;
                          MODIFY;
                          MESSAGE('Published Successfully');
                        
                        //notify board members
                        BoardMembers.RESET;
                        BoardMembers.SETRANGE("Meeting Code",No);
                        IF BoardMembers.FINDSET THEN BEGIN
                          REPEAT
                                  CashMgt.GET;
                                  IF CashMgt."Send Email Notification" = TRUE THEN
                                  BEGIN
                                    Email1:='';
                                    {Body:='Your imprest application no. '+ Imprestheaders."No." + ' has been created from memo no. '+"No."+
                                    ' Kindly logon to Microsoft Dynamics NAV to confirm and send it for approval.';}
                                    IF Vend.GET(BoardMembers."Member No") THEN
                                    Email1:=Vend."E-Mail";
                                   Email2:='erickdaudi@dynasoft.co.ke';
                                   //MESSAGE('Email 1%',Email1);
                                   IF Email1<>'' THEN BEGIN
                                    //SMTP.Create('NACOSTI',Email2,
                                    Email1,'Meeting '+'No: '+No,
                                    'Dear '+BoardMembers."Member Name"+',<BR><BR>'+
                                    'Your are Invited to attend Meeting no. '+ No + ', Starting on '+FORMAT("Start date")+ ' Time '+FORMAT("Start time")+ ' To Date '+FORMAT("End Date")
                                    + 'To Time '+FORMAT("End time")+' <BR><BR>',TRUE);
                                    //SMTP.AppendToBody('<BR><BR>Location and Venue respectively shall be,'+' '+"Venue/Location"+' , '+ "Conference Venue"+'<BR>');
                                    //SMTP.AppendToBody('<BR><BR>Kind Regards,'+'<BR><BR>NACOSTI.<BR>'+'<BR>');
                                    //SMTP.Send();
                                    END;
                                  END;
                          UNTIL BoardMembers.NEXT=0;
                          END;
                        END;
                        */

                    end;
                }
                action("Meeting Agenda")
                {
                    ApplicationArea = Basic;
                    Caption = 'Meeting Agenda';
                    Image = Agreement;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Page "Meeting Agenda";
                    RunPageLink = "Meeting Code" = field("No.Series");
                    Visible = false;
                    ToolTip = 'Executes the Meeting Agenda action.';
                }
                action("Meeting Comments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Meeting Comments';
                    Image = NewSum;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Page "Board Meeting Comments";
                    RunPageLink = "Meeting Code" = field("No.Series");
                    Visible = false;
                    ToolTip = 'Executes the Meeting Comments action.';
                }
                action(Print)
                {
                    ApplicationArea = Suite;
                    Caption = '&Print';
                    Ellipsis = true;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;
                    // RunObject = Report "Trial Balance Total";
                    ToolTip = 'Prepare to print the document. The report request window for the document opens where you can specify what to include on the print-out.';

                    trigger OnAction()
                    var
                        PurchaseHeader: Record "Purchase Header";
                    begin
                    end;
                }
            }
        }
    }

    var
        BoardMembers: Record "Board Meeting Attendance";
        CashMgt: Record "Cash Management Setup";
        SMTP: Codeunit "Email Message";
        Body: Text[1024];
        Email1: Text[250];
        Email2: Text[250];
        CompInfo: Record "Company Information";
        Vend: Record Vendor;
}

#pragma implicitwith restore

