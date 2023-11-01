#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 65033 "Grant Types List"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Grant Types";
    UsageCategory = Administration;

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
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            group(ActionGroup7)
            {
                action("Funding Sources")
                {
                    ApplicationArea = Basic;
                    Image = ResourceCost;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Funding Source List";
                    RunPageLink = Code = field(Code);
                    ToolTip = 'Executes the Funding Sources action.';
                }
                action("Grants Profile")
                {
                    ApplicationArea = Basic;
                    Image = GiroPlus;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the Grants Profile action.';
                    trigger OnAction()
                    begin
                        Message('Testing %1');
                    end;
                }
                action("Projects Profile")
                {
                    ApplicationArea = Basic;
                    Image = Job;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Job List";
                    RunPageLink = "Grant Type" = field(Code);
                    ToolTip = 'Executes the Projects Profile action.';
                }
                action(Statistics)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Executes the Statistics action.';
                }
            }
        }
    }
}

#pragma implicitwith restore

