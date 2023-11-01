#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69167 "Leave Posting Journal"
{
    PageType = List;
    SourceTable = "Employee Leaves";
    SourceTableView = sorting("Employee No", "Leave Code", "Posting  Date")
                      order(ascending)
                      where(Posted = const(false));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Name field.';
                }
                field("Leave Code"; Rec."Leave Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Leave Code field.';
                }
                field("Posting  Date"; Rec."Posting  Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting  Date field.';
                }
                field("Adjustment Type"; Rec."Adjustment Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Adjustment Type field.';
                }
                field("No. Of Days"; Rec."No. Of Days")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Of Days field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("From Date"; Rec."From Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the From Date field.';
                }
                field("To Date"; Rec."To Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the To Date field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000015; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000016; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000017; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Leave Application")
            {
                Caption = 'Leave Application';
                Image = "Order";
                action("Post Leave Accuals")
                {
                    ApplicationArea = Basic;
                    Caption = 'Post Leave Accuals';
                    Image = Post;
                    Promoted = true;
                    PromotedIsBig = true;
                    //   RunObject = Report "Qualified Applicants Details";
                    ToolTip = 'Executes the Post Leave Accuals action.';
                }
            }
        }
    }
}

#pragma implicitwith restore

