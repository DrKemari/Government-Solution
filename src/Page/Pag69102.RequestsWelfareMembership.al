#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69102 "Requests Welfare Membership"
{
    ApplicationArea = Basic;
    CardPageID = "Request Welfare  Membership";
    PageType = List;
    SourceTable = "Hr Welfare Header";
    SourceTableView = where("Welfare Type" = filter(Application),
                            Status = filter(Open | "Pending Approval"));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Welfare No."; Rec."Welfare No.")
                {
                    ApplicationArea = Basic;
                }
                field("Welfare Type"; Rec."Welfare Type")
                {
                    ApplicationArea = Basic;
                }
                field("Raised By"; Rec."Raised By")
                {
                    ApplicationArea = Basic;
                }
                field("Raisee Name"; Rec."Raisee Name")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Welfare Category"; Rec."Welfare Category")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
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
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

