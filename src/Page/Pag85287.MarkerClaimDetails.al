#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85287 "Marker Claim Details"
{
    PageType = ListPart;
    SourceTable = "Scripts Dispatch Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
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
                field("No. of Scripts Expected"; Rec."No. of Scripts Expected")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the No. of Scripts Expected field.';
                }
                field("Quantity Received"; Rec."Quantity Received")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Quantity Received field.';
                }
                field("No. of Envelopes"; Rec."No. of Envelopes")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the No. of Envelopes field.';
                }
                field(Examination; Rec.Examination)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Examination field.';
                }
                field("Paper Code"; Rec."Paper Code")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Paper Code field.';
                }
                field("Paper Name"; Rec."Paper Name")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Paper Name field.';
                }
                field("Examination Sitting"; Rec."Examination Sitting")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Examination Sitting field.';
                }
                field("Envelope No"; Rec."Envelope No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Envelope No field.';
                }
                field("No. of Envelope Scripts"; Rec."No. of Envelope Scripts")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Envelope Scripts field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

