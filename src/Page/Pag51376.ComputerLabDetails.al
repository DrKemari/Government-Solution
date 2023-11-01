#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51376 "Computer Lab Details"
{
    PageType = List;
    SourceTable = "Accreditation Computer Labs";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application No. field.';
                }
                field("Computer Laboratory"; Rec."Computer Laboratory")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Computer Laboratory field.';
                }
                field("Seating capacity"; Rec."Seating capacity")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Seating capacity field.';
                }
                field("No. available for training"; Rec."No. available for training")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. available for training field.';
                }
                field("No. with Adapter Cards"; Rec."No. with Adapter Cards")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. with Adapter Cards field.';
                }
                field("Total space"; Rec."Total space")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total space field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

