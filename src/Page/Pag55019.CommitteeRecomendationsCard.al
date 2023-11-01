#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 55019 "Committee Recomendations  Card"
{
    Caption = 'Committee Recomendations  Card';
    PageType = Card;
    RefreshOnActivate = true;
    SourceTable = "Meeting Coments2020";

    layout
    {
        area(content)
        {
            group("<Control1>")
            {
                Caption = 'General';
                field(EntryNo; Rec.EntryNo)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the EntryNo field.';
                }
                field("Meeting Code"; Rec."Meeting Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Meeting Code field.';
                }
                field("Member No"; Rec."Member No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Member No field.';
                }
                field(Comment; Rec.Comment)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comment field.';
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Created field.';
                }
                field("Time Created"; Rec."Time Created")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time Created field.';
                }
                field("Comment Reply"; Rec."Comment Reply")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comment Reply field.';
                }
                field("Meeting Ref No."; Rec."Meeting Ref No.")
                {
                    ApplicationArea = Basic;
                    TableRelation = "Board Meetings1".Title;
                    ToolTip = 'Specifies the value of the Meeting Ref No. field.';
                }
                field("No. series"; Rec."No. series")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the No. series field.';
                }
            }
            part(Control11; "Committee Recommendation Lines")
            {
                ApplicationArea = Basic;
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
                    RunPageLink = "Meeting Code" = field("No. series");
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
                    RunPageLink = "Meeting Code" = field("No. series");
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
                    RunPageLink = "Meeting Code" = field("No. series");
                    Visible = false;
                    ToolTip = 'Executes the Meeting Comments action.';
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

