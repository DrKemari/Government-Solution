#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 54050 "Investment Asset List"
{
    PageType = List;
    SourceTable = "Investment Asset";

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
                field("FA Posting Group"; Rec."FA Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the FA Posting Group field.';
                }
                field("Mortgage Type"; Rec."Mortgage Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mortgage Type field.';
                }
                field("Mortgage Term"; Rec."Mortgage Term")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mortgage Term field.';
                }
                field("Expected Repayment"; Rec."Expected Repayment")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expected Repayment field.';
                }
                field("Investment Type"; Rec."Investment Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investment Type field.';
                }
                field("Interest Frequency Period"; Rec."Interest Frequency Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interest Frequency Period field.';
                }
                field("Maturity Date"; Rec."Maturity Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maturity Date field.';
                }
                field("Investment Date"; Rec."Investment Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investment Date field.';
                }
                field("Maturity Period"; Rec."Maturity Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maturity Period field.';
                }
                field("No. Of Interest Periods"; Rec."No. Of Interest Periods")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Of Interest Periods field.';
                }
                field("Bonus Frequency Period"; Rec."Bonus Frequency Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bonus Frequency Period field.';
                }
                field("Investment Type Name"; Rec."Investment Type Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Investment Type Name field.';
                }
                field("No.Of Units"; Rec."No.Of Units")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No.Of Units field.';
                }
                field("Asset Type"; Rec."Asset Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Asset Type field.';
                }
                field("Interest Rate Type"; Rec."Interest Rate Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interest Rate Type field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

