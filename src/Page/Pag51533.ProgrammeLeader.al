#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51533 "Programme Leader"
{
    PageType = List;
    SourceTable = "Quality Programme Leader";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Quality Response No."; Rec."Quality Response No.")
                {
                    ApplicationArea = Basic;
                }
                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = Basic;
                }
                field("Full Name"; Rec."Full Name")
                {
                    ApplicationArea = Basic;
                }
                field("Teaching Experience"; Rec."Teaching Experience")
                {
                    ApplicationArea = Basic;
                }
                field("Bachelor Specialization"; Rec."Bachelor Specialization")
                {
                    ApplicationArea = Basic;
                }
                field("Masters Specialization"; Rec."Masters Specialization")
                {
                    ApplicationArea = Basic;
                }
                field("Doctorate Specialization"; Rec."Doctorate Specialization")
                {
                    ApplicationArea = Basic;
                }
                field("Terms of Employment"; Rec."Terms of Employment")
                {
                    ApplicationArea = Basic;
                }
                field("Highest Academic Qualification"; Rec."Highest Academic Qualification")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control13; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control14; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control15; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control16; Links)
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

