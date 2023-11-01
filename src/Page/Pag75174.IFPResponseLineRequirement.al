#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 75174 "IFP Response Line Requirement"
{
    PageType = List;
    SourceTable = "IFP Response Line Requirement";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Procurement Category"; Rec."Procurement Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Procurement Category field.';
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field("Requirement Code"; Rec."Requirement Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requirement Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Requirement Type"; Rec."Requirement Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requirement Type field.';
                }
                field("RFI Document No."; Rec."RFI Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the RFI Document No. field.';
                }
                field("Meets Requirement"; Rec."Meets Requirement")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Meets Requirement field.';
                }
                field("Proof of compliance summary"; Rec."Proof of compliance summary")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Proof of compliance summary field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

