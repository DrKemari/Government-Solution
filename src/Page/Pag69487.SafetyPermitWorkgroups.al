#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69487 "Safety Permit Workgroups"
{
    CardPageID = "Safety Permit Workgroup";
    PageType = List;
    SourceTable = "Safety Permit Workgroup";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Workgroup Type"; Rec."Workgroup Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Contact Person"; Rec."Contact Person")
                {
                    ApplicationArea = Basic;
                }
                field("Telephone No."; Rec."Telephone No.")
                {
                    ApplicationArea = Basic;
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                }
                field("Date Informed"; Rec."Date Informed")
                {
                    ApplicationArea = Basic;
                }
                field("Comments/Additional Notes"; Rec."Comments/Additional Notes")
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

