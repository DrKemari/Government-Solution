#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72097 "Detail Self Inspection Results"
{
    ApplicationArea = Basic;
    CardPageID = "Detail Self Inspection ResultC";
    PageType = List;
    SourceTable = "Detail Self Inspection Result";
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
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Name field.';
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
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Code field.';
                }
                field("Road Link Name"; Rec."Road Link Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Link Name field.';
                }
                field("Road Chainage"; Rec."Road Chainage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Chainage field.';
                }
                field("Standard Service Level"; Rec."Standard Service Level")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Standard Service Level field.';
                }
                field(Month; Rec.Month)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Month field.';
                }
                field(Year; Rec.Year)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Year field.';
                }
                field("Contract Month"; Rec."Contract Month")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Month field.';
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
                field("Road Class"; Rec."Road Class")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Class field.';
                }
                field("Inspected Chainage"; Rec."Inspected Chainage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inspected Chainage field.';
                }
                field("No. Of Subsection"; Rec."No. Of Subsection")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Of Subsection field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

