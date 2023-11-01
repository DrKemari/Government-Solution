#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 55003 "Board Meeting Card"
{
    PageType = Card;
    SourceTable = "Board Meetings";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Meeting Type"; Rec."Meeting Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Meeting Type field.';
                    trigger OnValidate()
                    begin
                        /*meeting.RESET;
                        meeting.SETRANGE("Meeting Type");
                        IF meeting.FINDSET THEN BEGIN
                          meeting.GET("Meeting Type");
                          meeting.GET("Meeting group Code");
                          END;*/


                    end;
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Title field.';
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
                    ToolTip = 'Specifies the value of the Venue/Location field.';
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
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Published; Rec.Published)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Published field.';
                }
                field("Meeting Code"; Rec."Meeting Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Meeting Code field.';
                }
                field("Meeting group Code"; Rec."Meeting group Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Meeting group Code field.';
                }
                field("Meeting group"; Rec."Meeting group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Meeting group field.';
                }
                field("Conference Venue"; Rec."Conference Venue")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Conference Venue field.';
                }
                field("Parking Arrangement"; Rec."Parking Arrangement")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Parking Arrangement field.';
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
                    RunPageLink = "Meeting Code" = field(No),
                                  "Commitee No" = field("Meeting group Code");
                    ToolTip = 'Executes the Board Meeting Attendance action.';
                }
                action("Print Attendance")
                {
                    ApplicationArea = Basic;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the Print Attendance action.';
                    trigger OnAction()
                    var
                        meeting: Record "Board Meeting Attendance";
                    begin

                        meeting.Reset;
                        meeting.SetRange("Meeting Code", Rec.No);
                        if meeting.FindSet then
                            Report.Run(55000, true, true, meeting);
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
                    ToolTip = 'Executes the Meeting Agenda action.';
                }
                action("Declaration of Conflict of Interest")
                {
                    ApplicationArea = Basic;
                    Caption = 'Declaration of Conflict of Interest';
                    Image = AssemblyBOM;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Declaration of Interest";
                    RunPageLink = "Meeting Code" = field(No);
                    ToolTip = 'Executes the Declaration of Conflict of Interest action.';
                }
                action(fnPrintVoteItems)
                {
                    ApplicationArea = Basic;
                    Caption = 'Print Vote Items';
                    Image = PrintAcknowledgement;
                    ToolTip = 'Executes the Print Vote Items action.';
                    trigger OnAction()
                    begin
                        Rec.Reset;
                        Rec.SetRange(No, Rec.No);
                        if Rec.FindSet then
                            Report.Run(55002, true, false, Rec);
                    end;
                }
                action("Print Declaration of Interest")
                {
                    ApplicationArea = Basic;
                    Caption = 'Print Declaration of conflict of Interest';
                    Image = PrintAcknowledgement;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the Print Declaration of conflict of Interest action.';
                    trigger OnAction()
                    var
                        meeting: Record "Board Meetings";
                    begin
                        // meeting.RESET;
                        // meeting.SETRANGE(meeting."Meeting Code", No);
                        // IF meeting.FINDSET THEN
                        //  REPORT.RUN(55001, TRUE, TRUE, meeting);
                        Rec.Reset;
                        Rec.SetRange(No, Rec.No);
                        if Rec.FindSet then
                            Report.Run(55001, true, false, Rec);
                    end;
                }
                separator(Action29)
                {
                }
                action(Publish)
                {
                    ApplicationArea = Basic;
                    Image = Post;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Publish action.';
                    trigger OnAction()
                    var
                        Txt001: label 'Are you sure you want to publish?';
                    begin

                        //cc
                        if Confirm(Txt001) = true then begin
                            Risk.FNnotifyBoard(Rec);
                            Rec.Published := true;
                        end;
                    end;
                }
                action("Board Minutes")
                {
                    ApplicationArea = Basic;
                    Image = WIPEntries;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Board Minutes";
                    RunPageLink = "Register ID" = field(No);
                    ToolTip = 'Executes the Board Minutes action.';
                }
                // action(DocAttach1)
                // {
                //     ApplicationArea = All;
                //     Caption = 'Board Meetings Documents';
                //     Image = Attach;
                //     Promoted = true;
                //     PromotedCategory = Category8;
                //     RunObject = Page "Document Attachment Details";
                //     RunPageLink = "No." = field(No);
                //     RunPageView = where("Document Type" = filter("Court Hearings"));
                //     ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                //     trigger OnAction()
                //     var
                //         DocumentAttachmentDetails: Page "Document Attachment Details";
                //         RecRef: RecordRef;
                //     begin
                //         // RecRef.GETTABLE(Rec);
                //         // DocumentAttachmentDetails.OpenForRecRef(RecRef);
                //         // DocumentAttachmentDetails.RUNMODAL;
                //     end;
                // }
                separator(Action37)
                {
                }
                action("Non Board Members Meeting Attendance")
                {
                    ApplicationArea = Basic;
                    Caption = 'Non Board Members Meeting Attendance';
                    Image = Absence;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Non-Board Members";
                    RunPageLink = Code = field(No);
                    ToolTip = 'Executes the Non Board Members Meeting Attendance action.';
                }
            }
        }
    }

    var
        meeting: Record "Board Meetings";
        Risk: Codeunit "Risk Management";
}

#pragma implicitwith restore

