#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69020 "Earnings List"
{
    Editable = false;
    PageType = List;
    SourceTable = EarningsX;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Pay Type"; Rec."Pay Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pay Type field.';
                }
                field(Taxable; Rec.Taxable)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Taxable field.';
                }
                field("Calculation Method"; Rec."Calculation Method")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Calculation Method field.';
                }
                field("Flat Amount"; Rec."Flat Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Flat Amount field.';
                }
                field(Percentage; Rec.Percentage)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Percentage field.';
                }
                field("Total Amount"; Rec."Total Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Amount field.';
                }
                field("Reduces Tax"; Rec."Reduces Tax")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reduces Tax field.';
                }
                field("Show on Report"; Rec."Show on Report")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Show on Report field.';
                }
                field("Earning Type"; Rec."Earning Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Earning Type field.';
                }
                field("Applies to All"; Rec."Applies to All")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Applies to All field.';
                }
                field("Show on Master Roll"; Rec."Show on Master Roll")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Show on Master Roll field.';
                }
                field(Block; Rec.Block)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Block field.';
                }
                field("Basic Pay Arrears"; Rec."Basic Pay Arrears")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Basic Pay Arrears field.';
                }
                field("Negative Earning"; Rec."Negative Earning")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Negative Earning field.';
                }
                field("Show No.of Days"; Rec."Show No.of Days")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Show No.of Days field.';
                }
                field("KRA Classification"; Rec."KRA Classification")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the KRA Classification field.';
                }
                field("Fluctuation Type"; Rec."Fluctuation Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Fluctuation Type field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000023; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000024; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000025; Links)
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

