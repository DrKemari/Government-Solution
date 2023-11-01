#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51201 "Accreditation Setup"
{
    PageType = Card;
    SourceTable = "Accreditation Setups";

    layout
    {
        area(content)
        {
            group("Peer Reviewers")
            {
                Caption = 'Peer Reviewers';
                field(Resource; Rec.Resource)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Resource field.';
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
                field("Resources Expense Account"; Rec."Resources Expense Account")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Resources Expense Account field.';
                }
                field("Peer Reviewers Portal Link"; Rec."Peer Reviewers Portal Link")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Peer Reviewers Portal Link field.';
                }
            }
            group("Programme Accreditation")
            {
                field("Programme Accreditation Nos."; Rec."Programme Accreditation Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Programme Accreditation Nos. field.';
                }
                field("Programme Inspection Nos."; Rec."Programme Inspection Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Programme Inspection Nos. field.';
                }
                field("Programme Accreditation Amount"; Rec."Programme Accreditation Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Programme Accreditation Amount field.';
                }
                field("Programme Evaluation Nos."; Rec."Programme Evaluation Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Programme Evaluation Nos. field.';
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
                field("Signatory ID"; Rec."Signatory ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'DCS Signatory ID';
                    ToolTip = 'Specifies the value of the DCS Signatory ID field.';
                }
            }
            group("Insitution Accreditation")
            {
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
                field("Data Sheet Path"; Rec."Data Sheet Path")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Data Sheet Path field.';
                }
                field("Proposal Document Nos."; Rec."Proposal Document Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Proposal Document Nos. field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

