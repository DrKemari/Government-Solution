#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
/// <summary>
/// Page Ability Applicants (ID 69800).
/// </summary>
Page 69800 "Ability Applicants"
{
    Caption = 'Ability Applicants';
    PageType = ListPart;
    SourceTable = "PreScreening Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Vacancy ID"; Rec."Vacancy ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vacancy ID field.';
                }
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application No. field.';
                }
                field("Candidate No."; Rec."Candidate No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Candidate No. field.';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Middle Name field.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Last Name field.';
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Employee No. field.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
                field("Mobile Phone No."; Rec."Mobile Phone No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Mobile Phone No. field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field("Planned Start Date"; Rec."Planned Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Planned Start Date field.';
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
                field("No. of Questions"; Rec."No. of Questions")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Questions field.';
                }
                field("Phone Interview Outcome"; Rec."Phone Interview Outcome")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone Interview Outcome field.';
                }
                field(Notified; Rec.Notified)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Notified field.';
                }
                field("DateTime Notified"; Rec."DateTime Notified")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the DateTime Notified field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Log)
            {
                action("Phone Log")
                {
                    ApplicationArea = Basic;
                    RunObject = Page "Phone Log";
                    RunPageLink = "Application No." = field("Application No."),
                                  "Document No." = field("Document No.");
                    ToolTip = 'Executes the Phone Log action.';
                }
            }
        }
    }
}

