#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 90440 "Idea Response Objectives"
{
    PageType = List;
    SourceTable = "Innovation Solicitation Line";
    SourceTableView = where("Record Type" = const(Objective));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Record Type"; Rec."Record Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Record Type field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Goals and objectives';
                    ToolTip = 'Specifies the value of the Goals and objectives field.';
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

