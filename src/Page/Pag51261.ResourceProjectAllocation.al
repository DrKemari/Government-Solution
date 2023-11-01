#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51261 "Resource Project Allocation"
{
    PageType = ListPart;
    SourceTable = "Project Resource Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = Basic;
                }
                field("Application Name"; Rec."Application Name")
                {
                    ApplicationArea = Basic;
                }
                field("Job Task Code"; Rec."Job Task Code")
                {
                    ApplicationArea = Basic;
                }
                field("Job Task Description"; Rec."Job Task Description")
                {
                    ApplicationArea = Basic;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("No.of Selected Resources"; Rec."No.of Selected Resources")
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
            action("Resources Allocated")
            {
                ApplicationArea = Basic;
                RunObject = Page "Resources Allocated";
                RunPageLink = "Resource Card No."=field("Resource Card No."),
                              "Job No"=field("Job No");
            }
        }
    }
}

#pragma implicitwith restore

