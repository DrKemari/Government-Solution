#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69349 "Supervisor Evaluation Lines"
{
    Caption = 'Supervisor Assessment Lines ';
    PageType = ListPart;
    SourceTable = "Training Evaluations";
    SourceTableView = where(Type = filter(Supervisor));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Training Category"; Rec."Training Category")
                {
                    ApplicationArea = Basic;
                }
                field("Category Description"; Rec."Category Description")
                {
                    ApplicationArea = Basic;
                }
                field("Rating Code"; Rec."Rating Code")
                {
                    ApplicationArea = Basic;
                }
                field("Rating Description"; Rec."Rating Description")
                {
                    ApplicationArea = Basic;
                }
                field(Comments; Rec.Comments)
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
        Rec.Type := Rec.Type::Supervisor;
    end;
}

#pragma implicitwith restore

