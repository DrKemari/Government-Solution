#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 59123 "Fleet Fuel Requisition"
{
    ApplicationArea = Basic;
    PageType = ListPart;
    SourceTable = "Fuel Travel Requisition";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Expense Type"; Rec."Expense Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expense Type field.';
                }
                field("Job No"; Rec."Job No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Job No field.';
                }
                field("Job Name"; Rec."Job Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Job Name field.';
                }
                field("Job Task"; Rec."Job Task")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Job Task field.';
                }
                field("Job Task Name"; Rec."Job Task Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Job Task Name field.';
                }
                field("Requested Amount"; Rec."Requested Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requested Amount field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

