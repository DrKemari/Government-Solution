#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69161 "Leave Balances"
{
    PageType = List;
    SourceTable = Employee;
    SourceTableView = sorting("No.")
                      order(ascending)
                      where(Status = const(Active));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employee''s first name.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employee''s middle name.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employee''s last name.';
                }
                field("Leave Outstanding Bal"; Rec."Leave Outstanding Bal")
                {
                    ApplicationArea = Basic;
                    Caption = 'Annual Leave Balance';
                    ToolTip = 'Specifies the value of the Annual Leave Balance field.';
                }
                field("Compassionate Leave Days"; Rec."Compassionate Leave Days")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Compassionate Leave Days field.';
                }
                field("Maternity Leave Days"; Rec."Maternity Leave Days")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maternity Leave Days field.';
                }
                field("Paternity Leave Days"; Rec."Paternity Leave Days")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Paternity Leave Days field.';
                }
                field("Study Leave Days"; Rec."Study Leave Days")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Study Leave Days field.';
                }
                field("Off Days"; Rec."Off Days")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Off Days field.';
                }
                field("Unpaid Leave"; Rec."Unpaid Leave")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unpaid Leave field.';
                }
                field("Sick Leave"; Rec."Sick Leave")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sick Leave field.';
                }
                field("Total Leave Days"; Rec."Total Leave Days")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Leave Days field.';
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employee''s gender.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employment status of the employee.';
                }
                field(Branch; Rec.Branch)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Branch field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("Posting Group"; Rec."Posting Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting Group field.';
                }
                field(Rank; Rec.Rank)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rank field.';
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the employee''s job title.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000022; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000023; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000024; Links)
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

