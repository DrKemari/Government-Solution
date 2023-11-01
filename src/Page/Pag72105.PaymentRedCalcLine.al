#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72105 "Payment Red. Calc. Line"
{
    PageType = ListPart;
    SourceTable = "Payment Red. Calc. Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field("Project Code"; Rec."Project Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Code field.';
                }
                field("Project Name"; Rec."Project Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project Name field.';
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field(Service; Rec.Service)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Service field.';
                }
                field("Service Scope"; Rec."Service Scope")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Service Scope field.';
                }
                field("Contract Road Length(km)"; Rec."Contract Road Length(km)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Road Length(km) field.';
                }
                field("Required Target(%)"; Rec."Required Target(%)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Required Target(%) field.';
                }
                field("Target Length(Km)"; Rec."Target Length(Km)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Target Length(Km) field.';
                }
                field("Exemption Length(Km)"; Rec."Exemption Length(Km)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Exemption Length(Km) field.';
                }
                field("Non-Compliant Length(Km)"; Rec."Non-Compliant Length(Km)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Non-Compliant Length(Km) field.';
                }
                field("Adjusted Non-Compliant Lenth"; Rec."Adjusted Non-Compliant Lenth")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Adjusted Non-Compliant Lenth field.';
                }
                field("Non-Compliant Rate(%)"; Rec."Non-Compliant Rate(%)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Non-Compliant Rate(%) field.';
                }
                field("Reduction Weight(%)"; Rec."Reduction Weight(%)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reduction Weight(%) field.';
                }
                field("Reduction Rate(%)"; Rec."Reduction Rate(%)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reduction Rate(%) field.';
                }
                field("Reduction Length(Km)"; Rec."Reduction Length(Km)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reduction Length(Km) field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

