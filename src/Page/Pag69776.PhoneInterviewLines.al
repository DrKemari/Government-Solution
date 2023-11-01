#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69776 "Phone Interview Lines"
{
    Caption = 'Phone Interview Lines';
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
                }
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = Basic;
                }
                field("Candidate No."; Rec."Candidate No.")
                {
                    ApplicationArea = Basic;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Mobile Phone No."; Rec."Mobile Phone No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Planned Start Date"; Rec."Planned Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Test Start Time"; Rec."Test Start Time")
                {
                    ApplicationArea = Basic;
                }
                field("Test End Time"; Rec."Test End Time")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Questions"; Rec."No. of Questions")
                {
                    ApplicationArea = Basic;
                }
                field("Phone Interview Outcome"; Rec."Phone Interview Outcome")
                {
                    ApplicationArea = Basic;
                }
                field(Notified; Rec.Notified)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("DateTime Notified"; Rec."DateTime Notified")
                {
                    ApplicationArea = Basic;
                    Editable = false;
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
                    RunPageLink = "Application No."=field("Application No."),
                                  "Document No."=field("Document No.");
                }
            }
        }
    }
}

#pragma implicitwith restore

