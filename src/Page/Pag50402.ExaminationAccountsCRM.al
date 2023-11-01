#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 50402 "Examination Accounts CRM"
{
    PageType = Card;
    SourceTable = "Examination Account";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Registration No."; Rec."Registration No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Registration No. field.';
                }
                field("Student Cust No."; Rec."Student Cust No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Student Cust No. field.';
                }
                field("Course ID"; Rec."Course ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Course ID field.';
                }
                field("Course Description"; Rec."Course Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Course Description field.';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Middle Name field.';
                }
                field(Surname; Rec.Surname)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Surname field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

