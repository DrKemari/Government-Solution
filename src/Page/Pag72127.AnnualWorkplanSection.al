#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72127 "Annual Workplan Section"
{
    PageType = ListPart;
    SourceTable = "Annual Workplan Section";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Header No"; Rec."Header No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Header No field.';
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Code field.';
                }
                field("Link Name"; Rec."Link Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Link Name field.';
                }
                field("Start Chainage"; Rec."Start Chainage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Chainage field.';
                }
                field("End Chainage"; Rec."End Chainage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Chainage field.';
                }
                field("Works Category"; Rec."Works Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Works Category field.';
                }
                field("Funding Source"; Rec."Funding Source")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funding Source field.';
                }
                field("Fund Type"; Rec."Fund Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Fund Type field.';
                }
                field("Workplan Cost"; Rec."Workplan Cost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Workplan Cost field.';
                }
                field("Original Contract Sum"; Rec."Original Contract Sum")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Original Contract Sum field.';
                }
                field("Constituency Code"; Rec."Constituency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Constituency Code field.';
                }
                field("Constituency Name"; Rec."Constituency Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Constituency Name field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

