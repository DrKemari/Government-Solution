#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72037 "Road Sections"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Road Section";
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Section ID"; Rec."Section ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Section Label"; Rec."Section Label")
                {
                    ApplicationArea = Basic;
                }
                field("Start Reference Point"; Rec."Start Reference Point")
                {
                    ApplicationArea = Basic;
                }
                field("Start Point Coordinates"; Rec."Start Point Coordinates")
                {
                    ApplicationArea = Basic;
                }
                field("End Reference Point"; Rec."End Reference Point")
                {
                    ApplicationArea = Basic;
                }
                field("End Point Coordinates"; Rec."End Point Coordinates")
                {
                    ApplicationArea = Basic;
                }
                field("Tota SectionLength(KM)"; Rec."Tota SectionLength(KM)")
                {
                    ApplicationArea = Basic;
                }
                field("Total Paved Length(KM)"; Rec."Total Paved Length(KM)")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
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

