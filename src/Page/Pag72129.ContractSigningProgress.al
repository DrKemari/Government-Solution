#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72129 "Contract Signing & Progress"
{
    PageType = ListPart;
    SourceTable = "Contract Signing & Progress";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Heder No"; Rec."Heder No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Heder No field.';
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field("Contract Signing Date"; Rec."Contract Signing Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Signing Date field.';
                }
                field("Completion Date"; Rec."Completion Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Completion Date field.';
                }
                field("Achieved Km This Month"; Rec."Achieved Km This Month")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Achieved Km This Month field.';
                }
                field("Total Achieved KM To Date"; Rec."Total Achieved KM To Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Achieved KM To Date field.';
                }
                field("Work Variation Amount"; Rec."Work Variation Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Work Variation Amount field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

