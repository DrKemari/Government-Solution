#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 75149 "Bid Equipment Compliance"
{
    PageType = List;
    SourceTable = "Bid Equipment Compliance";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No. field.';
                }
                field("Equipment Type Code"; Rec."Equipment Type Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Equipment Type Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Total No. of Equipment"; Rec."Total No. of Equipment")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total No. of Equipment field.';
                }
                field("Requirement Type"; Rec."Requirement Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requirement Type field.';
                }
                field("Minimum Required Quantity"; Rec."Minimum Required Quantity")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Minimum Required Quantity field.';
                }
                field("Actual Owned Quantity"; Rec."Actual Owned Quantity")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Owned Quantity field.';
                }
                field("Actual Leased Equipment"; Rec."Actual Leased Equipment")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Leased Equipment field.';
                }
                field("Total Owned/Leased Quantity"; Rec."Total Owned/Leased Quantity")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Owned/Leased Quantity field.';
                }
                field("Compliance Check"; Rec."Compliance Check")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Compliance Check field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

