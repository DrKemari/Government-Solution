#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 95344 "Risk & Audit Committee Types"
{
    ApplicationArea = Basic;
    CardPageID = "Risk & Audit Comm Types Card";
    PageType = List;
    SourceTable = "Audit Committee Types";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Committee Type"; Rec."Committee Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Title of Appointing Officer"; Rec."Title of Appointing Officer")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Non-Staff Allowed"; Rec."Non-Staff Allowed")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Min. No. of Members"; Rec."Min. No. of Members")
                {
                    ApplicationArea = Basic;
                }
                field("Mandate Type"; Rec."Mandate Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("No. of Appointments Made"; Rec."No. of Appointments Made")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(ActionGroup9)
            {
                action("Audit Committe Composition")
                {
                    ApplicationArea = Basic;
                    Image = TeamSales;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Risk & Audit Comm Composition";
                    RunPageLink = "Committee Type"=field("Committee Type");
                }
                action("Audit Committee Function")
                {
                    ApplicationArea = Basic;
                    Image = WorkCenterLoad;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Audit Committee Function";
                    RunPageLink = "Committee Type"=field("Committee Type");
                }
            }
        }
    }
}

#pragma implicitwith restore

