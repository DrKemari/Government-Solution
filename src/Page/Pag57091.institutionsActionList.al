#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57091 "institutions Action List"
{
    PageType = ListPart;
    SourceTable = "Institutional Actns Amount";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Investment Code"; Rec."Investment Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Investment Code field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Fund Code"; Rec."Fund Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Fund Code field.';
                }
                field("Custodian Code"; Rec."Custodian Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Custodian Code field.';
                }
                field("Books Closure Date"; Rec."Books Closure Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Schedule Date';
                    ToolTip = 'Specifies the value of the Schedule Date field.';
                }
                field("Payment Date"; Rec."Payment Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment Date field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
                field("Payment posted"; Rec."Payment posted")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment posted field.';
                }
                field("Check to Post"; Rec."Check to Post")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Check to Post field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

