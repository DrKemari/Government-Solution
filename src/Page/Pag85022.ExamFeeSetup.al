#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85022 "Exam Fee Setup"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Resource Price";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the type.';
                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the code.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Work Type Code"; Rec."Work Type Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies which work type the resource applies to. Prices are updated based on this entry.';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the price of one unit of the item or resource. You can enter a price manually or have it entered according to the Price/Profit Calculation field on the related card.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the currency code of the alternate sales price on this line.';
                }
                field("Discount Type"; Rec."Discount Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Discount Type field.';
                }
                field("Discount Value"; Rec."Discount Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Discount Value field.';
                }
                field("Discount Amount"; Rec."Discount Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Discount Amount field.';
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Effective Date field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

