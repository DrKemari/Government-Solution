page 50207 "PR Transaction Code Groups"
{

    ApplicationArea = All;
    Caption = 'PR Transaction Code Groups';
    PageType = List;
    SourceTable = "PR Trans Codes Groups";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Group Code"; Rec."Group Code")
                {
                    ApplicationArea = All;
                }
                field("Group Description"; Rec."Group Description")
                {
                    ApplicationArea = All;
                }

            }
        }
    }

}
