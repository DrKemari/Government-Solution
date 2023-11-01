#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80212 "Compliance Audit Card"
{
    PageType = Card;
    SourceTable = "Compliance Audit";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Policy No"; Rec."Policy No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Policy No field.';
                }
                field("Policy Name"; Rec."Policy Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Policy Name field.';
                }
                field("Policy Overview"; Rec."Policy Overview")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Policy Overview field.';
                }
                field("Policy Goal"; Rec."Policy Goal")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Policy Goal field.';
                }
                field("Policy Purpose"; Rec."Policy Purpose")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Policy Purpose field.';
                }
                field("Policy Rationale"; Rec."Policy Rationale")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Policy Rationale field.';
                }
                field("Policy Scope"; Rec."Policy Scope")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Policy Scope field.';
                }
                field("Primary Directorate"; Rec."Primary Directorate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Directorate field.';
                }
                field("Primary Department"; Rec."Primary Department")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Department field.';
                }
                field("Policy Drafting Date"; Rec."Policy Drafting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Policy Drafting Date field.';
                }
                field("Policy Approval Date"; Rec."Policy Approval Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Policy Approval Date field.';
                }
                field("Policy Effective Date"; Rec."Policy Effective Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Policy Effective Date field.';
                }
                field("Audit Criteria Template ID"; Rec."Audit Criteria Template ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Criteria Template ID field.';
                }
                field("Reviewer User ID"; Rec."Reviewer User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reviewer User ID field.';
                }
                field("Reviewer Name"; Rec."Reviewer Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reviewer Name field.';
                }
                field("Review Scope"; Rec."Review Scope")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Review Scope field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

