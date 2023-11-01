#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 75126 "IFS Securities"
{
    PageType = List;
    SourceTable = "IFS Securities";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("IFS Code"; Rec."IFS Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the IFS Code field.';
                }
                field("Form of Security"; Rec."Form of Security")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Form of Security field.';
                }
                field("Security Type"; Rec."Security Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Security Type field.';
                }
                field("Required at Bid Submission"; Rec."Required at Bid Submission")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Required at Bid Submission field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Security Amount (LCY)"; Rec."Security Amount (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Security Amount (LCY) field.';
                }
                field("Bid Security Validity Expiry"; Rec."Bid Security Validity Expiry")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bid Security Validity Expiry Date field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

