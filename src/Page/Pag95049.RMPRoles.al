#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 95049 "RMP Roles"
{
    CardPageID = "RMP Role";
    PageType = List;
    SourceTable = "RMP Role";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Caption = 'Risk & Compliance Roles';
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Executive Summary"; Rec."Executive Summary")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Responsible Team")
            {
                ApplicationArea = Basic;
                Image = ResourcePlanning;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "RMP Enterprise Risk Mgt Teams";
            }
            action("Default Responsibilities")
            {
                ApplicationArea = Basic;
                Image = Default;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Risk Mgt. Responsibilities";
            }
        }
    }
}

#pragma implicitwith restore

