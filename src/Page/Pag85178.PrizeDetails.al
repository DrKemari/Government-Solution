#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 85178 "Prize Details"
{
    PageType = ListPart;
    SourceTable = "Marksheet Detailed Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(StudentRegNo;Rec."Student Reg No.")
                {
                    ApplicationArea = Basic;
                }
                field(StudentName;Rec."Student Name")
                {
                    ApplicationArea = Basic;
                }
                field(Examination;Rec.Examination)
                {
                    ApplicationArea = Basic;
                }
                field("Part";Rec.Part)
                {
                    ApplicationArea = Basic;
                }
                field(Paper;Rec.Paper)
                {
                    ApplicationArea = Basic;
                }
                field(PaperName;Rec."Paper Name")
                {
                    ApplicationArea = Basic;
                }
                field(Mark;Rec.Mark)
                {
                    ApplicationArea = Basic;
                }
                field(Grade;Rec.Grade)
                {
                    ApplicationArea = Basic;
                }
                field(Passed;Rec.Passed)
                {
                    ApplicationArea = Basic;
                }
                field(ExaminationCenter;Rec."Examination Center")
                {
                    ApplicationArea = Basic;
                }
                field(ExaminationSittingID;Rec."Examination Sitting ID")
                {
                    ApplicationArea = Basic;
                }
                field(NotifiedOn;Rec."Notified On")
                {
                    ApplicationArea = Basic;
                }
                field(Notified;Rec.Notified)
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
            action(Donors)
            {
                ApplicationArea = Basic;
                Image = SocialSecurity;
                RunObject = Page "Course Sponsors";
                RunPageLink = "Line No"=field("Line No."),
                              Code=field("Document No.");
            }
        }
    }
}
