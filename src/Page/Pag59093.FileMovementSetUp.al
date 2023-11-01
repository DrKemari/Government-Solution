#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 59093 "File Movement SetUp"
{
    ApplicationArea = Basic;
    CardPageID = "File Location SetUp Card";
    PageType = Card;
    SourceTable = "File Locations Setup";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            group(Group)
            {
                Caption = 'General';
                field("Custodian Code"; Rec."Custodian Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Custodian Code field.';
                }
                field("File Disposal No. Series"; Rec."File Disposal No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the File Disposal No. Series field.';
                }
                field("Inward Mail RegisterNo.Series"; Rec."Inward Mail RegisterNo.Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inward Mail RegisterNo.Series field.';
                }
                field("File No. Series"; Rec."File No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the File No. Series field.';
                }
                field("File Movement No. Series"; Rec."File Movement No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the File Movement No. Series field.';
                }
                field("Outward Mail Register Nos"; Rec."Outward Mail Register Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Outward Mail Register Nos field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

