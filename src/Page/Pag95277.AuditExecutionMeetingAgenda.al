#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 95277 "Audit Execution Meeting Agenda"
{
    PageType = List;
    SourceTable = "Audit Execution Meeting Agenda";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Engagement ID"; Rec."Engagement ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Engagement ID field.';
                }
                field("Agenda Code"; Rec."Agenda Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Agenda Code field.';
                }
                field("Agenda Description"; Rec."Agenda Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Agenda Description field.';
                }
                field("Estimate Time (Minutes)"; Rec."Estimate Time (Minutes)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Estimate Time (Minutes) field.';
                }
                field("No. of Discussed Items"; Rec."No. of Discussed Items")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Discussed Items field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

