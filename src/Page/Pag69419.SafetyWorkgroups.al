#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69419 "Safety Workgroups"
{
    ApplicationArea = Basic;
    CardPageID = "Safety Workgroup";
    PageType = List;
    SourceTable = "Safety Workgroup";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Workgroup ID"; Rec."Workgroup ID")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Stakeholder Category"; Rec."Stakeholder Category")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
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
            action("OSH Plan Emergency Contacts")
            {
                ApplicationArea = Basic;
                Image = Accounts;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "HSE Plan Emergency Contacts";
                RunPageLink = "Safety Workgroup ID" = field("Workgroup ID");
            }
            action("Emergency Drill Records")
            {
                ApplicationArea = Basic;
                Image = Reconcile;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Emergency Drill Logs";
            }
            action("Risk Incident Logs")
            {
                ApplicationArea = Basic;
                Image = Log;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Risk Incident Logss";
            }
            action("Safe Work Permit Applications")
            {
                ApplicationArea = Basic;
                Image = ApplicationWorksheet;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Safe Work Permit Application";
                RunPageView = where("Document Type" = filter("Safe Work Permit Application"));
            }
        }
    }
}

#pragma implicitwith restore

