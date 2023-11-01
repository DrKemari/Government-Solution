#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51386 "Application Board Approval"
{
    PageType = Card;
    SourceTable = "Accreditation Application";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Application No. field.';
                }
                field("Application Type"; Rec."Application Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Type field.';
                }
                field("Application Type Name"; Rec."Application Type Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Application Type Name field.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Verdict Code"; Rec."Verdict Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Board Verdict';
                    ToolTip = 'Specifies the value of the Board Verdict field.';
                }
                field("Verdict Description"; Rec."Verdict Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Verdict Description field.';
                }
                field("Institution Type Code"; Rec."Institution Type Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution Type Code field.';
                }
                field("Institution Type"; Rec."Institution Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution Type field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Address 2 field.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the City field.';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Post Code field.';
                }
                field(County; Rec.County)
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the County field.';
                }
                field(Country; Rec.Country)
                {
                    ApplicationArea = Basic;
                    Importance = Additional;
                    ToolTip = 'Specifies the value of the Country field.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
                group("Payment Details")
                {
                    Editable = false;
                    field("Currency Code"; Rec."Currency Code")
                    {
                        ApplicationArea = Basic;
                        Importance = Additional;
                        ToolTip = 'Specifies the value of the Currency Code field.';
                    }
                    field("Application Fee LCY"; Rec."Application Fee LCY")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                        ToolTip = 'Specifies the value of the Application Fee LCY field.';
                    }
                    field("Application Fee"; Rec."Application Fee")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                        ToolTip = 'Specifies the value of the Application Fee field.';
                    }
                    field("Invoice No."; Rec."Invoice No.")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Invoice No. field.';
                    }
                    field("Invoice Amount"; Rec."Invoice Amount")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Invoice Amount field.';
                    }
                    field("Invoice Amount LCY"; Rec."Invoice Amount LCY")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Invoice Amount LCY field.';
                    }
                    field("Receipt No."; Rec."Receipt No.")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Receipt No. field.';
                    }
                    field("Receipt Amount"; Rec."Receipt Amount")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Receipt Amount field.';
                    }
                    field("Receipt Amount LCY"; Rec."Receipt Amount LCY")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Receipt Amount LCY field.';
                    }
                }
            }
            part(Control9; "Accreditation Questions")
            {
                SubPageLink = "Application No." = field("Application No.");
                ApplicationArea = Basic;
            }
            part(Control14; "Application Categories")
            {
                SubPageLink = "Application No." = field("Application No.");
                ApplicationArea = Basic;
            }
            part(Control29; "Accreditation Admin Staff")
            {
                SubPageLink = "Application No." = field("Application No.");
                ApplicationArea = Basic;
            }
            part(Control28; "Accreditation Trainers")
            {
                SubPageLink = "Application No." = field("Application No.");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control24; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control25; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control26; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control27; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Proceed to Closure")
            {
                ApplicationArea = Basic;
                Image = Completed;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Proceed to Closure action.';
                trigger OnAction()
                var
                    TXT001: label 'Proceed to Closure?';
                begin
                    if Confirm(TXT001) = true then begin
                        Rec.Status := Rec.Status::"Awaiting Closure";
                        Rec.Modify(true);
                    end
                end;
            }
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Send A&pproval Request action.';
                    trigger OnAction()
                    begin
                        /*//if //ApprovalsMgmt.CheckAppointmentWorkflowEnabled(Rec) THEN
                          //ApprovalsMgmt.OnSendAppointmentForApproval(Rec);*/
                        Message('');

                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';
                    trigger OnAction()
                    begin
                        Rec.TestField(Status, Rec.Status::"Pending Approval");//status must be open.
                        ////ApprovalsMgmt.OnCancelAppointmentApprovalRequest(Rec);
                    end;
                }
                separator(Action37)
                {
                }
            }
        }
        area(processing)
        {
            group("PHYSICAL TECHNOLOGICAL RESOURCE")
            {
                action("Seating Capacity")
                {
                    ApplicationArea = Basic;
                    Caption = 'Seating Capacity';
                    Image = Capacity;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Page "Seating Capacity";
                    RunPageLink = "Application No." = field("Application No.");
                    ToolTip = 'Executes the Seating Capacity action.';
                }
                action("Reference Books")
                {
                    ApplicationArea = Basic;
                    Caption = 'Reference Books';
                    Image = BookingsLogo;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Page "Reference Books";
                    RunPageLink = "Application No." = field("Application No.");
                    ToolTip = 'Executes the Reference Books action.';
                }
                action("Computer Labs")
                {
                    ApplicationArea = Basic;
                    Image = Components;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Page "Computer Lab Details";
                    RunPageLink = "Application No." = field("Application No.");
                    ToolTip = 'Executes the Computer Labs action.';
                }
                action("Computer Details")
                {
                    ApplicationArea = Basic;
                    Image = Design;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Page "Application Computer Details";
                    RunPageLink = "Application No." = field("Application No.");
                    ToolTip = 'Executes the Computer Details action.';
                }
                action("ICT Accessories")
                {
                    ApplicationArea = Basic;
                    Image = AlternativeAddress;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Page "ICT Item/Accessories";
                    RunPageLink = "Application No." = field("Application No.");
                    ToolTip = 'Executes the ICT Accessories action.';
                }
                action(LAN)
                {
                    ApplicationArea = Basic;
                    Image = WageLines;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Page "Items connected to the LAN";
                    RunPageLink = "Application No." = field("Application No.");
                    ToolTip = 'Executes the LAN action.';
                }
                action("Academic Software")
                {
                    ApplicationArea = Basic;
                    Image = SNInfo;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Page "Academic Software";
                    RunPageLink = "Application No." = field("Application No.");
                    ToolTip = 'Executes the Academic Software action.';
                }
            }
        }
        area(reporting)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    Rec.SetRange("No.", Rec."No.");
                    Report.Run(51251, true, false, Rec);
                end;
            }
        }
    }
}

#pragma implicitwith restore

