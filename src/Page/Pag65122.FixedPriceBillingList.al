#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 65122 "Fixed Price Billing  List"
{
    ApplicationArea = Jobs;
    Caption = 'Project Billable List';
    CardPageID = "Fixed Price Billing Card";
    Editable = false;
    PageType = List;
    SourceTable = "Project Billable Header";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("Project Billable ID"; Rec."Project Billable ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Billable ID field.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project ID field.';
                }
                field("Financial Year Code"; Rec."Financial Year Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Financial Year Code field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

