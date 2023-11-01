#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85409 "Setter Submitted Papers"
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
                }
                field("Examination Name"; Rec."Examination Name")
                {
                    ApplicationArea = Basic;
                }
                field(Level; Rec.Level)
                {
                    ApplicationArea = Basic;
                }
                field("Paper Code"; Rec."Paper Code")
                {
                    ApplicationArea = Basic;
                }
                field("Paper Name"; Rec."Paper Name")
                {
                    ApplicationArea = Basic;
                }
                field("Question No."; Rec."Question No.")
                {
                    ApplicationArea = Basic;
                }
                field("Topic Code"; Rec."Topic Code")
                {
                    ApplicationArea = Basic;
                }
                field("Topic Name"; Rec."Topic Name")
                {
                    ApplicationArea = Basic;
                }
                field("Question Paper"; Rec."Question Paper")
                {
                    ApplicationArea = Basic;
                }
                field("Suggested Solution"; Rec."Suggested Solution")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

