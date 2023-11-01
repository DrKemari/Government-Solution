#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 95139 "Risk & Audit Officers"
{
    ApplicationArea = Basic;
    CardPageID = "Risk & Audit Officer";
    PageType = List;
    SourceTable = "Risk & Audit Officer";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Resource No."; Rec."Resource No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Assigned Audit Projects"; Rec."No. of Assigned Audit Projects")
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

