#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 59117 "Hr Applicant Emp History"
{
    PageType = List;
    SourceTable = "Employee History Table";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No. field.';
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No. field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User ID field.';
                }
                // field("Job ID"; "Job ID")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Job ID field.';
                // }
                // field("Job Description"; "Job Description")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Job Description field.';
                // }
                // field("Reason For Leaving"; "Reason For Leaving")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Reason For Leaving field.';
                // }
                // field(Comment; Comment)
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Comment field.';
                // }
                // field("Code"; Code)
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Code field.';
                // }
                // field("Job Grade"; "Job Grade")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Job Grade field.';
                // }
                // field("Employee No"; "Employee No")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Employee No field.';
                // }
                // field("Job Id"; "Job Id")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Job ID field.';
                // }
                // field("Id Number"; "Id Number")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Id Number field.';
                // }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

