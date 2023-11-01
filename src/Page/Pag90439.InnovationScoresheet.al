#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 90439 "Innovation Scoresheet"
{
    PageType = List;
    SourceTable = "Innovation Scoresheet";

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
                field(Category; Rec.Category)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Category field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Weighted Score %"; Rec."Weighted Score %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Weighted Score % field.';
                }
                field("Evaluation Result"; Rec."Evaluation Result")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluation Result field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

