#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85089 "Center Re-Allocation Entries"
{
    PageType = List;
    SourceTable = "Center Re-Allocation Entries";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Initial Center Code"; Rec."Initial Center Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Initial Center Code field.';
                }
                field("Initial Center Name"; Rec."Initial Center Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Initial Center Name field.';
                }
                field("Total Student Booked"; Rec."Total Student Booked")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Student Booked field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control9; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control10; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control11; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control12; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

