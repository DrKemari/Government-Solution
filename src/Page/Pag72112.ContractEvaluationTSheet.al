#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72112 "Contract Evaluation T Sheet"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Contract Evaluation Tally Shee";
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Project No"; Rec."Project No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project No field.';
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Project Title"; Rec."Project Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Title field.';
                }
                field("Road Authority Code"; Rec."Road Authority Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Authority Code field.';
                }
                field("Road Authority Name"; Rec."Road Authority Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Authority Name field.';
                }
                field("Contractor No"; Rec."Contractor No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor No field.';
                }
                field("Contractor Name"; Rec."Contractor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor Name field.';
                }
                field("Date of Commencement"; Rec."Date of Commencement")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Commencement field.';
                }
                field("No. of elapsed months"; Rec."No. of elapsed months")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of elapsed months field.';
                }
                field("Project Manager Code"; Rec."Project Manager Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Manager Code field.';
                }
                field("Project Manager Name"; Rec."Project Manager Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Manager Name field.';
                }
                field("Road Manager Code"; Rec."Road Manager Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Manager Code field.';
                }
                field("Road Manager Name"; Rec."Road Manager Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Manager Name field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

