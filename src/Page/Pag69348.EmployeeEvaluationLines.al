#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69348 "Employee Evaluation Lines"
{
    Caption = 'Employee  Assessment Lines';
    PageType = ListPart;
    SourceTable = "Training Evaluations";
    SourceTableView = where(Type = filter(Self));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Training Category"; Rec."Training Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Training Category field.';
                }
                field("Category Description"; Rec."Category Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Category Description field.';
                }
                field("Rating Code"; Rec."Rating Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rating Code field.';
                }
                field("Rating Description"; Rec."Rating Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rating Description field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Type := Rec.Type::Self;
    end;
}

#pragma implicitwith restore

