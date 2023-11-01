#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
/// <summary>
/// Page Accreditation Setu (ID 51352).
/// </summary>
Page 51352 "Accreditation Setu"
{
    ApplicationArea = Basic;
    Caption = 'Accreditation Setup';
    PageType = Card;
    SourceTable = "Accreditation Setups";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(Resource; Rec.Resource)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Resource field.';
                }
                field("Inst. Onboarding Nos."; Rec."Inst. Onboarding Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inst. Onboarding Nos. field.';
                }
                field("Inst Accreditation Nos."; Rec."Inst Accreditation Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inst Accreditation Nos. field.';
                }
                field("Customer Posting Group"; Rec."Customer Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Customer Posting Group field.';
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gen. Bus. Posting Group field.';
                }
                field("Proposal Document Nos."; Rec."Proposal Document Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Proposal Document Nos. field.';
                }
                field("Programme Accreditation Nos."; Rec."Programme Accreditation Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Programme Accreditation Nos. field.';
                }
                field("Programme Accreditation Amount"; Rec."Programme Accreditation Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Programme Accreditation Amount field.';
                }
                field("Self Evaluation No."; Rec."Self Evaluation No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Self Evaluation No. field.';
                }
                field("Programme Evaluation Nos."; Rec."Programme Evaluation Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Programme Evaluation Nos. field.';
                }
                field("Resources Expense Account"; Rec."Resources Expense Account")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Resources Expense Account field.';
                }
                field("Programme Inspection Nos."; Rec."Programme Inspection Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Programme Inspection Nos. field.';
                }
                field("Data Sheet Path"; Rec."Data Sheet Path")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Data Sheet Path field.';
                }
                field("Completeness Voucher  Nos."; Rec."Completeness Voucher  Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Completeness Voucher  Nos. field.';
                }
                field("Programme Closure Nos."; Rec."Programme Closure Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Programme Closure Nos. field.';
                }
                field("Resource Allocation Nos."; Rec."Resource Allocation Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Resource Allocation Nos. field.';
                }
                field("Resource Ammendment No.s"; Rec."Resource Ammendment No.s")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Resource Ammendment No.s field.';
                }
                field("HOD PA Emaill Address"; Rec."HOD PA Emaill Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the HOD PA Emaill Address field.';
                }
                field("DCS Accreditatio Email Address"; Rec."DCS Accreditatio Email Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the DCS Accreditatio Email Address field.';
                }
                field("HOD Finance Email Address"; Rec."HOD Finance Email Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the HOD Finance Email Address field.';
                }
                field("Programme Version No.s"; Rec."Programme Version No.s")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Programme Version No.s field.';
                }
                field("Signatory ID"; Rec."Signatory ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Signatory ID field.';
                }
                field("Peer Reviewers Portal Link"; Rec."Peer Reviewers Portal Link")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Peer Reviewers Portal Link field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

