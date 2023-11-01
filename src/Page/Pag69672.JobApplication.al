#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69672 "Job Application"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Job Applications";

    layout
    {
        area(content)
        {
            group(General)
            {
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
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No. field.';
                }
                field("Vacancy Id"; Rec."Vacancy Id")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vacancy Id field.';
                }
                field("Position Id"; Rec."Position Id")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Position Id field.';
                }
                field("Job Title/Designation"; Rec."Job Title/Designation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Title/Designation field.';
                }
                field("Duty Station ID"; Rec."Duty Station ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Duty Station ID field.';
                }
                field("Work Location Details"; Rec."Work Location Details")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Work Location Details field.';
                }
                field("Application Status"; Rec."Application Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Status field.';
                }
                field("Employment Type"; Rec."Employment Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employment Type field.';
                }
            }
            group("Personal Information")
            {

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
                field("Professional Summary"; Rec."Professional Summary")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Professional Summary field.';
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
            }
            group("Current Employment Details")
            {
                Editable = false;
                field("Current Employment Status"; Rec."Current Employment Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Employment Status field.';
                }
                field("Employer Name"; Rec."Employer Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employer Name field.';
                }
                field(Station; Rec.Station)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Station field.';
                }
                field("Personal No."; Rec."Personal No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Personal No. field.';
                }
                field("Present Substantive Post"; Rec."Present Substantive Post")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Present Substantive Post field.';
                }
                field("Job Grade"; Rec."Job Grade")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Grade field.';
                }
                field("Secondment Organization"; Rec."Secondment Organization")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Secondment Organization field.';
                }
                field("Secondment Designation"; Rec."Secondment Designation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Secondment Designation field.';
                }
                field("Secondment Job Group"; Rec."Secondment Job Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Secondment Job Group field.';
                }
                field("Gross Salary"; Rec."Gross Salary")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gross Salary field.';
                }
            }
        }
        area(factboxes)
        {
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
            action("Academic Qualifications")
            {
                ApplicationArea = Basic;
                Image = Certificate;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Application Academic";
                RunPageLink = "Application No." = field("Application No.");
                ToolTip = 'Executes the Academic Qualifications action.';
            }
            action("Professional Qualifications")
            {
                ApplicationArea = Basic;
                Image = QualificationOverview;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Application Proffessionas";
                RunPageLink = "Application No." = field("Application No.");
                ToolTip = 'Executes the Professional Qualifications action.';
            }
            action("Skills & Competencies")
            {
                ApplicationArea = Basic;
                Image = Skills;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Application Skills";
                RunPageLink = "Application No." = field("Application No.");
                ToolTip = 'Executes the Skills & Competencies action.';
            }
            action(Experience)
            {
                ApplicationArea = Basic;
                Image = ExpandDepositLine;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Job Application Experience";
                RunPageLink = "Application No." = field("Application No.");
                ToolTip = 'Executes the Experience action.';
            }
            action(Hobbies)
            {
                ApplicationArea = Basic;
                Image = Holiday;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Application Hobbies";
                RunPageLink = "Application No." = field("Application No.");
                ToolTip = 'Executes the Hobbies action.';
            }
            action(Referees)
            {
                ApplicationArea = Basic;
                Image = Relationship;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page ApplicationReferees;
                RunPageLink = "Application No." = field("Application No.");
                ToolTip = 'Executes the Referees action.';
            }
            action("Applicant Language")
            {
                ApplicationArea = Basic;
                Image = Language;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Application Language";
                RunPageLink = "Application No." = field("Application No.");
                ToolTip = 'Executes the Applicant Language action.';
            }
            action("Job Application Checklist")
            {
                ApplicationArea = Basic;
                Caption = 'Job Application Checklist';
                Image = Check;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                RunObject = Page "Job Application Requirements";
                RunPageLink = "Application No." = field("Application No.");
                RunPageMode = View;
                ToolTip = 'Executes the Job Application Checklist action.';
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";
                PromotedIsBig = true;
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    Rec.SetRange("Application No.", Rec."Application No.");
                    Report.Run(69608, true, false, Rec);
                end;
            }
            action("Application Attached Documents")
            {
                ApplicationArea = Basic;
                Image = Evaluate;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                RunObject = Page "Application Attached Documents";
                RunPageLink = "Application No." = field("Application No.");
                RunPageMode = View;
                ToolTip = 'Executes the Application Attached Documents action.';
            }
            action("Application Declaration")
            {
                ApplicationArea = Basic;
                Image = DepreciationBooks;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                RunObject = Page "Application Declarations";
                RunPageLink = "Application No." = field("Application No.");
                ToolTip = 'Executes the Application Declaration action.';
            }
        }
    }
}

#pragma implicitwith restore

