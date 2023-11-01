#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 90447 "Innovation Reward Line"
{
    PageType = ListPart;
    SourceTable = "Innovation Reward Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Reward ID"; Rec."Reward ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reward ID field.';
                }
                field("Reward Category"; Rec."Reward Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reward Category field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Payroll; Rec.Payroll)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payroll field.';
                }
                field("Earning Code"; Rec."Earning Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Earning Code field.';
                }
                field("Amount (LCY)"; Rec."Amount (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount (LCY) field.';
                }
                field("Payroll Period"; Rec."Payroll Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payroll Period field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

