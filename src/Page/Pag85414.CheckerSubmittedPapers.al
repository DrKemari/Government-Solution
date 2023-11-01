#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85414 "Checker Submitted Papers"
{
    PageType = ListPart;
    SourceTable = "Disclosure Paper Submitted";

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
                field(Level; Rec.Level)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Level field.';
                }
                field("Paper Code"; Rec."Paper Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Paper Code field.';
                }
                field("Paper Name"; Rec."Paper Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Paper Name field.';
                }
                field("Question No."; Rec."Question No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Question No. field.';
                }
                field("Topic Code"; Rec."Topic Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Topic Code field.';
                }
                field("Topic Name"; Rec."Topic Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Topic Name field.';
                }
                field("Question Paper"; Rec."Question Paper")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Question Paper field.';
                }
                field("Suggested Solution"; Rec."Suggested Solution")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Suggested Solution field.';
                }
                field("Completeness Status"; Rec."Completeness Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Completeness Status field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

