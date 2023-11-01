#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80410 "Policy Sub Thematic Areas rev"
{
    CardPageID = "Policy Sub Thematic Area rev";
    Editable = false;
    PageType = List;
    SourceTable = "Policy Sub Thematic Area rev";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Introduction; Rec.Introduction)
                {
                    ApplicationArea = Basic;
                }
                field(Purpose; Rec.Purpose)
                {
                    ApplicationArea = Basic;
                }
                field(Scope; Rec.Scope)
                {
                    ApplicationArea = Basic;
                }
                field(Application; Rec.Application)
                {
                    ApplicationArea = Basic;
                }
                field("Policy statement"; Rec."Policy statement")
                {
                    ApplicationArea = Basic;
                }
                field("Policy Guideline"; Rec."Policy Guideline")
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

