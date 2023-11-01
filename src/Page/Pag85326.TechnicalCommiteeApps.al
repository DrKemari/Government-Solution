#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85326 "Technical Commitee Apps"
{
    CardPageID = "Commitee Application";
    Editable = false;
    PageType = List;
    SourceTable = "Syllabus Review";
    SourceTableView = where(Status = filter("EC Approval"));

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
                field("Syllabus No."; Rec."Syllabus No.")
                {
                    ApplicationArea = Basic;
                }
                field("Syllabus Name"; Rec."Syllabus Name")
                {
                    ApplicationArea = Basic;
                }
                field("Domain Code"; Rec."Domain Code")
                {
                    ApplicationArea = Basic;
                }
                field("Domain Name"; Rec."Domain Name")
                {
                    ApplicationArea = Basic;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Type of Syllabus"; Rec."Type of Syllabus")
                {
                    ApplicationArea = Basic;
                }
                field("Syllabus Type Name"; Rec."Syllabus Type Name")
                {
                    ApplicationArea = Basic;
                }
                field("Date of Last Review"; Rec."Date of Last Review")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control14; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control15; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control16; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control17; Links)
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

