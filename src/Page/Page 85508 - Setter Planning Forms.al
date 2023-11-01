page 85508 "Setter Planning Forms"
{
    CardPageID = "Setter Planning Form";
    Editable = false;
    PageType = List;
    SourceTable = "Setter Header";
    SourceTableView = WHERE("Document Type" = CONST("Setter Planning Form"), Posted = CONST(false));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                }
                field("Examination Sitting"; Rec."Examination Sitting")
                {
                }
                field("Examiner Code"; Rec."Examiner Code")
                {
                }
                field("Examiner Name"; Rec."Examiner Name")
                {
                }
                field(Examination; Rec.Examination)
                {
                }
                field(Level; Rec.Level)
                {
                }
                field("Paper Code"; Rec."Paper Code")
                {
                }
                field("Paper Name"; Rec."Paper Name")
                {
                }
                field(Submitted; Rec.Submitted)
                {
                }
                field("Submitted On"; Rec."Submitted On")
                {
                }
            }
        }

    }

    actions
    {
    }
}

