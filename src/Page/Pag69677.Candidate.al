#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69677 "Candidate"
{
    PageType = Card;
    SourceTable = Applicant;

    layout
    {
        area(content)
        {
            group("Personal Information")
            {
                field("Candidate No."; Rec."Candidate No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Tittles; Rec.Tittles)
                {
                    ApplicationArea = Basic;
                    caption = 'Title';
                }
                field("First Name"; Rec."First Name")
                {

                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    Caption = 'Other Names';
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Middle Name field.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    Caption = 'Surname';
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Name field.';
                }
                field("Full Names"; Rec."Full Names")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Initials field.';
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gender field.';
                }
                field("Birth Date"; Rec."Birth Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Birth Date field.';
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Country/Region Code field.';
                }
                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ID Number field.';
                }
                field("Passport No."; Rec."Passport No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Passport No. field.';
                }
                field("Marital Status"; Rec."Marital Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Marital Status field.';
                }
                field(Religion; Rec.Religion)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Religion field.';
                }
                field("Ethnic Group"; Rec."Ethnic Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ethnic Group field.';
                }
                field("NHIF No"; Rec."NHIF No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the NHIF No field.';
                }
                field("NSSF No"; Rec."NSSF No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the NSSF No field.';
                }
                field("KRA Pin"; Rec."KRA Pin")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the KRA Pin field.';
                }
                field(Nationality; Rec.Nationality)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Nationality field.';
                }
            }
            group(Communication)
            {
                field("Mobile Phone No."; Rec."Mobile Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mobile Phone No. field.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address 2 field.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the City field.';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Post Code field.';
                }
                field("County of Birth"; Rec."County of Birth")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the County field.';
                }
            }
            group("Disability Information")
            {
                field("Disability Code"; Rec."Disability Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disability Code field.';
                }
                field(Disabled; Rec.Disabled)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disabled field.';
                }
                field("Disability Description"; Rec."Disability Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disability Description field.';
                }
                field("Disability Certificate No"; Rec."Disability Certificate No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disability Certificate No field.';
                }
            }
            group("Applicant Qualification")
            {
                field("Skills & Competences"; Rec."Skills & Competences")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Skills & Competences field.';
                }
                field("Specialization Area"; Rec."Specialization Area")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Specialization Area field.';
                }
                field("Highest Academic Qualification"; Rec."Highest Academic Qualification")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Highest Academic Qualification field.';
                }
                field("Qualification Name"; Rec."Qualification Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qualification Name field.';
                }
                field("Work Experience (Years)"; Rec."Work Experience (Years)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Work Experience (Years) field.';
                }
                field("Management Experience (Years)"; Rec."Management Experience (Years)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Management Experience (Years) field.';
                }
                group(Administration)
                {
                    field("Employee No"; Rec."Employee No")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Employee No field.';
                    }
                    field(Status; Rec.Status)
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Status field.';
                    }
                    field("Inactive Date"; Rec."Inactive Date")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Inactive Date field.';
                    }
                    field("Cause of Inactivity Code"; Rec."Cause of Inactivity Code")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Cause of Inactivity Code field.';
                    }
                    field("Termination Date"; Rec."Termination Date")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Termination Date field.';
                    }
                }
            }
        }
        area(factboxes)
        {
            part("Candidate Picture"; "Job Applicant Picture")
            {
                SubPageLink = "Candidate No." = field("Candidate No.");
                ApplicationArea = Basic;
            }
            part(Control59; "Candidate Statistics")
            {
                SubPageLink = "Candidate No." = field("Candidate No.");
                ApplicationArea = Basic;
            }
            systempart(Control41; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control42; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control43; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control44; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Qualifications)
            {
                ApplicationArea = Basic;
                Image = QualificationOverview;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Job Applicant Qualification";
                RunPageLink = "Candidate No." = field("Candidate No.");
                ToolTip = 'Executes the Qualifications action.';
            }
            action("Employment History")
            {
                ApplicationArea = Basic;
                Image = History;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Applicant Qualification Hist";
                ToolTip = 'Executes the Employment History action.';
            }
            action("Hobbies & Interests")
            {
                ApplicationArea = Basic;
                Image = Holiday;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page Hobbies;
                RunPageLink = "No." = field("Candidate No.");
                ToolTip = 'Executes the Hobbies & Interests action.';
            }
            action(Referees)
            {
                ApplicationArea = Basic;
                Image = Relationship;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page Referees;
                RunPageLink = "No." = field("Candidate No.");
                ToolTip = 'Executes the Referees action.';
            }
            action(Language)
            {
                ApplicationArea = Basic;
                Image = Language;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Employee_Applicant Language";
                RunPageLink = "No." = field("Candidate No.");
                ToolTip = 'Executes the Language action.';
            }
            action("Print Resume")
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                ToolTip = 'Executes the Print Resume action.';
                trigger OnAction()
                begin
                    Rec.SetRange("Candidate No.", Rec."Candidate No.");
                    Report.Run(69604, true, false, Rec);
                end;
            }
        }
    }
}

#pragma implicitwith restore

