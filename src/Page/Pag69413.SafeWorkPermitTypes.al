#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69413 "Safe Work Permit Types"
{
    ApplicationArea = Basic;
    CardPageID = "Safe Work Permit Type";
    Editable = false;
    PageType = List;
    SourceTable = "Safe Work Permit Type";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("No. of Safe Work Permit Apps"; Rec."No. of Safe Work Permit Apps")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Safe Work Compl Reports"; Rec."No. of Safe Work Compl Reports")
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
    }
}

#pragma implicitwith restore

