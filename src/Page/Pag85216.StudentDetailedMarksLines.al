#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85216 "Student Detailed MarksLines"
{
    Caption = 'Student Detailed MarksLines';
    Editable = false;
    PageType = List;
    SourceTable = "Marksheet Detailed Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Paper; Rec.Paper)
                {
                    ApplicationArea = Basic;
                }
                field("Paper Name"; Rec."Paper Name")
                {
                    ApplicationArea = Basic;
                }
                field(Mark; Rec.Mark)
                {
                    ApplicationArea = Basic;
                }
                field(Grade; Rec.Grade)
                {
                    ApplicationArea = Basic;
                }
                field("Envelope Serial No."; Rec."Envelope Serial No.")
                {
                    ApplicationArea = Basic;
                }
                field(Submitted; Rec.Submitted)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control14; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control13; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control4; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control3; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Envelope Serial Nos")
            {
                ApplicationArea = Basic;
                Image = Loaners;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Script Envelope Serials-EP";
                RunPageLink = Examination = field(Examination),
                              "Examination Sitting" = field("Examination Sitting ID"),
                              "Center Code" = field("Examination Center"),
                              "Paper Code" = field(Paper);
            }
            action(Questions)
            {
                ApplicationArea = Basic;
                Image = Questionaire;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Marksheet Qn Results";
                RunPageLink = "Paper Code" = field(Paper);
            }
        }
    }
}

#pragma implicitwith restore

