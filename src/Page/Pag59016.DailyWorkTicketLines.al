#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 59016 "Daily Work Ticket Lines"
{
    PageType = ListPart;
    SourceTable = "Daily Work Ticket Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Transport Requisition No"; Rec."Transport Requisition No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transport Requisition No field.';
                }
                field(Commencement; Rec.Commencement)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Commencement field.';
                }
                field(Destination; Rec.Destination)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Destination field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Driver Allocated"; Rec."Driver Allocated")
                {
                    ApplicationArea = Basic;
                    Caption = 'Driver No';
                    ToolTip = 'Specifies the value of the Driver No field.';
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Driver Name field.';
                }
                field("Journey/Route"; Rec."Journey/Route")
                {
                    ApplicationArea = Basic;
                    Caption = 'Details of Journey and Route in full';
                    ToolTip = 'Specifies the value of the Details of Journey and Route in full field.';
                }
                field("Oil Drawn(Litres)"; Rec."Oil Drawn(Litres)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Oil Drawn(Litres) field.';
                }
                field("Fuel Drawn(Litres)"; Rec."Fuel Drawn(Litres)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Fuel Drawn(Litres) field.';
                }
                field("Order No"; Rec."Order No")
                {
                    ApplicationArea = Basic;
                    Caption = 'P.O.L (S 15) Voucher No, L.P.O No or Cash Receipt No';
                    ToolTip = 'Specifies the value of the P.O.L (S 15) Voucher No, L.P.O No or Cash Receipt No field.';
                }
                field("Time out"; Rec."Time out")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time out field.';
                }
                field("Time In"; Rec."Time In")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time In field.';
                }
                field("Opening Odometer Reading"; Rec."Opening Odometer Reading")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Opening Odometer Reading field.';
                }
                field("Closing Odometer Reading"; Rec."Closing Odometer Reading")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Closing Odometer Reading field.';
                }
                field("Total Kilometres"; Rec."Total Kilometres")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Kilometres field.';
                }
                field("Authorized By"; Rec."Authorized By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Authorized By field.';
                }
                field("GOK Officer"; Rec."GOK Officer")
                {
                    ApplicationArea = Basic;
                    Caption = 'Authorized by other GOK Officer';
                    ToolTip = 'Specifies the value of the Authorized by other GOK Officer field.';
                }
                field(Position; Rec.Position)
                {
                    ApplicationArea = Basic;
                    Caption = 'Designation';
                    ToolTip = 'Specifies the value of the Designation field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

