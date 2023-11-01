#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72076 "Service Level Selection Card"
{
    PageType = Card;
    SourceTable = "Service Level Selection";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Service No"; Rec."Service No")
                {
                    ApplicationArea = Basic;
                }
                field("Road Authority"; Rec."Road Authority")
                {
                    ApplicationArea = Basic;
                }
                field(Contractor; Rec.Contractor)
                {
                    ApplicationArea = Basic;
                }
                field(Project; Rec.Project)
                {
                    ApplicationArea = Basic;
                }
                field("Road Code"; Rec."Road Code")
                {
                    ApplicationArea = Basic;
                }
                field("Road Name/Chainage"; Rec."Road Name/Chainage")
                {
                    ApplicationArea = Basic;
                }
                field("Road Class"; Rec."Road Class")
                {
                    ApplicationArea = Basic;
                }
                field("Inspected By"; Rec."Inspected By")
                {
                    ApplicationArea = Basic;
                }
                field("Standard Service Level"; Rec."Standard Service Level")
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control11; "Service Level Selection Line")
            {
                SubPageLink = Project = field(Project),
                              "Header No" = field("Service No");
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

