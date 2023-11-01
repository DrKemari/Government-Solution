#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 65038 "Grant Research Team list"
{
    CardPageID = "Grant Research Team Card";
    Editable = false;
    PageType = List;
    SourceTable = "Grant Research Team";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Grant Opportunity ID"; Rec."Grant Opportunity ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grant Opportunity ID field.';
                }
                field("Researcher ID"; Rec."Researcher ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Researcher ID field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Primary Role"; Rec."Primary Role")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Role field.';
                }
                field("Role Description"; Rec."Role Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Role Description field.';
                }
                field("Grant Name"; Rec."Grant Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grant Name field.';
                }
                field(Grantor; Rec.Grantor)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grantor field.';
                }
                field("Funding Decision"; Rec."Funding Decision")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Funding Decision field.';
                }
                field("Requested Amount(LCY)"; Rec."Requested Amount(LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requested Amount(LCY) field.';
                }
                field("Awarded Amount(LCY)"; Rec."Awarded Amount(LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Awarded Amount(LCY) field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

