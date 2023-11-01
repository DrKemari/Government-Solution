#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 55012 "Board Meeting Card1"
{
    Caption = 'Board Meeting Card';
    PageType = Card;
    SourceTable = "Board Meetings1";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Caption = 'Meeting Ref No.';
                    ToolTip = 'Specifies the value of the Meeting Ref No. field.';
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = Basic;
                    Caption = 'Meeting Ref. No:';
                    MultiLine = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Meeting Ref. No: field.';
                }
                field("Meeting Type"; Rec."Meeting Type")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                    ToolTip = 'Specifies the value of the Meeting Type field.';
                }
                field("Meeting group Code"; Rec."Meeting group Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Board Meeting Code';
                    TableRelation = if ("Meeting Type" = filter("Committee Meeting")) "Board Committees".Code where(Type = field("Meeting Type"));
                    ToolTip = 'Specifies the value of the Board Meeting Code field.';
                }
                field("Meeting group"; Rec."Meeting group")
                {
                    ApplicationArea = Basic;
                    Caption = 'Board';
                    ToolTip = 'Specifies the value of the Board field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Board Meeting Category';
                    Visible = false;
                    ToolTip = 'Specifies the value of the Board Meeting Category field.';
                }
                field("Start date"; Rec."Start date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start date field.';
                }
                field("Start time"; Rec."Start time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start time field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field("End time"; Rec."End time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End time field.';
                }
                field("Venue/Location"; Rec."Venue/Location")
                {
                    ApplicationArea = Basic;
                    Caption = 'Location';
                    ToolTip = 'Specifies the value of the Location field.';
                }
                field("Conference Venue"; Rec."Conference Venue")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Conference Venue field.';
                }
                field("Convened by"; Rec."Convened by")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Convened by field.';
                }
                field("Contact Tel. No"; Rec."Contact Tel. No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contact Tel. No field.';
                }
                field("Contact Email"; Rec."Contact Email")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contact Email field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Meeting Status"; Rec."Meeting Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Meeting Status field.';
                }
                field(Published; Rec.Published)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Published field.';
                }
                field("Parking Arrangement"; Rec."Parking Arrangement")
                {
                    ApplicationArea = Basic;
                    Caption = 'Logistics Arrangements';
                    ToolTip = 'Specifies the value of the Logistics Arrangements field.';
                }
                field("Access requirement"; Rec."Access requirement")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Access requirement field.';
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
                    RunPageLink = "Meeting Code" = field(No);
                    ToolTip = 'Executes the Board Meeting Attendance action.';
                }
                action("Publish the Meeting")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Executes the Publish the Meeting action.';
                    trigger OnAction()
                    begin
                        if Confirm('Are you sure you want to publish meeting No. ' + Rec.No + ' ?') = true then begin
                            Rec.Published := true;
                            Rec.Status := Rec.Status::Upcoming;
                            Rec."Published By" := UserId;
                            Rec."Date Published" := Today;
                            Rec."Time Published" := Time;
                            Rec.Modify;
                            Message('Published Successfully');

                            //notify board members
                            BoardMembers.Reset;
                            BoardMembers.SetRange("Meeting Code", Rec.No);
                            if BoardMembers.FindSet then begin

                                // objPortalUser.RESET;
                                // objPortalUser.SETRANGE("customer No", BoardMembers."Member No");
                                // IF objPortalUser.FIND('-') THEN
                                //  BEGIN
                                //    Username:=BoardMembers."Member No";
                                //    Password:= objPortalUser.Password;
                                // END;

                                repeat
                                    CashMgt.Get;
                                    if CashMgt."Send Email Notification" = true then begin
                                        Email1 := '';
                                        /*Body:='Your imprest application no. '+ Imprestheaders."No." + ' has been created from memo no. '+"No."+
                                        ' Kindly logon to Microsoft Dynamics NAV to confirm and send it for approval.';*/
                                        if Vend.Get(BoardMembers."Member No") then
                                            Email1 := Vend."E-Mail";
                                        Email2 := 'erickdaudi@dynasoft.co.ke';
                                        //MESSAGE('Email 1%',Email1);
                                        // if Email1 <> '' then begin
                                        //     //SMTP.Create('NACOSTI', Email2,
                                        //     Email1, 'Meeting ' + 'No: ' + No,
                                        //     'Dear ' + BoardMembers."Member Name" + ',<BR><BR>' +
                                        //     'Your are Invited to attend Meeting no. ' + No + ', Starting on ' + Format("Start date") + ' Time ' + Format("Start time") + ' To Date ' + Format("End Date")
                                        //     + 'To Time ' + Format("End time") + ' <BR><BR>', true);
                                        //     //SMTP.AppendToBody('<BR><BR>Location and Venue respectively shall be,' + ' ' + "Venue/Location" + ' , ' + "Conference Venue" + '<BR>');
                                        //     //SMTP.AppendToBody('<BR>Click the this <A href="http://41.89.63.254/">link</A> to view the meeting details<BR>');
                                        //     //        //SMTP.AppendToBody('<BR>Use the following credentials to login<BR>');
                                        //     //        //SMTP.AppendToBody('<BR>Username: '+Username+'<BR>');
                                        //     //        //SMTP.AppendToBody('<BR>Password: '+Password+'<BR>');
                                        //     //SMTP.AppendToBody('<BR><BR>Kind Regards,' + '<BR><BR>NACOSTI.<BR>' + '<BR>');
                                        //     //SMTP.Send();
                                        // end;
                                    end;
                                until BoardMembers.Next = 0;
                            end;
                        end;

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
                    RunPageLink = "Meeting Code" = field(No);
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
                    RunPageLink = "Meeting Code" = field(No);
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
        objPortalUser: Record portalusers;
        Username: Text;
        Password: Text;
}

#pragma implicitwith restore

