#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57305 "Employee Handover Lines"
{
    PageType = ListPart;
    SourceTable = "Employee Handover Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Serial No"; Rec."Serial No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Serial No field.';
                }
                field("New Employee No"; Rec."New Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Employee No field.';
                }
                field("New Employee Name"; Rec."New Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Employee Name field.';
                }
                field("New Employee Start Date"; Rec."New Employee Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Employee Start Date field.';
                }
                field("New Employee End Date"; Rec."New Employee End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the New Employee End Date field.';
                }
                field("Handover/Return"; Rec."Handover/Return")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Handover/Return field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

