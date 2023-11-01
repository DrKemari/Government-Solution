#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80039 "Sub Activities"
{
    PageType = List;
    SourceTable = "Strategy Sub_Activity Entry";

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
                field("Entry Type"; Rec."Entry Type")
                {
                    ApplicationArea = Basic;
                }
                field("Entry Description"; Rec."Entry Description")
                {
                    ApplicationArea = Basic;
                }
                field("Year Reporting Code"; Rec."Year Reporting Code")
                {
                    ApplicationArea = Basic;
                }
                field("Quarter Reporting Code"; Rec."Quarter Reporting Code")
                {
                    ApplicationArea = Basic;
                }
                field("Planning Date"; Rec."Planning Date")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Directorate"; Rec."Primary Directorate")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Department"; Rec."Primary Department")
                {
                    ApplicationArea = Basic;
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Basic;
                }
                field("Cost Amount"; Rec."Cost Amount")
                {
                    ApplicationArea = Basic;
                }
                field("External Document No"; Rec."External Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Source Type"; Rec."Source Type")
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

