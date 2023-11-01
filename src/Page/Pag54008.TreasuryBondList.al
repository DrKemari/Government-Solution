#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 54008 "Treasury Bond List"
{
    ApplicationArea = Basic;
    CardPageID = "Treasury Bond Card";
    PageType = List;
    SourceTable = "Investment Asset";
    SourceTableView = where("Asset Type"=const("Money Market"),
                            "Investment Type"=const('06'),
                            "Deposit Type"=const(Treasury));
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
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Description 2"; Rec."Description 2")
                {
                    ApplicationArea = Basic;
                }
                field("FDR Number"; Rec."FDR Number")
                {
                    ApplicationArea = Basic;
                }
                field("Investment Type"; Rec."Investment Type")
                {
                    ApplicationArea = Basic;
                }
                field("Deposit Type"; Rec."Deposit Type")
                {
                    ApplicationArea = Basic;
                }
                field("Custodian Code"; Rec."Custodian Code")
                {
                    ApplicationArea = Basic;
                }
                field("Fund Code"; Rec."Fund Code")
                {
                    ApplicationArea = Basic;
                }
                field("Maturity Period"; Rec."Maturity Period")
                {
                    ApplicationArea = Basic;
                    Caption = 'Tenure (Years)';
                }
                field("Investment Date"; Rec."Investment Date")
                {
                    ApplicationArea = Basic;
                }
                field("Maturity Date"; Rec."Maturity Date")
                {
                    ApplicationArea = Basic;
                }
                field("Face Value"; Rec."Face Value")
                {
                    ApplicationArea = Basic;
                }
                field("Acquisition Cost"; Rec."Acquisition Cost")
                {
                    ApplicationArea = Basic;
                }
                field("Current Value"; Rec."Current Value")
                {
                    ApplicationArea = Basic;
                }
                field(Institution; Rec.Institution)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

