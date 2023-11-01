#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72115 "Montly Statement List"
{
    CardPageID = "Monthly Statement Header";
    PageType = List;
    SourceTable = "Statment For Payment Account";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Contract No"; Rec."Contract No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract No field.';
                }
                field("Contract Name"; Rec."Contract Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Name field.';
                }
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Contractor No"; Rec."Contractor No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor No field.';
                }
                field("Contractor Name"; Rec."Contractor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor Name field.';
                }
                field("Certificate No"; Rec."Certificate No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Certificate No field.';
                }
                field("Valuation As At"; Rec."Valuation As At")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Valuation As At field.';
                }
                field("Region Code"; Rec."Region Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region Code field.';
                }
                field("Region Name"; Rec."Region Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region Name field.';
                }
                field("Financial Year"; Rec."Financial Year")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Financial Year field.';
                }
                field("Administrative Boundary"; Rec."Administrative Boundary")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Administrative Boundary field.';
                }
                field(Month; Rec.Month)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Month field.';
                }
                field("Submitted By"; Rec."Submitted By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Submitted By field.';
                }
                field("Checked By"; Rec."Checked By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Checked By field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

