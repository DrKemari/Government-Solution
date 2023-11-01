#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85139 "Timetable Lines"
{
    PageType = List;
    SourceTable = "Timetable Planner Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Part"; Rec.Part)
                {
                    ApplicationArea = Basic;
                }
                field(Paper; Rec.Paper)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                }
                field(Day; Rec.Day)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Session Code"; Rec."Session Code")
                {
                    ApplicationArea = Basic;
                }
                field(Session; Rec.Session)
                {
                    ApplicationArea = Basic;
                }
                field("Start Time"; Rec."Start Time")
                {
                    ApplicationArea = Basic;
                }
                field("End Time"; Rec."End Time")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Exam Duration"; Rec."Exam Duration")
                {
                    ApplicationArea = Basic;
                }
                field("Total Capacity"; Rec."Total Capacity")
                {
                    ApplicationArea = Basic;
                    Caption = 'Booked Students';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

