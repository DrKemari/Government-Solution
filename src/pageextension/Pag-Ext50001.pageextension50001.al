#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50001 "pageextension50001" extends "Company Information" 
{
    layout
    {
        modify("VAT Registration No.")
        {
            Caption = 'KRA PIN.';
        }
        addafter(Picture)
        {
            field("N.S.SF. No."; Rec."N.S.SF. No.")
            {
                ApplicationArea = Basic;
            }
            field("N.H.I.F No."; Rec."N.H.I.F No.")
            {
                ApplicationArea = Basic;
            }
            field(RubberStamp; Rec.RubberStamp)
            {
                ApplicationArea = Basic;
            }
        }
        addafter(Payments)
        {
            group("Outgoing Emails")
            {
                Caption = 'Outgoing Emails';
                field("Procurement Support E-mail"; Rec."Procurement Support E-mail")
                {
                    ApplicationArea = Basic;
                }
                field("Legal Head Email"; Rec."Legal Head Email")
                {
                    ApplicationArea = Basic;
                }
                field("Administrator Email"; Rec."Administrator Email")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Files)
            {
                Caption = 'Files';
                field("HR Document Link"; Rec."HR Document Link")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }
    actions
    {
        addafter("Responsibility Centers")
        {
            action("Rules and Regulations")
            {
                ApplicationArea = Basic;
                Image = Segment;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Hr Guiding Principle";
            }
            action("Company Activities")
            {
                ApplicationArea = Basic;
                Image = Segment;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Medical Examination Type";
            }
            action("HR Committees")
            {
                ApplicationArea = Basic;
                Caption = 'Committees';
                Image = Segment;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Disciplinary Committe";
            }
            action("Base Calendar")
            {
                ApplicationArea = Basic;
                Image = Segment;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page "Base Calendar List";
            }
            action(Dimensions)
            {
                ApplicationArea = Basic;
                Image = Dimensions;
                Promoted = true;
                PromotedCategory = Category4;
                RunObject = Page Dimensions;
            }
        }
    }
}

#pragma implicitwith restore

