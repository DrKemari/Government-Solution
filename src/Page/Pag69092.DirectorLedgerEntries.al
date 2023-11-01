#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69092 "Director Ledger Entries"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Director Ledger Entry";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Director No"; Rec."Director No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Director No field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field("Payroll Period"; Rec."Payroll Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payroll Period field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Date of Meeting"; Rec."Date of Meeting")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Meeting field.';
                }
                field("No of Days"; Rec."No of Days")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No of Days field.';
                }
                field("Taxable amount"; Rec."Taxable amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Taxable amount field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000028; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000029; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000030; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000031; Links)
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

