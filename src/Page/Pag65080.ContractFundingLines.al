#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 65080 "Contract Funding Lines"
{
    PageType = ListPart;
    SourceTable = "Contract Funding Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Project Contract No."; Rec."Project Contract No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Project Contract No. field.';
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field("Year Code"; Rec."Year Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Year Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Budget Start Date"; Rec."Budget Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget Start Date field.';
                }
                field("Budget End Date"; Rec."Budget End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget End Date field.';
                }
                field("Funding Customer"; Rec."Funding Customer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funding Customer field.';
                }
                field("Grant ID"; Rec."Grant ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Grant ID field.';
                }
                field("Funding Currency"; Rec."Funding Currency")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funding Currency field.';
                }
                field("Approved Funding Limit"; Rec."Approved Funding Limit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approved Funding Limit field.';
                }
                field("Job No"; Rec."Job No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Job No field.';
                }
                field("Job Status"; Rec."Job Status")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Job Status field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

