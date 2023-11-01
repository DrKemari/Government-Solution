#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51532 "Teaching Staff Details"
{
    PageType = List;
    SourceTable = "Academic Staff Qualification";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Designation Type"; Rec."Designation Type")
                {
                    ApplicationArea = Basic;
                }
                field("Desgination Code"; Rec."Desgination Code")
                {
                    ApplicationArea = Basic;
                }
                field("Designation Name"; Rec."Designation Name")
                {
                    ApplicationArea = Basic;
                }
                field("Age Band"; Rec."Age Band")
                {
                    ApplicationArea = Basic;
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control10; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control11; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control12; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control13; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

