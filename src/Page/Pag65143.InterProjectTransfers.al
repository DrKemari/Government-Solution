#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 65143 "Inter Project Transfers"
{
    ApplicationArea = Basic;
    CardPageID = "Inter Project Transfer Card";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Inter_Project Transfer Header";
    SourceTableView = where(Posted = const(false));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Posting Description"; Rec."Posting Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting Description field.';
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the External Document No. field.';
                }
                field("Main Funds Bank A/C"; Rec."Main Funds Bank A/C")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Main Funds Bank A/C field.';
                }
                field("Transfer-To Job No"; Rec."Transfer-To Job No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transfer-To Job No field.';
                }
                field("Transfer-To Task No"; Rec."Transfer-To Task No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transfer-To Task No field.';
                }
                field("Transfer-To Income G/L A/C"; Rec."Transfer-To Income G/L A/C")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transfer-To Income G/L A/C field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field("Total Transfer Amount"; Rec."Total Transfer Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Transfer Amount field.';
                }
                field("Total Transfer Amount LCY"; Rec."Total Transfer Amount LCY")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Total Transfer Amount LCY field.';
                }
                field("Transfe-To Directorate"; Rec."Transfe-To Directorate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transfe-To Directorate field.';
                }
                field("Transfe-To Department/Center"; Rec."Transfe-To Department/Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transfe-To Department/Center field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

