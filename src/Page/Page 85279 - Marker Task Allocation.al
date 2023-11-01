/// <summary>
/// Page Marker Task Allocation (ID 85279).
/// </summary>
page 85279 "Marker Task Allocation"
{
    PageType = List;
    SourceTable = "Marker Task Allocation";

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
                field(Course; Rec.Course)
                {
                }
                field(Level; Rec.Level)
                {
                }
                field("Paper ID"; Rec."Paper ID")
                {
                }
                field("Paper Name"; Rec."Paper Name")
                {
                    Editable = false;
                }
                field("Examination Sitting"; Rec."Examination Sitting")
                {
                }
                field(Role; Rec.Role)
                {
                }
                field(Present; Rec.Present)
                {
                }
                field(Solution; Rec.Solution)
                {
                }
                field("Dummy A"; Rec."Dummy A")
                {
                }
                field("Dummy B"; Rec."Dummy B")
                {
                }
                field("Dummy C"; Rec."Dummy C")
                {
                }
            }
        }

    }

    actions
    {
    }
}

