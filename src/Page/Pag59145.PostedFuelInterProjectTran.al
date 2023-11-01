#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 59145 "Posted Fuel Inter Project Tran"
{
    CardPageID = "Inter Project Transfer Card";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Inter_Project Transfer Header";
    SourceTableView = where(Posted=const(true));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Posting Description"; Rec."Posting Description")
                {
                    ApplicationArea = Basic;
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Main Funds Bank A/C"; Rec."Main Funds Bank A/C")
                {
                    ApplicationArea = Basic;
                }
                field("Transfer-To Job No"; Rec."Transfer-To Job No")
                {
                    ApplicationArea = Basic;
                }
                field("Transfer-To Task No"; Rec."Transfer-To Task No")
                {
                    ApplicationArea = Basic;
                }
                field("Transfer-To Income G/L A/C"; Rec."Transfer-To Income G/L A/C")
                {
                    ApplicationArea = Basic;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field("Total Transfer Amount"; Rec."Total Transfer Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Total Transfer Amount LCY"; Rec."Total Transfer Amount LCY")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Transfe-To Directorate"; Rec."Transfe-To Directorate")
                {
                    ApplicationArea = Basic;
                }
                field("Transfe-To Department/Center"; Rec."Transfe-To Department/Center")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

