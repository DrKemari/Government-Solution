#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69098 "Payments Temp Payroll"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Assignment Matrix-X Temp-E";
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Payroll Period"; Rec."Payroll Period")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Payroll Period field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Posting Group Filter"; Rec."Posting Group Filter")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting Group Filter field.';
                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Insurance Code"; Rec."Insurance Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Insurance Code field.';
                }
                field("Effective Start Date"; Rec."Effective Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Effective Start Date field.';
                }
                field("Effective End Date"; Rec."Effective End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Effective End Date field.';
                }
                field("Basic Salary Code"; Rec."Basic Salary Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Basic Salary Code field.';
                }
                field("Opening Balance"; Rec."Opening Balance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Opening Balance field.';
                }
                field("Closing Balance"; Rec."Closing Balance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Closing Balance field.';
                }
                field("Employee Voluntary"; Rec."Employee Voluntary")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Voluntary field.';
                }
                field("Employer Amount"; Rec."Employer Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employer Amount field.';
                }
                field("Next Period Entry"; Rec."Next Period Entry")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Next Period Entry field.';
                }
                field(Rank; Rec.Rank)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rank field.';
                }
                field("Non-Cash Benefit"; Rec."Non-Cash Benefit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Non-Cash Benefit field.';
                }
                field(Taxable; Rec.Taxable)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Taxable field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

