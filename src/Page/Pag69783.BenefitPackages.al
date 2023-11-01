#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69783 "Benefit Packages"
{
    ApplicationArea = Basic;
    CardPageID = "Benefit Package";
    PageType = List;
    SourceTable = "Benefit Package";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Package ID"; Rec."Package ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Package ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Primary Objective"; Rec."Primary Objective")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Objective field.';
                }
                field("Benefit Program ID"; Rec."Benefit Program ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Benefit Program ID field.';
                }
                field("Benefit Category"; Rec."Benefit Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Benefit Category field.';
                }
                field("Beneficiary Type"; Rec."Beneficiary Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Beneficiary Type field.';
                }
                field("Statutory Requirement"; Rec."Statutory Requirement")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Statutory Requirement field.';
                }
                field("Applicable to all Staff"; Rec."Applicable to all Staff")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Applicable to all Staff field.';
                }
                field("Applicable to Retired Staff"; Rec."Applicable to Retired Staff")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Applicable to Retired Staff field.';
                }
                field("Enrollment Type"; Rec."Enrollment Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Enrollment Type field.';
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Effective Date field.';
                }
                field("Company Policy ID"; Rec."Company Policy ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Company Policy ID field.';
                }
                field("Renewal Frequency"; Rec."Renewal Frequency")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Renewal Frequency field.';
                }
                field("No. of Renewals"; Rec."No. of Renewals")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Renewals field.';
                }
                field("Last Renewal Date"; Rec."Last Renewal Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Renewal Date field.';
                }
                field("Min Eligibe Age(Yrs)"; Rec."Min Eligibe Age(Yrs)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Min Eligibe Age(Yrs) field.';
                }
                field("Max Eligibe Age(Yrs)"; Rec."Max Eligibe Age(Yrs)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Max Eligibe Age(Yrs) field.';
                }
                field("Min Length of Service(Yrs)"; Rec."Min Length of Service(Yrs)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Min Length of Service(Yrs) field.';
                }
                field("Max Waiting Period for Enroll"; Rec."Max Waiting Period for Enroll")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Max Waiting Period for Enroll field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control24; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control25; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control26; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control27; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

