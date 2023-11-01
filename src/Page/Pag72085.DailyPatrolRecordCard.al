#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72085 "Daily Patrol Record Card"
{
    PageType = Card;
    SourceTable = "Daily Patrol Record";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Daily Patrol No"; Rec."Daily Patrol No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Daily Patrol No field.';
                }
                field("Road Authority"; Rec."Road Authority")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Authority field.';
                }
                field(Contractor; Rec.Contractor)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contractor field.';
                }
                field(Project; Rec.Project)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project field.';
                }
                field("Road Name/Chainage"; Rec."Road Name/Chainage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Name/Chainage field.';
                }
                field("Road Class"; Rec."Road Class")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Class field.';
                }
                field("Inspected By"; Rec."Inspected By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Inspected By field.';
                }
                field("Standard Service Level"; Rec."Standard Service Level")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Standard Service Level field.';
                }
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Road Code field.';
                }
            }
            part(Control11; "Daily Patrol Line")
            {
                SubPageLink = Project = field(Project),
                              "Header No" = field("Daily Patrol No");
                ApplicationArea = Basic;
            }
            part(Control12; "Daily Patrol Other Activities")
            {
                SubPageLink = Project = field(Project),
                              "Header No" = field("Daily Patrol No");
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

