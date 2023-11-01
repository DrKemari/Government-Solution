#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80117 "Board Activities"
{
    PageType = List;
    SourceTable = "Board Activities";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("AWP No"; Rec."AWP No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the AWP No field.';
                }
                field("Board Activity Code"; Rec."Board Activity Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'PC Activities';
                    ToolTip = 'Specifies the value of the PC Activities field.';
                }
                field("Board Activity Description"; Rec."Board Activity Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'PC Activity Description';
                    ToolTip = 'Specifies the value of the PC Activity Description field.';
                }
                field("Activity Code"; Rec."Activity Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Activity Code field.';
                }
                field("Activity Description"; Rec."Activity Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Activity Description field.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit of Measure field.';
                }
                field("WT(%)"; Rec."WT(%)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the WT(%) field.';
                }
                field(Target; Rec.Target)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Target field.';
                }
                field("Framework Perspective"; Rec."Framework Perspective")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Framework Perspective field.';
                }
                field("Strategy Framework"; Rec."Strategy Framework")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Strategy Framework field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("PC Sub-Activities")
            {
                ApplicationArea = Basic;
                Image = AllLines;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Board SUb Activities";
                RunPageLink = "Workplan No." = field("AWP No"),
                              "Initiative No." = field("Board Activity Code"),
                              "Activity Id" = field("Activity Code");
                ToolTip = 'Executes the PC Sub-Activities action.';
            }
        }
    }
}

#pragma implicitwith restore

