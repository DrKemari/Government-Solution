#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69057 "Employee Transfers History"
{
    ApplicationArea = Basic;
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Employee Transfers";
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("Original Station"; Rec."Original Station")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Original Station field.';
                }
                field("New Station"; Rec."New Station")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Station field.';
                }
                field("Transfer Date"; Rec."Transfer Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transfer Date field.';
                }
                field("Transfered By"; Rec."Transfered By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transfered By field.';
                }
                field("To Hardship Area?"; Rec."To Hardship Area?")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the To Hardship Area? field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

