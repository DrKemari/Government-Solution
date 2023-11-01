#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85223 "Student Renewals Entries"
{
    Editable = false;
    PageType = List;
    SourceTable = "Student Renewal Entries";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Course Id"; Rec."Course Id")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Renewal Date"; Rec."Renewal Date")
                {
                    ApplicationArea = Basic;
                }
                field("Stud. Reg. No"; Rec."Stud. Reg. No")
                {
                    ApplicationArea = Basic;
                }
                field(Year; Rec.Year)
                {
                    ApplicationArea = Basic;
                }
                field("Last Date Modified"; Rec."Last Date Modified")
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

