#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51537 "Quality Audit Setup"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "Quality Audit Setup";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Organization Name"; Rec."Organization Name")
                {
                    ApplicationArea = Basic;
                }
                field("Default Chief Audit Executive"; Rec."Default Chief Audit Executive")
                {
                    ApplicationArea = Basic;
                }
                field(FilePath; Rec.FilePath)
                {
                    ApplicationArea = Basic;
                    Caption = 'Documents File Path';
                }
            }
            group("Number Series")
            {
                Caption = 'Number Series';
                field("Audit Plan Nos."; Rec."Audit Plan Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Audit Roadmap Nos."; Rec."Audit Roadmap Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Site Visit Nos."; Rec."Site Visit Nos.")
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
            action("Audit Locations")
            {
                ApplicationArea = Basic;
                Image = Location;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Customer List";
                RunPageView = where(Name=const(''));
            }
            action(Auditors)
            {
                ApplicationArea = Basic;
            }
            action("Quality Audit Types")
            {
                ApplicationArea = Basic;
            }
            action("Audit Roles")
            {
                ApplicationArea = Basic;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Audit Roles";
            }
            action("Audit Scope")
            {
                ApplicationArea = Basic;
                Image = Register;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                RunObject = Page "Audit Plan Scope";
            }
        }
    }
}

#pragma implicitwith restore

