#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85425 "Moderator Setter Analysis"
{
    PageType = ListPart;
    SourceTable = "Setter Marks Per Question";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Question No."; Rec."Question No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Question No. field.';
                }
                field("Setter Code"; Rec."Setter Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Setter Code field.';
                }
                field("Setter Name"; Rec."Setter Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Setter Name field.';
                }
                field("Marks Awarded"; Rec."Marks Awarded")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Marks Awarded field.';
                }
                field(Contributed; Rec.Contributed)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contributed field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

