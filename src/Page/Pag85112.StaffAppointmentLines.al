#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85112 "Staff Appointment Lines"
{
    PageType = ListPart;
    SourceTable = "Staff Appointment Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Staff Category"; Rec."Staff Category")
                {
                    ApplicationArea = Basic;
                }
                field("Role Code"; Rec."Role Code")
                {
                    ApplicationArea = Basic;
                }
                field("Resource No."; Rec."Resource No.")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                }
                field("Expiry Date"; Rec."Expiry Date")
                {
                    ApplicationArea = Basic;
                }
                field("Paper Code"; Rec."Paper Code")
                {
                    ApplicationArea = Basic;
                }
                field("Paper Name"; Rec."Paper Name")
                {
                    ApplicationArea = Basic;
                }
                field("Bank Code"; Rec."Bank Code")
                {
                    ApplicationArea = Basic;
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = Basic;
                }
                field("Branch Name"; Rec."Branch Name")
                {
                    ApplicationArea = Basic;
                }
                field("Bank Branch No."; Rec."Bank Branch No.")
                {
                    ApplicationArea = Basic;
                }
                field("Bank Account No."; Rec."Bank Account No.")
                {
                    ApplicationArea = Basic;
                }
                field("M-Pesa Number"; Rec."M-Pesa Number")
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
            group(Functions)
            {
                Visible = false;
                action("Required Qualifications")
                {
                    ApplicationArea = Basic;
                    Image = Certificate;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Appointment Qualifications";
                    RunPageLink = "Staff Role Code"=field("Role Code"),
                                  "Staff Appointment ID"=field("Header No.");
                }
                action("Required Experiences")
                {
                    ApplicationArea = Basic;
                    Caption = 'Required Experiences';
                    Image = Excise;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Appointment Experience";
                    RunPageLink = "Staff Role Code"=field("Role Code"),
                                  "Staff Appointment ID"=field("Header No.");
                }
            }
        }
    }
}

#pragma implicitwith restore

