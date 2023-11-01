#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51360 "ResourceUniversity Application"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = true;
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
                }
                field("Application Type"; Rec."Application Type")
                {
                    ApplicationArea = Basic;
                }
                field("Application Type Name"; Rec."Application Type Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = Basic;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                }
                field(County; Rec.County)
                {
                    ApplicationArea = Basic;
                }
                field(Country; Rec.Country)
                {
                    ApplicationArea = Basic;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                group("Payment Details")
                {
                    Editable = false;
                    field("Currency Code"; Rec."Currency Code")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Application Fee LCY"; Rec."Application Fee LCY")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                    }
                    field("Application Fee"; Rec."Application Fee")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                    }
                    field("Receipt No."; Rec."Receipt No.")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Receipt Amount"; Rec."Receipt Amount")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Invoice No."; Rec."Invoice No.")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Invoice Amount"; Rec."Invoice Amount")
                    {
                        ApplicationArea = Basic;
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
        area(processing)
        {
            action("Complete Specification Check")
            {
                ApplicationArea = Basic;
                Image = Completed;
                Promoted = true;
                PromotedCategory = Process;
                Visible = false;

                trigger OnAction()
                var
                    TXT001: label 'Are you sure you want to complete the specifications checks?';
                begin
                    if Confirm(TXT001) = true then begin
                        Rec.Status := Rec.Status::"Awaiting Payment Processing";
                        Rec.Published := true;
                        Rec.Modify(true);
                    end
                end;
            }
        }
        area(navigation)
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
                }
                action("Computer Labs")
                {
                    ApplicationArea = Basic;
                    Image = Components;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Page "Computer Lab Details";
                    RunPageLink = "Application No." = field("Application No.");
                }
                action("Computer Details")
                {
                    ApplicationArea = Basic;
                    Image = Design;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Page "Application Computer Details";
                    RunPageLink = "Application No." = field("Application No.");
                }
                action("ICT Accessories")
                {
                    ApplicationArea = Basic;
                    Image = AlternativeAddress;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Page "ICT Item/Accessories";
                    RunPageLink = "Application No." = field("Application No.");
                }
                action(LAN)
                {
                    ApplicationArea = Basic;
                    Image = WageLines;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Page "Items connected to the LAN";
                    RunPageLink = "Application No." = field("Application No.");
                }
                action("Academic Software")
                {
                    ApplicationArea = Basic;
                    Image = SNInfo;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Page "Academic Software";
                    RunPageLink = "Application No." = field("Application No.");
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

