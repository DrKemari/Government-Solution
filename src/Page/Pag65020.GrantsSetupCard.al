#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 65020 "Grants Setup Card"
{
    ApplicationArea = Basic;
    Caption = 'Grants Management Setup';
    PageType = Card;
    SourceTable = "Grants Setup";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Primary Role"; Rec."Primary Role")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Role field.';
                }
                field("Email Notification Path"; Rec."Email Notification Path")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email Notification Path field.';
                }
            }
            group("Number Series")
            {
                field("Research Iinfrastructure Nos"; Rec."Research Iinfrastructure Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Research Iinfrastructure Nos field.';
                }
                field("Research Output Nos"; Rec."Research Output Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Research Output Nos field.';
                }
                field("Researcher Nos"; Rec."Researcher Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Researcher Nos field.';
                }
                field("Grantor Nos"; Rec."Grantor Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grantor Nos field.';
                }
                field("Funding Opportunity Nos"; Rec."Funding Opportunity Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funding Opportunity Nos field.';
                }
                field("Grant Proposal Nos"; Rec."Grant Proposal Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grant Proposal Nos field.';
                }
                field("Grant Admin Nos"; Rec."Grant Admin Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grant Admin Nos field.';
                }
                field("Project Admin Nos"; Rec."Project Admin Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Admin Nos field.';
                }
                field("Research Project Nos"; Rec."Research Project Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Research Project Nos field.';
                }
                field("Project Contract Nos"; Rec."Project Contract Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Contract Nos field.';
                }
                field("IFT Nos"; Rec."IFT Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the IFT Nos field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

