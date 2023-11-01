#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69149 "Person Specifications"
{
    PageType = List;
    SourceTable = "Position Responsibilities";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Responsibility; Rec.Responsibility)
                {
                    ApplicationArea = Basic;
                    Caption = 'Specification';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Type := Rec.Type::Person;
    end;
}

#pragma implicitwith restore

