#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 95087 "Overal Risk Rating Scale Lines"
{
    PageType = ListPart;
    SourceTable = "Risk Rating Scale Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Risk Rating Scale Type"; Rec."Risk Rating Scale Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Risk Rating Scale Type field.';
                }
                field("Rating Scale ID"; Rec."Rating Scale ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Rating Scale ID field.';
                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Min Overall Rating"; Rec."Min Overall Rating")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Min Overall Rating field.';
                }
                field("Max Overall Rating"; Rec."Max Overall Rating")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Max Overall Rating field.';
                }
                field("Risk Heat Zone"; Rec."Risk Heat Zone")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Risk Heat Zone field.';
                }
                field("Default Risk Response Strategy"; Rec."Default Risk Response Strategy")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Risk Response Strategy field.';
                }
                field("No. of Risk Response Actions"; Rec."No. of Risk Response Actions")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Risk Response Actions field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Line)
            {
                Caption = '&Line';
                action("Overall Response Actions")
                {
                    ApplicationArea = Basic;
                    Image = ProjectExpense;
                    Promoted = true;
                    PromotedIsBig = true;
                    RunObject = Page "Overal Risk Response Actions";
                    RunPageLink = "Risk Rating Scale Type" = field("Risk Rating Scale Type"),
                                  "Rating Scale ID" = field("Rating Scale ID"),
                                  Code = field(Code);
                    ToolTip = 'Executes the Overall Response Actions action.';
                }
            }
        }
    }
}

#pragma implicitwith restore

