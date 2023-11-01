#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 52038 "Road Project Funding Lines"
{
    PageType = ListPart;
    SourceTable = "Roads Funding Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Project No."; Rec."Project No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Year Code"; Rec."Year Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Budget Start Date"; Rec."Budget Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Budget End Date"; Rec."Budget End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Funding Customer"; Rec."Funding Customer")
                {
                    ApplicationArea = Basic;
                }
                field("Funding Currency"; Rec."Funding Currency")
                {
                    ApplicationArea = Basic;
                }
                field("Approved Funding Limit"; Rec."Approved Funding Limit")
                {
                    ApplicationArea = Basic;
                }
                field("Job No"; Rec."Job No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Job Status"; Rec."Job Status")
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

