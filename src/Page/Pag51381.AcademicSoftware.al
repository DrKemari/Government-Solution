#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 51381 "Academic Software"
{
    PageType = List;
    SourceTable = "ICT Equipment";
    SourceTableView = where(Category = filter("Academic software"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Academic ICT Type"; Rec."Academic ICT Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Academic ICT Type field.';
                }
                field("Academic Type Name"; Rec."Academic Type Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Academic Type Name field.';
                }
                field("Type Available"; Rec."Type Available")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type Available field.';
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

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Category := Rec.Category::"Academic software"
    end;
}

