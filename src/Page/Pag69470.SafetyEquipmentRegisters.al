#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69470 "Safety Equipment Registers"
{
    ApplicationArea = Basic;
    CardPageID = "Safety Equipment Register";
    PageType = List;
    SourceTable = "Safety Equipment Register";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Equipment ID"; Rec."Equipment ID")
                {
                    ApplicationArea = Basic;
                }
                field(SubType; Rec.SubType)
                {
                    ApplicationArea = Basic;
                }
                field("SubType No."; Rec."SubType No.")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Safety Equipment Category"; Rec."Safety Equipment Category")
                {
                    ApplicationArea = Basic;
                }
                field("Safety Notes/Comments"; Rec."Safety Notes/Comments")
                {
                    ApplicationArea = Basic;
                }
                field("FA Location Code"; Rec."FA Location Code")
                {
                    ApplicationArea = Basic;
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ApplicationArea = Basic;
                }
                field("Inventory Quantity"; Rec."Inventory Quantity")
                {
                    ApplicationArea = Basic;
                }
                field("Fixed Asset/Resource Quantity"; Rec."Fixed Asset/Resource Quantity")
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

