#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85051 "Institution Booking Lines"
{
    PageType = ListPart;
    SourceTable = "Bulk Processing Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Registration No."; Rec."Registration No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Registration No. field.';
                }
                field("Course ID"; Rec."Course ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Examination  ID';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Examination  ID field.';
                }
                field("Course Description"; Rec."Course Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Examination ';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Examination  field.';
                }
                field("Booking Type"; Rec."Booking Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Booking Type field.';
                }
                field("Part"; Rec.Part)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Part field.';
                }
                field(Section; Rec.Section)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Section field.';
                }
                field(Paper; Rec.Paper)
                {
                    ApplicationArea = Basic;
                    Caption = 'Subject';
                    ToolTip = 'Specifies the value of the Subject field.';
                }
                field("Student No."; Rec."Student No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Student No. field.';
                }
                field("Student Name"; Rec."Student Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Student Name field.';
                }
                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the ID Number field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field("Examination Project Code"; Rec."Examination Project Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Examination Project Code field.';
                }
                field("Examination Project Name"; Rec."Examination Project Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Examination Project Name field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Mandatory Requirements")
            {
                ApplicationArea = Basic;
                Image = Documents;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Examination Mandatory Req";
                RunPageLink = "Course Id" = field("Course ID");
                RunPageMode = View;
                ToolTip = 'Executes the Mandatory Requirements action.';
            }
        }
    }
}

#pragma implicitwith restore

