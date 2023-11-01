#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51356 "Resources Allocated"
{
    PageType = List;
    SourceTable = "Resource Accreditation Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Appoint; Rec.Appoint)
                {
                    ApplicationArea = Basic;
                }
                field("Account Type"; Rec."Account Type")
                {
                    ApplicationArea = Basic;
                }
                field("Account No"; Rec."Account No")
                {
                    ApplicationArea = Basic;
                }
                field("Account Name"; Rec."Account Name")
                {
                    ApplicationArea = Basic;
                }
                field("Team Leader"; Rec."Team Leader")
                {
                    ApplicationArea = Basic;
                }
                field("Appointed On"; Rec."Appointed On")
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
            action("Projects Assigned")
            {
                ApplicationArea = Basic;
                Image = AssemblyOrder;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Resource Project Allocation";
                RunPageLink = "Line No."=field(Code),
                              "Resource Card No."=field("Resource Card No.");
                Visible = false;
            }
        }
    }
}

#pragma implicitwith restore

