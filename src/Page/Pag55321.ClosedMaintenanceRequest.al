#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 55321 "Closed  Maintenance Request"
{
    ApplicationArea = Basic;
    CardPageID = "Maintenance Request Card";
    Editable = false;
    PageType = List;
    SourceTable = "Maintenance Header";
    SourceTableView = where("Document Status" = const(Closed));
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field(Created; Rec.Created)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created field.';
                }
                field("Fixed Asset No"; Rec."Fixed Asset No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Fixed Asset No field.';
                }
                field("Maintenance Type"; Rec."Maintenance Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maintenance Type field.';
                }
                field("Maintained On"; Rec."Maintained On")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maintained On field.';
                }
                field("Maintained By"; Rec."Maintained By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maintained By field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
                field("Next Maintenance Date"; Rec."Next Maintenance Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Next Maintenance Date field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control14; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control15; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control16; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control17; Links)
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

