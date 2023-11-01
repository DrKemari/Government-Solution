#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 70023 "Bidder Mandatory Requirements"
{
    PageType = Card;
    SourceTable = "Bidder Mandatory Requirements";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Company Name"; Rec."Company Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Company Name field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Complied; Rec.Complied)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Complied field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
                field("Evaluater User Id"; Rec."Evaluater User Id")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluater User Id field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

