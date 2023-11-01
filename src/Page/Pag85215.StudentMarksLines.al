#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85215 "Student Marks Lines"
{
    Caption = 'Student Marks Lines';
    DeleteAllowed = false;
    ModifyAllowed = false;
    PageType = ListPart;
    SourceTable = "Exam Marksheet Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Student Reg No."; Rec."Student Reg No.")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Papers"; Rec."No. of Papers")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Detailed Lines")
            {
                ApplicationArea = Basic;
                RunObject = Page "Student Detailed MarksLines";
                RunPageLink = "Document No."=field("Document No."),
                              "Student Reg No."=field("Student Reg No.");
            }
            action("Preview Result Slip")
            {
                ApplicationArea = Basic;
                Visible = false;

                trigger OnAction()
                begin
                    ExaminationResults.Reset;
                    ExaminationResults.SetRange("Student Reg No.", Rec."Student Reg No.");
                    if ExaminationResults.FindSet then begin
                    Report.Run(85016,true,false,ExaminationResults);
                    end
                end;
            }
        }
    }

    var
        ExaminationResults: Record "Examination Results";
}

#pragma implicitwith restore

