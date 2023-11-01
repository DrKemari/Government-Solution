#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72077 "Service Level Selection Line"
{
    PageType = ListPart;
    SourceTable = "Service Level Selection Line";

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
                field(Category; Rec.Category)
                {
                    ApplicationArea = Basic;
                }
                field("Service Scope"; Rec."Service Scope")
                {
                    ApplicationArea = Basic;
                }
                field("Service Creteria"; Rec."Service Creteria")
                {
                    ApplicationArea = Basic;
                }
                field("Items To Apply"; Rec."Items To Apply")
                {
                    ApplicationArea = Basic;
                }
                field(Remark; Rec.Remark)
                {
                    ApplicationArea = Basic;
                }
                field(Project; Rec.Project)
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

