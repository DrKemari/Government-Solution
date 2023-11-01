#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69141 "Vacancy Media Advertisements"
{
    PageType = ListPart;
    SourceTable = "Job Advert Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Vacancy No."; Rec."Job Advert No.")
                {
                    ApplicationArea = Basic;
                }
                field("Job Id"; Rec."Job Id")
                {
                    ApplicationArea = Basic;
                }
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Basic;
                }
                // field("Outlet Used";"Outlet Used")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Media Outlet";"Media Outlet")
                // {
                //     ApplicationArea = Basic;
                //     Editable = false;
                // }
                // field(Description;Description)
                // {
                //     ApplicationArea = Basic;
                //     Editable = false;
                // }
                // field(Date;Date)
                // {
                //     ApplicationArea = Basic;
                // }
                // field(URL;URL)
                // {
                //     ApplicationArea = Basic;
                // }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

