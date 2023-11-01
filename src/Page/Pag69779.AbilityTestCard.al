#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
/// <summary>
/// Page Ability Test Card (ID 69779).
/// </summary>
Page 69779 "Ability Test Card"
{
    PageType = Card;
    SourceTable = "Ability Test Response";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Response ID"; Rec."Response ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Response ID field.';
                }
                field("Ability Test Invitation No."; Rec."Ability Test Invitation No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ability Test Invitation No. field.';
                }
                field("Vacancy ID"; Rec."Vacancy ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vacancy ID field.';
                }
                field("Test ID"; Rec."Test ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Test ID field.';
                }
                field("Lead HR Officer"; Rec."Lead HR Officer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Lead HR Officer field.';
                }
                field("Candidate No."; Rec."Candidate No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Candidate No. field.';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Middle Name field.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Name field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field("Test Start Time"; Rec."Test Start Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Test Start Time field.';
                }
                field("Test End Time"; Rec."Test End Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Test End Time field.';
                }
                field("Total No. of Questions"; Rec."Total No. of Questions")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total No. of Questions field.';
                }
                field("Total No. of Pass Questions"; Rec."Total No. of Pass Questions")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total No. of Pass Questions field.';
                }
                field("Ability Test Pass Score %"; Rec."Ability Test Pass Score %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ability Test Pass Score % field.';
                }
                field("Response Status"; Rec."Response Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Response Status field.';
                }
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application No. field.';
                }
                field("Test Date"; Rec."Test Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Test Date field.';
                }
            }
            part(Control26; "Ability Test Question")
            {
                SubPageLink = "Response ID" = field("Response ID");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control22; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control23; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control24; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control25; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

