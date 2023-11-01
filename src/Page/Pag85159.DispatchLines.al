#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85159 "Dispatch Lines"
{
    PageType = ListPart;
    SourceTable = "Center Dispatch Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Stationery Type"; Rec."Stationery Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Stationery Type field.';
                }
                field("Stationery Name"; Rec."Stationery Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Stationery Name field.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit of Measure field.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field("Serial No From"; Rec."Serial No From")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Serial No From field.';
                }
                field("Serial No. To"; Rec."Serial No. To")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Serial No. To field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

