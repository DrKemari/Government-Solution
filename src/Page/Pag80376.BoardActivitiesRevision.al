#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80376 "Board Activities Revision"
{
    PageType = List;
    SourceTable = "Board Activities Revision";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Activity Code"; Rec."Activity Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Activity Code field.';
                }
                field("Activity Description"; Rec."Activity Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Activity Description field.';
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Unit of Measure field.';
                }
                field("WT(%)"; Rec."WT(%)")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the WT(%) field.';
                }
                field(Target; Rec.Target)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Target field.';
                }
                field("Strategy Framework"; Rec."Strategy Framework")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Strategy Framework field.';
                }
                field("Framework Perspective"; Rec."Framework Perspective")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Framework Perspective field.';
                }
                field("New Activity Code"; Rec."New Activity Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Activity Code field.';
                }
                field("New Activity Description"; Rec."New Activity Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Activity Description field.';
                }
                field("New Unit of Measure"; Rec."New Unit of Measure")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Unit of Measure field.';
                }
                field("New WT(%)"; Rec."New WT(%)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New WT(%) field.';
                }
                field("New Target"; Rec."New Target")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Target field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action("Board Sub-Activities")
            {
                ApplicationArea = Basic;
                Image = AllLines;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Board SUb Activities";
                RunPageLink = "Workplan No." = field("AWP No"),
                              "Initiative No." = field("Board Activity Code"),
                              "Activity Id" = field("Activity Code");
                ToolTip = 'Executes the Board Sub-Activities action.';
            }
        }
    }
}

#pragma implicitwith restore

