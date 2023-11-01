#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69698 "Job Application Requirements"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Job Application Requirements";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Qualification Category"; Rec."Qualification Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qualification Category field.';
                }
                field("Qualification Code"; Rec."Qualification Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qualification Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Requirement Type"; Rec."Requirement Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requirement Type field.';
                }
                field("Candidates Response"; Rec."Candidates Response")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Candidates Response field.';
                }
                field("No. of AutoMatched"; Rec."No. of AutoMatched")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of AutoMatched Qualification field.';
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
        area(processing)
        {
            action("Job Application Evidence")
            {
                ApplicationArea = Basic;
                Image = Evaluate;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Requirements Evidence";
                RunPageLink = "Application No." = field("Application No."),
                              "Requirement ID" = field("Requirement ID");
                RunPageMode = View;
                ToolTip = 'Executes the Job Application Evidence action.';
            }
        }
    }
}

#pragma implicitwith restore

