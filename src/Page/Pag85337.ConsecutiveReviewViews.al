#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85337 "Consecutive Review Views"
{
    ApplicationArea = Basic;
    CardPageID = "Consecutive Views Card";
    Editable = false;
    PageType = List;
    SourceTable = "Syllabus Review";
    SourceTableView = where("Stakeholders Review" = filter(Consecutive),
                            Status = filter("Stakeholder Views"));
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application No. field.';
                }
                field("Syllabus Name"; Rec."Syllabus Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Syllabus Name field.';
                }
                field("Domain Code"; Rec."Domain Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Domain Code field.';
                }
                field("Domain Name"; Rec."Domain Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Domain Name field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Type of Syllabus"; Rec."Type of Syllabus")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type of Syllabus field.';
                }
                field("Syllabus Type Name"; Rec."Syllabus Type Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Syllabus Type Name field.';
                }
                field("Date of Last Review"; Rec."Date of Last Review")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Last Review field.';
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

