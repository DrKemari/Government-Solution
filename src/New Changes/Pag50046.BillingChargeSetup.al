page 50046 "Billing Charge Setup"
{
    Caption = 'Billing Charge Setup';
    PageType = List;
    SourceTable = "Billing Charge Table";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(ApplicationFee; Rec.ApplicationFee)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the ApplicationFee field.';
                }
                field(Charges; Rec.Charges)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Charges field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Display; Rec.Display)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Display field.';
                }
                field("G/L Account Name"; Rec."G/L Account Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the G/L Account Name field.';
                }
                field("Income G/L Account"; Rec."Income G/L Account")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Income G/L Account field.';
                }
                field(PenaltyRate; Rec.PenaltyRate)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the PenaltyRate field.';
                }
                field("Service Code"; Rec."Service Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Service Code field.';
                }
                field("Service Type"; Rec."Service Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Service Type field.';
                }
                field("Service Type Description"; Rec."Service Type Description")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Service Type Description field.';
                }
            }
        }
    }
}
