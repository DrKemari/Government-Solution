#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69328 "Applicant Profiles"
{
    CardPageID = "Applicant Profile";
    PageType = List;
    SourceTable = "Medical Scheme Coverage";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Scheme No"; Rec."Scheme No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Scheme No field.';
                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("In-Patient Limit"; Rec."In-Patient Limit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the In-Patient Limit field.';
                }
                field("Out-Patient Limit"; Rec."Out-Patient Limit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Out-Patient Limit field.';
                }
                // field(Address; Address)
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Address field.';
                // }
                // field("Address 2"; "Address 2")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Address 2 field.';
                // }
                // field(City; City)
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the City field.';
                // }
                // field("Post Code"; "Post Code")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Post Code field.';
                // }
                // field("County of Birth"; "County of Birth")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the County of Birth field.';
                // }
                // field("Phone No."; "Phone No.")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Phone No. field.';
                // }
                // field("Mobile Phone No."; "Mobile Phone No.")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Mobile Phone No. field.';
                // }
                // field("E-Mail"; "E-Mail")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the E-Mail field.';
                // }
                // field(Picture; Picture)
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Picture field.';
                // }
                // field("Birth Date"; "Birth Date")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Birth Date field.';
                // }
                // field("Social Security No."; "Social Security No.")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Social Security No. field.';
                // }
                // field("Union Code"; "Union Code")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Union Code field.';
                // }
                // field("Union Membership No."; "Union Membership No.")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Union Membership No. field.';
                // }
                // field(Gender; Gender)
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Gender field.';
                // }
                // field("Country/Region Code"; "Country/Region Code")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Country/Region Code field.';
                // }
                // field(Status; Status)
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Status field.';
                // }
                // field("Company E-Mail"; "Company E-Mail")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Company E-Mail field.';
                // }
                // field(Title; Title)
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Title field.';
                // }
                // field("No. Series"; "No. Series")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the No. Series field.';
                // }
                // field("Last Modified Date Time"; "Last Modified Date Time")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Last Modified Date Time field.';
                // }
                // field(Image; Image)
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Image field.';
                // }
                // field("Passport No."; "Passport No.")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Passport No. field.';
                // }
                // field("N.H.I.F No"; "N.H.I.F No")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the N.H.I.F No field.';
                // }
                // field("National ID"; "National ID")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the National ID field.';
                // }
                // field("Date Of Birth"; "Date Of Birth")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Date Of Birth field.';
                // }
                // field(Age; Age)
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Age field.';
                // }
                // field("Applicant Type"; "Applicant Type")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Applicant Type field.';
                // }
                // field("Staff No."; "Staff No.")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Staff No. field.';
                // }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

