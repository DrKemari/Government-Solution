#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57302 "Budget Reallocation Lines"
{
    PageType = ListPart;
    SourceTable = "Budget Modification Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("G/L Account No"; Rec."G/L Account No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the G/L Account No field.';
                }
                field("G/L Account Name"; Rec."G/L Account Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the G/L Account Name field.';
                }
                field("Global Dimension 1 Code"; Rec."Global Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 1 Code field.';
                }
                field("Global Dimension 2 Code"; Rec."Global Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Global Dimension 2 Code field.';
                }
                field("Current Balance"; Rec."Current Balance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Balance field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("New Balance"; Rec."New Balance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Balance field.';
                }
                field("Budget Name"; Rec."Budget Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Budget Name field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

