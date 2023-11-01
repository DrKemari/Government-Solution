#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
/// <summary>
/// Page Resource Role Allocation (ID 85505).
/// </summary>
Page 85505 "Resource Role Allocation-"
{
    PageType = List;
    SourceTable = "Resource Role Allocation";
    SourceTableView = where(Blocked = const(false));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(ResourceNo; Rec."Resource No")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Role; Rec.Role)
                {
                    ApplicationArea = Basic;
                }
                field(ModeratorType; Rec."Moderator Type")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control10; Outlook)
            {
            }
            systempart(Control11; Notes)
            {
            }
            systempart(Control12; MyNotes)
            {
            }
            systempart(Control13; Links)
            {
            }
        }
    }

    actions
    {
    }
}
