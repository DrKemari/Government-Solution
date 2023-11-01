#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51332 "Audit Plan1"
{
    CardPageID = "QA Audit Plan";
    PageType = List;
    SourceTable = "Audit Qualification Categories";

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
                field(Category; Rec.Category)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Category field.';
                }
                // field("Institution Name"; "Institution Name")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Institution Name field.';
                // }
                // field("Scope Summary"; "Scope Summary")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Scope Summary field.';
                // }
                // field("Planned Start Date"; "Planned Start Date")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Planned Start Date field.';
                // }
                // field("Plannned End Date"; "Plannned End Date")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Plannned End Date field.';
                // }
                // field("Total Estimate Budget (LCY)"; "Total Estimate Budget (LCY)")
                // // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Total Estimate Budget (LCY) field.';
                // }
            }
        }
        area(factboxes)
        {
            systempart(Control12; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control13; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control14; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control15; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

