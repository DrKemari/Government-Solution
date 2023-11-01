#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69355 "Medical Scheme Entitlements"
{
    ApplicationArea = Basic;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Salary Scales";
    UsageCategory = Administration;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Scale; Rec.Scale)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Scale field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("In Patient Limit"; Rec."In Patient Limit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the In Patient Limit field.';
                }
                field("Out Patient Limit"; Rec."Out Patient Limit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Out Patient Limit field.';
                }
                field("Maximum Cover"; Rec."Maximum Cover")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maximum Cover field.';
                }
                field("Maternity Limit"; Rec."Maternity Limit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maternity Limit field.';
                }
                field("Dental Limit"; Rec."Dental Limit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dental Limit field.';
                }
                field("Optical Limit"; Rec."Optical Limit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Optical Limit field.';
                }
                field("Bed Limit"; Rec."Bed Limit")
                {
                    ApplicationArea = Basic;
                    Caption = 'Bed Limit Net of NHIF Rebate per day';
                    ToolTip = 'Specifies the value of the Bed Limit Net of NHIF Rebate per day field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000010; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000011; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000012; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000013; Links)
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

