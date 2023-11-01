#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72045 "Project Engineer Statistics"
{
    Editable = false;
    PageType = Card;
    SourceTable = Resource;
    SourceTableView = where("Project Engineer" = filter(true));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field("No. Of Ongoing Road Projects"; Rec."No. Of Ongoing Road Projects")
                {
                    ApplicationArea = Basic;
                }
                field("No. Of Finished Road Projects"; Rec."No. Of Finished Road Projects")
                {
                    ApplicationArea = Basic;
                }
                field("No. Of Planned Road Projects"; Rec."No. Of Planned Road Projects")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control11; "Grant Funding Sub List")
            {
                SubPageLink = "Principal Investigator" = field("No.");
                Visible = false;
                ApplicationArea = Basic;
            }
            part(Control12; "Project Funding Con. Sub List")
            {
                SubPageLink = "Person Responsible" = field("No.");
                Visible = false;
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

