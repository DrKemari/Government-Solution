#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 95137 "Audit Work Types"
{
    ApplicationArea = Basic;
    CardPageID = "Audit Work Type";
    PageType = List;
    SourceTable = "Audit Work Type";
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
                field("Primary Objective"; Rec."Primary Objective")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Objective field.';
                }
                field("No. of Planned Audits"; Rec."No. of Planned Audits")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the No. of Planned Audits field.';
                }
                field("No. of Ongoing Audits"; Rec."No. of Ongoing Audits")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the No. of Ongoing Audits field.';
                }
                field("No. of Completed Audit"; Rec."No. of Completed Audit")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the No. of Completed Audit field.';
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
    }
}

#pragma implicitwith restore

