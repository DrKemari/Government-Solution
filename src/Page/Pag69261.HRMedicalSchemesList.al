#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69261 "HR Medical Schemes List"
{
    ApplicationArea = Basic;
    CardPageID = "HR Medical Schemes Card";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "HR Medical Schemes";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Scheme No"; Rec."Scheme No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Scheme No field.';
                }
                field("Medical Insurer"; Rec."Medical Insurer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Medical Insurer field.';
                }
                field("Scheme Name"; Rec."Scheme Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Scheme Name field.';
                }
                field("In-patient limit"; Rec."In-patient limit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the In-patient limit field.';
                }
                field("Out-patient limit"; Rec."Out-patient limit")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Out-patient limit field.';
                }
                field("Area Covered"; Rec."Area Covered")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Area Covered field.';
                }
                field("Dependants Included"; Rec."Dependants Included")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Dependants Included field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

