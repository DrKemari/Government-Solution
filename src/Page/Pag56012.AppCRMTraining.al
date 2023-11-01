#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 56012 "App CRM-Training"
{
    ApplicationArea = Basic;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "CRM Training";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field("Start Time"; Rec."Start Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Time field.';
                }
                field("End Time"; Rec."End Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Time field.';
                }
                field("Duration Units"; Rec."Duration Units")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Duration Units field.';
                }
                field(Duration; Rec.Duration)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Duration field.';
                }
                field("Cost Of Training"; Rec."Cost Of Training")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Cost Of Training field.';
                }
                field(Location; Rec.Location)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Location field.';
                }
                field(Control17; Rec.Attendees)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Attendees field.';
                }
                field("Provider Name"; Rec."Provider Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Provider Name field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Published; Rec.Published)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Published field.';
                }
                field("Published By"; Rec."Published By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Published By field.';
                }
                field("Total Attendees"; Rec."Total Attendees")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Attendees field.';
                }
                field("Published On"; Rec."Published On")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Published On field.';
                }
            }
            part(Control31; "Training Prerequisites")
            {
                SubPageLink = "Document No." = field("Document No.");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control20; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control21; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control22; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control23; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Publish)
            {
                ApplicationArea = Basic;
                Image = PostedPutAway;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Publish action.';
                trigger OnAction()
                begin
                    Rec.Published := true;
                    Rec."Published By" := UserId;
                    Rec."Published On" := Today;

                    Rec.Modify(true);
                end;
            }
            action(Close)
            {
                ApplicationArea = Basic;
                Image = Close;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Close action.';
                trigger OnAction()
                begin
                    Rec.Published := false;
                    Rec.Modify(true);
                end;
            }
            action(Attendees)
            {
                ApplicationArea = Basic;
                Image = Answers;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Training Attendees";
                RunPageLink = "Document ID" = field("Document No.");
                ToolTip = 'Executes the Attendees action.';
            }
        }
    }
}

#pragma implicitwith restore

