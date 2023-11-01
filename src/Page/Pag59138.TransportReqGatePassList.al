#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 59138 "Transport Req Gate Pass List"
{
    ApplicationArea = Basic;
    CardPageID = "Fleet Req Gate Pass Card";
    PageType = List;
    SourceTable = "Transport Req Gate Pass";
    SourceTableView = where(Status = filter(Open | "Pending Approval" | Rejected | Cancelled));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Gate Pass Serial No"; Rec."Gate Pass Serial No")
                {
                    ApplicationArea = Basic;
                }
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field("Transport Requisition No"; Rec."Transport Requisition No")
                {
                    ApplicationArea = Basic;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control12; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control13; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Print Gate Pass")
            {
                ApplicationArea = Basic;
         //       RunObject = Report "Gate Pass";
            }
        }
    }
}

#pragma implicitwith restore

