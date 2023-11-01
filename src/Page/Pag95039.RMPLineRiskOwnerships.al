#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 95039 "RMP Line Risk Ownerships"
{
    CardPageID = "RMP Line Risk Ownership";
    PageType = List;
    SourceTable = "RMP Line Risk Ownership";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Risk ID"; Rec."Risk ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Visible = false;
                }
                field("Risk Title"; Rec."Risk Title")
                {
                    ApplicationArea = Basic;
                    Caption = 'Risk Description';
                    Editable = false;
                }
                field("Responsibility Center ID"; Rec."Responsibility Center ID")
                {
                    ApplicationArea = Basic;
                }
                field(Desciption; Rec.Desciption)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field("Responsible Officer No."; Rec."Responsible Officer No.")
                {
                    ApplicationArea = Basic;
                }
                field("Responsible Officer Name"; Rec."Responsible Officer Name")
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

