#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85014 "Approved Appointment Header"
{
    DeleteAllowed = false;
    Editable = false;
    PageType = Card;
    SourceTable = "Exam Booking Entries";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Student Name"; Rec."Student Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Student Name field.';
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No. field.';
                }
                field("Student Reg No."; Rec."Student Reg No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Student Reg No. field.';
                }
                field(Examination; Rec.Examination)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Examination field.';
                }
                field(Section; Rec.Section)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Section field.';
                }
                field("Part"; Rec.Part)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Level field.';
                }
                field(Paper; Rec.Paper)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Paper field.';
                }
                field("Project Code"; Rec."Project Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Code field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field("Stud. Cust No."; Rec."Stud. Cust No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Stud. Cust No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field("Fee Amount"; Rec."Fee Amount")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Fee Amount field.';
                }
                field("Fee Amount LCY"; Rec."Fee Amount LCY")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Fee Amount LCY field.';
                }
                field("Exam Center"; Rec."Exam Center")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Exam Center field.';
                }
                field("Center Name"; Rec."Center Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Center Name field.';
                }
                field("Exam Sitting"; Rec."Exam Sitting")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Exam Sitting field.';
                }
                field(Year; Rec.Year)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Year field.';
                }
            }
            part(Control23; "Appointment Lines")
            {
                SubPageLink = "Appointment No." = field(Code);
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

