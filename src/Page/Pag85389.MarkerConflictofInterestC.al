#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85389 "Marker Conflict of Interest C"
{
    PageType = Card;
    SourceTable = "Marker Conflict of Interest";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Marker No"; Rec."Marker No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Marker No field.';
                }
                field("Marker Name"; Rec."Marker Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Marker Name field.';
                }
                field("Center Code"; Rec."Center Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Center Code field.';
                }
                field("Center Name"; Rec."Center Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Center Name field.';
                }
                field("Date Declared"; Rec."Date Declared")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Declared field.';
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

