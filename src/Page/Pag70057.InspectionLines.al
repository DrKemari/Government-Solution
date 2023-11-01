#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 70057 "Inspection Lines"
{
    PageType = ListPart;
    SourceTable = "Inspection Lines1";

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit of Measure field.';
                }
                field("Quantity Ordered"; Rec."Quantity Ordered")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quantity Ordered field.';
                }
                field("Quantity Received"; Rec."Quantity Received")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quantity Received field.';
                }
                field("Inspection Decision"; Rec."Inspection Decision")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inspection Decision field.';
                }
                field("Reasons for Rejection"; Rec."Reasons for Rejection")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reasons for Rejection field.';
                }
                field("Rejected Quantity"; Rec."Rejected Quantity")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rejected Quantity field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

