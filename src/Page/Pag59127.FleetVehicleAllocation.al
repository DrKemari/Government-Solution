#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 59127 "Fleet Vehicle Allocation"
{
    ApplicationArea = Basic;
    PageType = ListPart;
    SourceTable = "Fleet Vehicle Allocation";
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Vehicle Type"; Rec."Vehicle Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vehicle Type field.';
                }
                field("Vehicle Req. No"; Rec."Vehicle Req. No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vehicle Req. No field.';
                }
                field(Make; Rec.Make)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Make field.';
                }
                field(Model; Rec.Model)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Model field.';
                }
                field(Capacity; Rec.Capacity)
                {
                    ApplicationArea = Basic;
                    Caption = 'Passenger Capacity';
                    ToolTip = 'Specifies the value of the Passenger Capacity field.';
                }
                field("Work Ticket No"; Rec."Work Ticket No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Work Ticket No field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

