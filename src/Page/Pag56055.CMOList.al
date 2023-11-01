#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 56055 "CMO List"
{
    ApplicationArea = Basic;
    CardPageID = "CMO Registration";
    PageType = List;
    SourceTable = "CMO Registration";
    SourceTableView = where(Type = filter(Registration));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Creation Date field.';
                }
                field("Creation Time"; Rec."Creation Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Creation Time field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Name of society"; Rec."Name of society")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name of society field.';
                }
                field("Address of society"; Rec."Address of society")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address of society field.';
                }
                field("Physical address"; Rec."Physical address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Physical address field.';
                }
                field(Class; Rec.Class)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Class field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

