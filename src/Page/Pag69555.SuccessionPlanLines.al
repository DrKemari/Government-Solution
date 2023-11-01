#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69555 "Succession Plan Lines"
{
    PageType = ListPart;
    SourceTable = "Succession Plan Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Current Position ID"; Rec."Current Position ID")
                {
                    ApplicationArea = Basic;
                }
                field("Projected Position ID"; Rec."Projected Position ID")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Start Date"; Rec."Planned Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Planned End Date"; Rec."Planned End Date")
                {
                    ApplicationArea = Basic;
                }
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                }
                field(Mentor; Rec.Mentor)
                {
                    ApplicationArea = Basic;
                }
                field("Default Mentorship Template"; Rec."Default Mentorship Template")
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
            action(Initiatives)
            {
                ApplicationArea = Basic;
                RunObject = Page "Succession Plan Initiatives";
                RunPageLink = "Document No" = field("Document No"),
                              "Employee No" = field("Employee No");
            }
        }
    }
}

#pragma implicitwith restore

