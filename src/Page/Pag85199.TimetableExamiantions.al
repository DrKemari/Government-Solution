#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85199 "Timetable Examiantions"
{
    PageType = ListPart;
    SourceTable = "Timetable Examination Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Examination; Rec.Examination)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
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
            group(Functions)
            {
                action("Planning Lines")
                {
                    ApplicationArea = Basic;
                    Image = Planning;
                    RunObject = Page "Timetable Lines";
                    RunPageLink = Code=field(Code),
                                  "Entry No."=field("Line No."),
                                  Examination=field(Examination);
                }
                action("Students Booked")
                {
                    ApplicationArea = Basic;
                    Image = BOMRegisters;
                    RunObject = Page "Exam Booking Entries";
                    RunPageLink = Examination=field(Examination);
                }
                action("Examination Centers")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Center Examinations";
                    RunPageLink = "Course Id"=field(Examination);
                }
            }
        }
    }
}

#pragma implicitwith restore

