#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69438 "Inspection Response Code"
{
    PageType = Card;
    SourceTable = "Inspection Response Code";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Response Type"; Rec."Response Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Response Type field.';
                }
                field("Response Code"; Rec."Response Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Response Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Score %"; Rec."Score %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Score % field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

