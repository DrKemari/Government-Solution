#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69770 "Candidate Interview Header"
{
    PageType = Card;
    SourceTable = "Candidate Shortlist Scoring";
    SourceTableView = where("Document No." = filter('2'));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Vacancy ID"; Rec."Vacancy ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vacancy ID field.';
                }
                field("Qualification Category"; Rec."Qualification Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qualification Category field.';
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
                field("Candidate's Response"; Rec."Candidate's Response")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Candidate''s Response field.';
                }
                // field("No. of Openings"; "No. of Openings")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the No. of Openings field.';
                // }
                // field("No. of Submitted Applications"; "No. of Submitted Applications")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the No. of Submitted Applications field.';
                // }
                // field("Shortlisting Venue"; "Shortlisting Venue")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Shortlisting Venue field.';
                // }
                // field(Directorate; Directorate)
                // {
                //     ApplicationArea = Basic;
                //     Importance = Additional;
                //     ToolTip = 'Specifies the value of the Directorate field.';
                // }
                // field(Department; Department)
                // {
                //     ApplicationArea = Basic;
                //     Importance = Additional;
                //     ToolTip = 'Specifies the value of the Department field.';
                // }
                // field("Seniority Level"; "Seniority Level")
                // {
                //     ApplicationArea = Basic;
                //     Importance = Additional;
                //     ToolTip = 'Specifies the value of the Seniority Level field.';
                // }
                // field("Employment Type"; "Employment Type")
                // {
                //     ApplicationArea = Basic;
                //     Importance = Additional;
                //     ToolTip = 'Specifies the value of the Employment Type field.';
                // }
                // field("Application Closing Date"; "Application Closing Date")
                // {
                //     ApplicationArea = Basic;
                //     Importance = Additional;
                //     ToolTip = 'Specifies the value of the Application Closing Date field.';
                // }
                // field("Application Closing Time"; "Application Closing Time")
                // {
                //     ApplicationArea = Basic;
                //     Importance = Additional;
                //     ToolTip = 'Specifies the value of the Application Closing Time field.';
                // }
                // field("Planned Start Date"; "Planned Start Date")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Planned Start Date field.';
                // }
                // field("Planned End Date"; "Planned End Date")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Planned End Date field.';
                // }
                // field("Document Status"; "Document Status")
                // {
                //     ApplicationArea = Basic;
                //     Importance = Additional;
                //     ToolTip = 'Specifies the value of the Document Status field.';
                // }
                // field("Created By"; "Created By")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Created By field.';
                // }
                // field("Created On"; "Created On")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Created On field.';
                // }
            }
            part(Control41; "Candidate Interview Line")
            {
              //  SubPageLink = "Document No." = field("Document Type"),
                         //     "Document Type" = field("Document No."),
                            //  "Vacancy ID" = field("Qualification Category");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control37; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control38; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control39; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control40; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Candidate Selection Committee")
            {
                ApplicationArea = Basic;
                Image = SelectEntries;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Candidate Shortlist Committee";
               // RunPageLink = "Document No." = field("Document Type"),
                     //         "Document Type" = field("Document No.");
                ToolTip = 'Executes the Candidate Selection Committee action.';
            }
            action("Failed Education")
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Failed Education action.';
            }
            action("Failed Management Experience")
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Failed Management Experience action.';
            }
            action("Failed Work Experience")
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Failed Work Experience action.';
            }
        }
    }
}

#pragma implicitwith restore

