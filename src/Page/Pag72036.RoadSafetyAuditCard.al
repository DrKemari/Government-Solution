#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72036 "Road Safety Audit Card"
{
    PageType = Card;
    SourceTable = "Road Study_Survey";
    SourceTableView = where("Study/Survey Type" = filter("Road Safety Audit"));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Study ID"; Rec."Study ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Road Asset ID"; Rec."Road Asset ID")
                {
                    ApplicationArea = Basic;
                }
                field("All Road Sections"; Rec."All Road Sections")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Execution Approach"; Rec."Primary Execution Approach")
                {
                    ApplicationArea = Basic;
                }
                field("Study Abstract"; Rec."Study Abstract")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Start Date"; Rec."Planned Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Planned End Date"; Rec."Planned End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Total Distance (KM)"; Rec."Total Distance (KM)")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1"; Rec."Global Dimension 1")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 2"; Rec."Global Dimension 2")
                {
                    ApplicationArea = Basic;
                }
                field("Region ID"; Rec."Region ID")
                {
                    ApplicationArea = Basic;
                }
                field("Road Works Project ID"; Rec."Road Works Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Total Approved Budget (LCY)"; Rec."Total Approved Budget (LCY)")
                {
                    ApplicationArea = Basic;
                }
                field("Total Actual Cost (LCY)"; Rec."Total Actual Cost (LCY)")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Funding)
            {
                Caption = 'Funding';
                field("Primary Funding Agency ID"; Rec."Primary Funding Agency ID")
                {
                    ApplicationArea = Basic;
                }
                field("Funding Source Type"; Rec."Funding Source Type")
                {
                    ApplicationArea = Basic;
                }
                field("Funding Agency Contacts"; Rec."Funding Agency Contacts")
                {
                    ApplicationArea = Basic;
                }
                field("Funding Agency Name"; Rec."Funding Agency Name")
                {
                    ApplicationArea = Basic;
                }
            }
            group(Responsibility)
            {
                Caption = 'Responsibility';
                field("Project Manager"; Rec."Project Manager")
                {
                    ApplicationArea = Basic;
                }
                field("Study Admin Officer ID"; Rec."Study Admin Officer ID")
                {
                    ApplicationArea = Basic;
                }
                field("Admin Officer Name"; Rec."Admin Officer Name")
                {
                    ApplicationArea = Basic;
                }
                field("Study Finance Officer ID"; Rec."Study Finance Officer ID")
                {
                    ApplicationArea = Basic;
                }
                field("Study Finance Officer Name"; Rec."Study Finance Officer Name")
                {
                    ApplicationArea = Basic;
                }
                field("Regional Director ID"; Rec."Regional Director ID")
                {
                    ApplicationArea = Basic;
                }
                field("Regional Director Name"; Rec."Regional Director Name")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control31; "Road Study Task Line")
            {
                SubPageLink = "Study ID" = field("Study ID");
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(Objectives)
            {
                ApplicationArea = Basic;
                Caption = 'Objectives';
                Image = Opportunity;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Road Study Objectives";
                RunPageLink = "Study ID" = field("Study ID");
            }
            action(Relations)
            {
                ApplicationArea = Basic;
                Caption = 'Related/Collaborating Studies';
                Image = Relationship;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Road Study Relations";
                RunPageLink = "Study ID" = field("Study ID");
            }
            action("Alternative Options")
            {
                ApplicationArea = Basic;
                Caption = 'Project Alternatives';
                Image = AlternativeAddress;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Road Study Alternative Options";
                RunPageLink = "Study ID" = field("Study ID");
            }
            action("Cost Benefit Analysis Matrix")
            {
                ApplicationArea = Basic;
                Image = CalculateCost;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Study Cost Benefit Analysis";
                RunPageLink = "Study ID" = field("Study ID");
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Study/Survey Type" := Rec."study/survey type"::"Road Safety Audit";
    end;
}

#pragma implicitwith restore

