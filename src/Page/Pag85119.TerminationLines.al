#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85119 "Termination Lines"
{
    PageType = ListPart;
    SourceTable = "Staff Termination Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Termination Category"; Rec."Termination Category")
                {
                    ApplicationArea = Basic;
                }
                field("Termination Details"; Rec."Termination Details")
                {
                    ApplicationArea = Basic;
                }
                field("Termination Date"; Rec."Termination Date")
                {
                    ApplicationArea = Basic;
                }
                field("Role Code"; Rec."Role Code")
                {
                    ApplicationArea = Basic;
                }
                field("Resource No."; Rec."Resource No.")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                }
                field("Staff Category"; Rec."Staff Category")
                {
                    ApplicationArea = Basic;
                }
                field("Project Start Date"; Rec."Project Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Project End Date"; Rec."Project End Date")
                {
                    ApplicationArea = Basic;
                }
                field(Designation; Rec.Designation)
                {
                    ApplicationArea = Basic;
                }
                field("Project Manager"; Rec."Project Manager")
                {
                    ApplicationArea = Basic;
                }
                field("Appointment Document No."; Rec."Appointment Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("User ID"; Rec."User ID")
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

