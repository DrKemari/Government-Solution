#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 65032 "Funding Source List"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Funding Source";
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
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(ActionGroup7)
            {
                action("Funding Agencies")
                {
                    ApplicationArea = Basic;
                    Image = CashFlow;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Funding Agency List";
                    ToolTip = 'Executes the Funding Agencies action.';
                }
                action("Procurement Plan Entries")
                {
                    ApplicationArea = Basic;
                    Image = Planning;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Procurement Plan Entry";
                    RunPageLink = "Funding Source ID" = field(Code);
                    ToolTip = 'Executes the Procurement Plan Entries action.';
                }
                action("Funded Projects")
                {
                    ApplicationArea = Basic;
                    Image = ProjectExpense;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Job List";
                    RunPageLink = "Funding Source" = field(Code);
                    ToolTip = 'Executes the Funded Projects action.';
                }
                action(Statistics)
                {
                    ApplicationArea = Basic;
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Posted Receipts List";
                    ToolTip = 'Executes the Statistics action.';
                }
            }
        }
    }
}

#pragma implicitwith restore

