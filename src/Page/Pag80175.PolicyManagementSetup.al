#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80175 "Policy Management Setup"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "Policy Management Setup";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Internal Policy Development"; Rec."Internal Policy Development")
                {
                    ApplicationArea = Basic;
                }
                field("Internal Policy No. Series"; Rec."Internal Policy No. Series")
                {
                    ApplicationArea = Basic;
                }
                field("External Policy No. Series"; Rec."External Policy No. Series")
                {
                    ApplicationArea = Basic;
                }
                field("Policy Revision No. Series"; Rec."Policy Revision No. Series")
                {
                    ApplicationArea = Basic;
                }
                field("Policy Attestation No. Series"; Rec."Policy Attestation No. Series")
                {
                    ApplicationArea = Basic;
                    Caption = 'Policy circulation No. Series';
                }
                field("Policy Compliance Audit Nos"; Rec."Policy Compliance Audit Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Enable Email Alerts"; Rec."Enable Email Alerts")
                {
                    ApplicationArea = Basic;
                }
                field("Notification Email"; Rec."Notification Email")
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

