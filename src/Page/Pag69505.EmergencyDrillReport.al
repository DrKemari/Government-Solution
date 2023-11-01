#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69505 "Emergency Drill Report"
{
    PageType = Card;
    SourceTable = "Emergency Drill Log";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Drill ID"; Rec."Drill ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Drill ID field.';
                }
                field("Drill Document Type"; Rec."Drill Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Drill Document Type field.';
                }
                field("OSH Management Plan ID"; Rec."OSH Management Plan ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'OSH Management Plan ID';
                    ToolTip = 'Specifies the value of the OSH Management Plan ID field.';
                }
                field("OSH Plan Calendar ID"; Rec."OSH Plan Calendar ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the OSH Plan Calendar ID field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Evacuation Event ID"; Rec."Evacuation Event ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evacuation Event ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Date of Drill"; Rec."Date of Drill")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Drill field.';
                }
                field("Drill Start Time"; Rec."Drill Start Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Drill Start Time field.';
                }
                field("Drill End Time"; Rec."Drill End Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Drill End Time field.';
                }
                field("Overall Drill Manager ID"; Rec."Overall Drill Manager ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Overall Drill Manager ID field.';
                }
                field("Drill Location Details"; Rec."Drill Location Details")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Drill Location Details field.';
                }
                field("Assembly Point Location"; Rec."Assembly Point Location")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assembly Point Location field.';
                }
                field("Prior Notice to Staff"; Rec."Prior Notice to Staff")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Prior Notice to Staff field.';
                }
                field("Notice to Staff Date"; Rec."Notice to Staff Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notice to Staff Date field.';
                }
                field("Directorate ID"; Rec."Directorate ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directorate ID field.';
                }
                field("Department ID"; Rec."Department ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department ID field.';
                }
                field("Region ID"; Rec."Region ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region ID field.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project ID field.';
                }
                field("Year Code"; Rec."Year Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Year Code field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created Date/Time"; Rec."Created Date/Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created Date/Time field.';
                }
            }
            part(Control34; "Emergency Drill Evacuation Lin")
            {
                Caption = 'Drill Findings/Observations';
                SubPageLink = "Drill ID" = field("Drill ID"),
                              "Evacuation Event ID" = field("Evacuation Event ID");
                ApplicationArea = Basic;
            }
            part(Control46; "Emergency Drill Action Plan Li")
            {
                Caption = 'Recommended Action Plan';
                SubPageLink = "Document No." = field("Drill ID");
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Drill Response Team")
            {
                ApplicationArea = Basic;
                Image = TeamSales;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Emergency Drill Teams";
                RunPageLink = "Drill ID" = field("Drill ID");
                ToolTip = 'Executes the Drill Response Team action.';
            }
            action("Emergency Contacts")
            {
                ApplicationArea = Basic;
                Image = ContactPerson;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Emergency Drill Workgroups";
                RunPageLink = "Drill ID" = field("Drill ID"),
                              "Record Type" = filter("Emergency Response");
                ToolTip = 'Executes the Emergency Contacts action.';
            }
            action("Other Informed Workgroups")
            {
                ApplicationArea = Basic;
                Image = Group;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Emergency Drill Workgroups";
                RunPageLink = "Drill ID" = field("Drill ID"),
                              "Record Type" = filter("To-be Informed");
                ToolTip = 'Executes the Other Informed Workgroups action.';
            }
            action("Drill Evaluation Summary")
            {
                ApplicationArea = Basic;
                Caption = 'Drill Evaluation Summary';
                Image = Sales;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Emergency Drill Ratings";
                RunPageLink = "Document No." = field("Drill ID");
                ToolTip = 'Executes the Drill Evaluation Summary action.';
            }
            action("Send Approval Request")
            {
                ApplicationArea = Basic;
                Image = SendApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                ToolTip = 'Executes the Send Approval Request action.';
                trigger OnAction()
                begin
                    Message('Approval Request has been sent.');
                end;
            }
            action("Cancel Approval Request")
            {
                ApplicationArea = Basic;
                Image = CancelApprovalRequest;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                ToolTip = 'Executes the Cancel Approval Request action.';
                trigger OnAction()
                begin
                    Message('Approval Request has been canceled.');
                end;
            }
            action(Approvals)
            {
                ApplicationArea = Basic;
                Image = Approvals;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                ToolTip = 'Executes the Approvals action.';
                trigger OnAction()
                begin
                    Message('Approval Request has been sent.');
                end;
            }
            action(Release)
            {
                ApplicationArea = Basic;
                Image = ReleaseDoc;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                ToolTip = 'Executes the Release action.';
                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Released;
                    Rec.Modify;

                    Message('Document %1 has been released successfully', Rec."Drill ID");
                end;
            }
            action(Reopen)
            {
                ApplicationArea = Basic;
                Image = ReOpen;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                ToolTip = 'Executes the Reopen action.';
                trigger OnAction()
                begin
                    Rec.Status := Rec.Status::Open;
                    Rec.Modify;

                    Message('Document %1 has been reopened successfully', Rec."Drill ID");
                end;
            }
            action(Dimensions)
            {
                ApplicationArea = Basic;
                Image = Dimensions;
                Promoted = true;
                PromotedCategory = Category6;
                PromotedIsBig = true;
                ToolTip = 'Executes the Dimensions action.';
                trigger OnAction()
                begin
                    Rec.ShowDocDim;
                    CurrPage.SaveRecord;
                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category7;
                PromotedIsBig = true;
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("Drill ID", Rec."Drill ID");
                    if Rec.FindSet then
                        Report.Run(95000, true, true, Rec);
                end;
            }
        }
    }
}

#pragma implicitwith restore

