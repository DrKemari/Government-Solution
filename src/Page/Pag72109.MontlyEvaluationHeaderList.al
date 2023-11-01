#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72109 "Montly Evaluation HeaderList"
{
    ApplicationArea = Basic;
    CardPageID = "Montly Evaluation Header";
    PageType = List;
    SourceTable = "Montly Evaluation Header";
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
                field("Date Checked"; Rec."Date Checked")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Checked field.';
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
                field("No. Of Elapsed Months"; Rec."No. Of Elapsed Months")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Of Elapsed Months field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

