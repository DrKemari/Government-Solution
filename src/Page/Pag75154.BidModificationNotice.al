#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 75154 "Bid Modification Notice"
{
    PageType = List;
    SourceTable = "Bid Modification Notice";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Bid Action Type"; Rec."Bid Action Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Action Type field.';
                }
                field("Notice Date"; Rec."Notice Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Notice Date field.';
                }
                field("Bid No."; Rec."Bid No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid No. field.';
                }
                field("IFS No."; Rec."IFS No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the IFS No. field.';
                }
                field("Reason for Action"; Rec."Reason for Action")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reason for Action field.';
                }
                field("External Reference No"; Rec."External Reference No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the External Reference No field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

