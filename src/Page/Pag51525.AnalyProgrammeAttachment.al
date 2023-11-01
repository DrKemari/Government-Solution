#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51525 "Analy Programme Attachment"
{
    Caption = 'strengths and weaknesses on Programme Attachment';
    PageType = List;
    SourceTable = "Stateholder Response Assessmen";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Analysis Type"; Rec."Analysis Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Analysis Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control6; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control7; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control8; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control9; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Category Type" := Rec."category type"::Attachment;
    end;
}

#pragma implicitwith restore

