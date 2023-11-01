#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69100 "Comittees"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = Positions;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Job ID"; Rec."Job ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job ID field.';
                }
                field("Job Description"; Rec."Job Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Description field.';
                }
                field("No of Posts"; Rec."No of Posts")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No of Posts field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000006; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000007; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000008; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("M&embers")
            {
                Caption = 'M&embers';
                Image = Employee;
                action("Assigned Committee Members")
                {
                    ApplicationArea = Basic;
                    Caption = 'Assigned Committee Members';
                    Image = Relatives;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Approved Welfare Memberships";
                    RunPageLink = "Welfare No." = field("Job ID");
                    ToolTip = 'Executes the Assigned Committee Members action.';
                }
            }
        }
    }
}

#pragma implicitwith restore

