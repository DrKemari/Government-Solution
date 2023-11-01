#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69350 "Evaluation Category Setup"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Rating Category Setup";
    SourceTableView = where(Type = const(Evaluation));
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Rating Category"; Rec."Rating Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rating Category field.';
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
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Type := Rec.Type::Evaluation;
    end;
}

#pragma implicitwith restore

