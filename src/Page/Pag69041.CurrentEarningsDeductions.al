#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69041 "Current Earnings/Deductions"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Assignment Matrix-X";
    SourceTableView = sorting("Employee No", Type, Code, "Payroll Period", "Reference No")
                      order(ascending)
                      where(Closed = const(false));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the First Name field.';
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Middle Name field.';
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Name field.';
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
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Opening Balance"; Rec."Opening Balance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Opening Balance field.';
                }
                field("KRA Classification"; Rec."KRA Classification")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the KRA Classification field.';
                }
                field("Advance Interest"; Rec."Advance Interest")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Advance Interest field.';
                }
                field("Negative Earning"; Rec."Negative Earning")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Negative Earning field.';
                }
                field("Closing Balance"; Rec."Closing Balance")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Closing Balance field.';
                }
                field("Days Worked/Lost"; Rec."Days Worked/Lost")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Days Worked/Lost field.';
                }
                field("No. Of Hours"; Rec."No. Of Hours")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Of Hours field.';
                }
                field(Taxable; Rec.Taxable)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Taxable field.';
                }
                field("Tax Deductible"; Rec."Tax Deductible")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tax Deductible field.';
                }
                field(Frequency; Rec.Frequency)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Frequency field.';
                }
                field("Pay Period"; Rec."Pay Period")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pay Period field.';
                }
                field("Basic Pay"; Rec."Basic Pay")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Basic Pay field.';
                }
                field("Employer Amount"; Rec."Employer Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employer Amount field.';
                }
                field("Profit Centre"; Rec."Profit Centre")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Profit Centre field.';
                }
                field(Branch; Rec.Branch)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Branch field.';
                }
                field("Department Code"; Rec."Department Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department Code field.';
                }
                field("Staffing Group"; Rec."Staffing Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Staffing Group field.';
                }
                field("Pay Point"; Rec."Pay Point")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pay Point field.';
                }
                field("Next Period Entry"; Rec."Next Period Entry")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Next Period Entry field.';
                }
                field("Non-Fluctuating"; Rec."Non-Fluctuating")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Non-Fluctuating field.';
                }
                field("Posting Group Filter"; Rec."Posting Group Filter")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting Group Filter field.';
                }
                field("Initial Amount"; Rec."Initial Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Initial Amount field.';
                }
                field("Outstanding Amount"; Rec."Outstanding Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Outstanding Amount field.';
                }
                field("Basic Salary Code"; Rec."Basic Salary Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Basic Salary Code field.';
                }
                field("Payroll Group"; Rec."Payroll Group")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payroll Group field.';
                }
                field(Rank; Rec.Rank)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rank field.';
                }
                field("Payroll Grouping"; Rec."Payroll Grouping")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payroll Grouping field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000041; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000042; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000043; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        UserSetup.Get(UserId);

        if UserSetup."Payroll View" = false then
            Error('You do not have sufficient rights to view payroll!Please contact system administrator.');
    end;

    var
        UserSetup: Record "User Setup";
}

#pragma implicitwith restore

