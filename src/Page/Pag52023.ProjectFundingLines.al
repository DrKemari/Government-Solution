#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 52023 "Project Funding Lines"
{
    PageType = ListPart;
    SourceTable = "Contract Funding Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Job No"; Rec."Job No")
                {
                    ApplicationArea = Basic;
                }
                field("Approved Funding Limit"; Rec."Approved Funding Limit")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Year Code"; Rec."Year Code")
                {
                    ApplicationArea = Basic;
                }
                field("Budget Start Date"; Rec."Budget Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Budget End Date"; Rec."Budget End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Funding Currency"; Rec."Funding Currency")
                {
                    ApplicationArea = Basic;
                }
                field("Funding Customer"; Rec."Funding Customer")
                {
                    ApplicationArea = Basic;
                }
                field("Job Status"; Rec."Job Status")
                {
                    ApplicationArea = Basic;
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                }
                field("Project Contract No."; Rec."Project Contract No.")
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

