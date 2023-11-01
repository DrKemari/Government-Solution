#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 50059 "Service Items List"
{
    Caption = 'Service Items List';
    Editable = false;
    PageType = List;
    SourceTable = "Service Items";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Service Code"; Rec."Service Code")
                {
                    ApplicationArea = Basic;
                }
                field("Service Name"; Rec."Service Name")
                {
                    ApplicationArea = Basic;
                }
                field("G/L Account"; Rec."G/L Account")
                {
                    ApplicationArea = Basic;
                }
                field("G/L Account Name"; Rec."G/L Account Name")
                {
                    ApplicationArea = Basic;
                }
                field(Capex; Rec.Capex)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000007; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000008; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000009; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

