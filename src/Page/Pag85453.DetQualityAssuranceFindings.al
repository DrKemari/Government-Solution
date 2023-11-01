#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85453 "Det Quality Assurance Findings"
{
    PageType = ListPart;
    SourceTable = "Audit Assurance Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Examination; Rec.Examination)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Examination field.';
                }
                field("Examination Name"; Rec."Examination Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Examination Name field.';
                }
                field("Situation Found"; Rec."Situation Found")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Situation Found field.';
                }
                field("Evidence and Analysis"; Rec."Evidence and Analysis")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evidence and Analysis field.';
                }
                field(Causes; Rec.Causes)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Causes field.';
                }
                field(Effect; Rec.Effect)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Effect field.';
                }
                field(Recommendation; Rec.Recommendation)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recommendation field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

