#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72018 "Road Study Findings"
{
    Editable = false;
    PageType = List;
    SourceTable = "Road Study Result";
    SourceTableView = where("Result Type"=filter(Finding));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = Basic;
                }
                field("Study ID"; Rec."Study ID")
                {
                    ApplicationArea = Basic;
                }
                field("Study Task ID"; Rec."Study Task ID")
                {
                    ApplicationArea = Basic;
                }
                field("Result Type"; Rec."Result Type")
                {
                    ApplicationArea = Basic;
                }
                field("Report Type"; Rec."Report Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
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

