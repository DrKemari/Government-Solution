#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51299 "Verification Sub-Components"
{
    PageType = List;
    SourceTable = "Application Response";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = Basic;
                }
                field("Accreditation Question"; Rec."Accreditation Question")
                {
                    ApplicationArea = Basic;
                }
                field("Question Type"; Rec."Question Type")
                {
                    ApplicationArea = Basic;
                }
                field("Accreditation Answers"; Rec."Accreditation Answers")
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

