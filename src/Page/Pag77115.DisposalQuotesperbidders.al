#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 77115 "Disposal Quotes per bidders"
{
    PageType = List;
    SourceTable = "Disposal Bids Per Line 1";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Disposal No"; Rec."Disposal No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disposal No field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
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
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field(Award; Rec.Award)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Award field.';
                }
                field(Customer; Rec.Customer)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Customer field.';
                }
                field("Quoted Amount"; Rec."Quoted Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quoted Amount field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

