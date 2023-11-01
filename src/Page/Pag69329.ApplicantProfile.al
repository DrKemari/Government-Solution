#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69329 "Applicant Profile"
{
    PageType = Card;
    SourceTable = "Medical Scheme Coverage";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Scheme No"; Rec."Scheme No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Scheme No field.';
                }
                //     field("Applicant Type"; "Applicant Type")
                //     {
                //         ApplicationArea = Basic;
                //         ToolTip = 'Specifies the value of the Applicant Type field.';
                //     }
                //     field("Staff No."; "Staff No.")
                //     {
                //         ApplicationArea = Basic;
                //         ToolTip = 'Specifies the value of the Staff No. field.';
                //     }
                //     field("National ID"; "National ID")
                //     {
                //         ApplicationArea = Basic;
                //         ToolTip = 'Specifies the value of the National ID field.';
                //     }
                //     field("Code"; Code)
                //     {
                //         ApplicationArea = Basic;
                //         ToolTip = 'Specifies the value of the Code field.';
                //     }
                //     field(Description; Description)
                //     {
                //         ApplicationArea = Basic;
                //         ToolTip = 'Specifies the value of the Description field.';
                //     }
                //     field("In-Patient Limit"; "In-Patient Limit")
                //     {
                //         ApplicationArea = Basic;
                //         ToolTip = 'Specifies the value of the In-Patient Limit field.';
                //     }
                //     field(Gender; Gender)
                //     {
                //         ApplicationArea = Basic;
                //         ToolTip = 'Specifies the value of the Gender field.';
                //     }
                //     field("Date Of Birth"; "Date Of Birth")
                //     {
                //         ApplicationArea = Basic;
                //         ToolTip = 'Specifies the value of the Date Of Birth field.';
                //     }
                //     field("N.H.I.F No"; "N.H.I.F No")
                //     {
                //         ApplicationArea = Basic;
                //         ToolTip = 'Specifies the value of the N.H.I.F No field.';
                //     }
                //     field("Social Security No."; "Social Security No.")
                //     {
                //         ApplicationArea = Basic;
                //         ToolTip = 'Specifies the value of the Social Security No. field.';
                //     }
                //     field("County of Birth"; "County of Birth")
                //     {
                //         ApplicationArea = Basic;
                //         ToolTip = 'Specifies the value of the County of Birth field.';
                //     }
                //     field("P.I.N No"; "P.I.N No")
                //     {
                //         ApplicationArea = Basic;
                //         ToolTip = 'Specifies the value of the P.I.N No field.';
                //     }
                //     field(Religion; Religion)
                //     {
                //         ApplicationArea = Basic;
                //         ToolTip = 'Specifies the value of the Religion field.';
                //     }
                //     field(Disabled; Disabled)
                //     {
                //         ApplicationArea = Basic;
                //         ToolTip = 'Specifies the value of the Disabled field.';
                //     }
                //     field("Disability Certificate No"; "Disability Certificate No")
                //     {
                //         ApplicationArea = Basic;
                //         ToolTip = 'Specifies the value of the Disability Certificate No field.';
                //     }
                //     field("Disability Summary"; "Disability Summary")
                //     {
                //         ApplicationArea = Basic;
                //         ToolTip = 'Specifies the value of the Disability Summary field.';
                //     }
                //     field("Residence County"; "Residence County")
                //     {
                //         ApplicationArea = Basic;
                //         ToolTip = 'Specifies the value of the Residence County field.';
                //     }
                // }
                // group("Communication Details")
                // {
                //     field("E-Mail"; "E-Mail")
                //     {
                //         ApplicationArea = Basic;
                //         ToolTip = 'Specifies the value of the E-Mail field.';
                //     }
                //     field("Mobile Phone No."; "Mobile Phone No.")
                //     {
                //         ApplicationArea = Basic;
                //         ToolTip = 'Specifies the value of the Mobile Phone No. field.';
                //     }
                //     field("Phone No."; "Phone No.")
                //     {
                //         ApplicationArea = Basic;
                //         ToolTip = 'Specifies the value of the Phone No. field.';
                //     }
                //     field(Address; Address)
                //     {
                //         ApplicationArea = Basic;
                //         ToolTip = 'Specifies the value of the Address field.';
                //     }
                //     field("Address 2"; "Address 2")
                //     {
                //         ApplicationArea = Basic;
                //         ToolTip = 'Specifies the value of the Address 2 field.';
                //     }
                //     field("Post Code"; "Post Code")
                //     {
                //         ApplicationArea = Basic;
                //         ToolTip = 'Specifies the value of the Post Code field.';
                //     }
                //     field(City; City)
                //     {
                //         ApplicationArea = Basic;
                //         ToolTip = 'Specifies the value of the City field.';
                //     }
            }
            systempart(Control34; Outlook)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Applicant")
            {
                Caption = '&Applicant';
                Image = Customer;
                action("Academic History")
                {
                    ApplicationArea = Basic;
                    Image = ContactPerson;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Academic History";
                    RunPageLink = "Applicant ID" = field("Scheme No");
                    ToolTip = 'Executes the Academic History action.';
                }
                action("Professional Profile")
                {
                    ApplicationArea = Basic;
                    Image = CoupledOrder;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Professional Profile";
                    RunPageLink = "Applicant ID" = field("Scheme No");
                    ToolTip = 'Executes the Professional Profile action.';
                }
                action("Applicant Achievements")
                {
                    ApplicationArea = Basic;
                    Image = Certificate;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Applicant Accomplishment";
                    RunPageLink = "Applicant ID" = field("Scheme No");
                    ToolTip = 'Executes the Applicant Achievements action.';
                }
                action("Applicant Hobbies")
                {
                    ApplicationArea = Basic;
                    Image = Holiday;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Applicant Hobbies";
                    RunPageLink = "Applicant ID" = field("Scheme No");
                    ToolTip = 'Executes the Applicant Hobbies action.';
                }
            }
            group(History)
            {
                Caption = 'History';
                Image = History;
                group("Issued Documents")
                {
                    Caption = 'Issued Documents';
                    Image = Documents;
                }
            }
            group(Service)
            {
                Caption = 'Service';
                Image = ServiceItem;
            }
        }
        area(creation)
        {
        }
    }
}

#pragma implicitwith restore

