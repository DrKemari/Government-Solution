page 50302 "Payroll Approvers"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Payroll Approvers";

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(UserID; UserID)
                {
                    ApplicationArea = All;

                }
                field(Names; Names)
                {
                    ApplicationArea = All;

                }
                field("Approval Title"; "Approval Title")
                {
                    ApplicationArea = All;

                }
                field("Sequence No"; "Sequence No")
                {
                    ApplicationArea = All;

                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin

                end;
            }
        }
    }
}