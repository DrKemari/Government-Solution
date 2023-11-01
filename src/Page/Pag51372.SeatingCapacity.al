#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51372 "Seating Capacity"
{
    PageType = List;
    SourceTable = "Accreditation Seating Capacity";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = Basic;
                }
                field(Examination; Rec.Examination)
                {
                    ApplicationArea = Basic;
                }
                field("Exam Description"; Rec."Exam Description")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Classrooms"; Rec."No. of Classrooms")
                {
                    ApplicationArea = Basic;
                }
                field("Estimated Seating Space"; Rec."Estimated Seating Space")
                {
                    ApplicationArea = Basic;
                }
                field("Largest Class Seating capacity"; Rec."Largest Class Seating capacity")
                {
                    ApplicationArea = Basic;
                }
                field("Smallest ClassSeating capacity"; Rec."Smallest ClassSeating capacity")
                {
                    ApplicationArea = Basic;
                }
                field("Total Seating capacity"; Rec."Total Seating capacity")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

