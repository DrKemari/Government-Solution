/// <summary>
/// Page Resource Role Allocation (ID 85505).
/// </summary>
page 85535 "Resource Role Allocation"
{
    PageType = List;
    SourceTable = "Resource Role Allocation";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Resource No"; Rec."Resource No")
                {
                }
                field(Name; Rec.Name)
                {
                    Editable = false;
                }
                field(Role; Rec.Role)
                {
                }
                field("Moderator Type"; Rec."Moderator Type")
                {
                }
                field(Blocked; Rec.Blocked)
                {
                }
            }
        }

    }

    actions
    {
    }
}

