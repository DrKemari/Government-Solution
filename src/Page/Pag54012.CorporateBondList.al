#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 54012 "Corporate Bond List"
{
    ApplicationArea = Basic;
    CardPageID = "Corporate Bond Card";
    PageType = List;
    SourceTable = "Investment Asset";
    SourceTableView = where("Asset Type" = const("Money Market"),
                            "Investment Type" = const('06'),
                            "Deposit Type" = const(Corporate));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Description 2"; Rec."Description 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description 2 field.';
                }
                field("Maturity Period"; Rec."Maturity Period")
                {
                    ApplicationArea = Basic;
                    Caption = 'Tenure (Years)';
                    ToolTip = 'Specifies the value of the Tenure (Years) field.';
                }
                field("Investment Date"; Rec."Investment Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investment Date field.';
                }
                field("Fund Code"; Rec."Fund Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Fund Code field.';
                }
                field("Custodian Code"; Rec."Custodian Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Custodian Code field.';
                }
                field("Maturity Date"; Rec."Maturity Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maturity Date field.';
                }
                field("Face Value"; Rec."Face Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Face Value field.';
                }
                field("Acquisition Cost"; Rec."Acquisition Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Acquisition Cost field.';
                }
                field("Current Value"; Rec."Current Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Value field.';
                }
                field("Accrued Interest"; Rec."Accrued Interest")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Accrued Interest field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

