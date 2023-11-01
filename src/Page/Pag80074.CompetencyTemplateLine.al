#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80074 "Competency Template Line"
{
    PageType = ListPart;
    SourceTable = "Competency Template Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Competency Template ID"; Rec."Competency Template ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Competency Template ID field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Competency Code"; Rec."Competency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Competency Code field.';
                }
                field("Competency Description"; Rec."Competency Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Competency Description field.';
                }
                field("Competency Category"; Rec."Competency Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Competency Category field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Weight %"; Rec."Weight %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Weight % field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

