#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80349 "BR Survey Score Guide"
{
    PageType = List;
    SourceTable = "BR Survey Score Guide";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Rating Type"; Rec."Rating Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rating Type field.';
                }
                field("Desired Perfomance Direction"; Rec."Desired Perfomance Direction")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Desired Perfomance Direction field.';
                }
                field("code"; Rec.code)
                {
                    ApplicationArea = Basic;
                    Caption = 'Code';
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Response Value"; Rec."Response Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Response Value field.';
                }
                field("Score %"; Rec."Score %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Score % field.';
                }
                field("Section Code"; Rec."Section Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Section Code field.';
                }
                field("Question ID"; Rec."Question ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Question ID field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

