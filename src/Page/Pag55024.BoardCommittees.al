#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 55024 "Board Committees"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Board Committees";
    SourceTableView = where(Type = const(Committee));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Mandate; Rec.Mandate)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mandate field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    Visible = true;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
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
                action("Assigned Board Members")
                {
                    ApplicationArea = Basic;
                    Caption = 'Assigned Board Members';
                    Image = Relatives;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Board Members";
                    RunPageLink = Committee = field(Code);
                    ToolTip = 'Executes the Assigned Board Members action.';
                }
                action("Assigned Non-Board Members")
                {
                    ApplicationArea = Basic;
                    Caption = 'Assigned Non-Board Members';
                    Image = Relatives;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Board Members";
                    RunPageLink = Committee = field(Code);
                    ToolTip = 'Executes the Assigned Non-Board Members action.';
                }
            }
        }
    }
}

#pragma implicitwith restore

