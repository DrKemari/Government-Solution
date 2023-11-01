#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 55025 "Board Minutes"
{
    PageType = List;
    SourceTable = "Board minutes";
    SourceTableView = where("Register ID" = const('YES'));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Register ID"; Rec."Register ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Register ID field.';
                }
                field("Agenda Code"; Rec."Agenda Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Agenda Code field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Item Discussed"; Rec."Item Discussed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Item Discussed field.';
                }
                field("Summary Notes"; Rec."Summary Notes")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Summary Notes field.';
                }
                field("Referenced Section of Tender"; Rec."Referenced Section of Tender")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Referenced Section of Tender Document field.';
                }
                field("Referenced Clause of Tender"; Rec."Referenced Clause of Tender")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Referenced Clause of Tender Document field.';
                }
                field("Board Meeting"; Rec."Board Meeting")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                    ToolTip = 'Specifies the value of the Board Meeting field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

