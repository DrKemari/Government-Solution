#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80412 "Policy Sub Thematic Area rev"
{
    PageType = Card;
    SourceTable = "Policy Sub Thematic Area rev";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Introduction; Rec.Introduction)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field(Purpose; Rec.Purpose)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field(Scope; Rec.Scope)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field(Application; Rec.Application)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field("Policy statement"; Rec."Policy statement")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
                field("Policy Guideline"; Rec."Policy Guideline")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

