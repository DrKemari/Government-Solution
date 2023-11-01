#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85398 "Marking Center Checklist"
{
    ApplicationArea = Basic;
    CardPageID = "Marker Checklist Card";
    Editable = false;
    PageType = List;
    SourceTable = "Scripts Dispatch Header";
    SourceTableView = where("Approval Status" = filter(<> Released),
                            Posted = const(false),
                            "Document Type" = const("Marking Center Checklist"));
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field(Examination; Rec.Examination)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Examination field.';
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
                field("Marker No"; Rec."Marker No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Marker No field.';
                }
                field("Marker Name"; Rec."Marker Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Marker Name field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control10; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control11; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control12; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control13; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

