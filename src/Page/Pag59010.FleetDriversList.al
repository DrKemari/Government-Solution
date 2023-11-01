#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 59010 "Fleet Drivers List"
{
    ApplicationArea = Basic;
    CardPageID = "Fleet Driver Card";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Vehicle Drivers";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Driver; Rec.Driver)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Driver field.';
                }
                field("Driver Name"; Rec."Driver Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Driver Name field.';
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gender field.';
                }
                field("Center/Department"; Rec."Center/Department")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Center/Department field.';
                }
                field("Job Title Description"; Rec."Job Title Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Title Description field.';
                }
                field("Job Grade"; Rec.Grade)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grade field.';
                }
                field("Employement Date"; Rec."Employement Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employement Date field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field("Phone Number"; Rec."Phone Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone Number field.';
                }
                field("Driver License Number"; Rec."Driver License Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Driver License Number field.';
                }
                field("Last License Renewal"; Rec."Last License Renewal")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last License Renewal field.';
                }
                field("Renewal Interval"; Rec."Renewal Interval")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Renewal Interval field.';
                }
                field("Renewal Interval Value"; Rec."Renewal Interval Value")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Renewal Interval Value field.';
                }
                field("Next License Renewal"; Rec."Next License Renewal")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Next License Renewal field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

