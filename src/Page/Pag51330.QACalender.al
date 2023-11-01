#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51330 "QA Calender"
{
    PageType = List;
    SourceTable = "Subject Area Contact Hrs";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Quality Response No."; Rec."Quality Response No.")
                {
                    ApplicationArea = Basic;
                }
                field("Subject Area"; Rec."Subject Area")
                {
                    ApplicationArea = Basic;
                }
                field("Course Unit"; Rec."Course Unit")
                {
                    ApplicationArea = Basic;
                }
                field("Contact Hours"; Rec."Contact Hours")
                {
                    ApplicationArea = Basic;
                }
                // field("Planned Date";"Planned Date")
                // {
                //     ApplicationArea = Basic;
                // }
                // field(Blocked;Blocked)
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Actual Start Date";"Actual Start Date")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Actual End Date";"Actual End Date")
                // {
                //     ApplicationArea = Basic;
                // }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

