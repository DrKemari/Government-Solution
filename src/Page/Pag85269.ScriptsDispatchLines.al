#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85269 "Scripts Dispatch Lines"
{
    PageType = ListPart;
    SourceTable = "Scripts Dispatch Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Center Code"; Rec."Center Code")
                {
                    ApplicationArea = Basic;
                }
                field("Center Name"; Rec."Center Name")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Scripts Expected"; Rec."No. of Scripts Expected")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Quantity Received"; Rec."Quantity Received")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("No. of Envelopes"; Rec."No. of Envelopes")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field(Examination; Rec.Examination)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Paper Code"; Rec."Paper Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Paper Name"; Rec."Paper Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Examination Sitting"; Rec."Examination Sitting")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Envelope No"; Rec."Envelope No")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Envelope Scripts"; Rec."No. of Envelope Scripts")
                {
                    ApplicationArea = Basic;
                    Caption = 'No. of  Scripts';
                    Editable = true;
                }
                field("No. of Scripts Returned"; Rec."No. of Scripts Returned")
                {
                    ApplicationArea = Basic;
                }
                field("Marksheet Issued"; Rec."Marksheet Issued")
                {
                    ApplicationArea = Basic;
                }
                field("Marksheet Returned"; Rec."Marksheet Returned")
                {
                    ApplicationArea = Basic;
                }
                field("Script Returned"; Rec."Script Returned")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Marking Complete"; Rec."Marking Complete")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Allocate Marksheet")
            {
                ApplicationArea = Basic;
                Image = Allocate;

                trigger OnAction()
                begin
                    Rec."Marksheet Issued" := true;
                    Rec."Issued By" := UserId;
                    Rec."Issued Date" := CurrentDatetime;
                    Rec.Modify(true);
                end;
            }
            action("Receive Marksheet")
            {
                ApplicationArea = Basic;
                Image = ReceiveLoaner;

                trigger OnAction()
                begin

                    Rec.Validate("Marksheet Returned");
                    Rec."Marksheet Returned" := true;
                    Rec."Receipt By" := UserId;
                    Rec."Receipt Date" := Today;
                    Rec.Modify(true);
                end;
            }
            action("Complete Marking")
            {
                ApplicationArea = Basic;
                Image = CompleteLine;

                trigger OnAction()
                begin
                    Rec.Validate("Marking Complete");
                    Rec."Marking Complete" := true;

                    Rec."Completed By" := UserId;
                    Rec."Completed On" := CurrentDatetime;
                    Rec.Modify(true);
                end;
            }
            action("Return Scripts")
            {
                ApplicationArea = Basic;
                Image = ReceiveLoaner;

                trigger OnAction()
                begin

                    Rec."Script Returned" := true;
                    Rec.Modify(true);
                end;
            }
        }
    }
}

#pragma implicitwith restore

