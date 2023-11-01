#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72102 "Self In Site Verification Line"
{
    PageType = ListPart;
    SourceTable = "Self In Site Verification Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                }
                field("Project No"; Rec."Project No")
                {
                    ApplicationArea = Basic;
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                }
                field(Service; Rec.Service)
                {
                    ApplicationArea = Basic;
                }
                field("Service Scope"; Rec."Service Scope")
                {
                    ApplicationArea = Basic;
                }
                field(Selection; Rec.Selection)
                {
                    ApplicationArea = Basic;
                }
                field("Service Criteria"; Rec."Service Criteria")
                {
                    ApplicationArea = Basic;
                }
                field("Total Complied(Km)"; Rec."Total Complied(Km)")
                {
                    ApplicationArea = Basic;
                }
                field("Total Non Complied(Km)"; Rec."Total Non Complied(Km)")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

