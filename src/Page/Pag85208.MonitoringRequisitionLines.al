#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85208 "Monitoring Requisition Lines"
{
    PageType = ListPart;
    SourceTable = "Monitoring Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Component Code"; Rec."Component Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Area Code';
                    ToolTip = 'Specifies the value of the Area Code field.';
                }
                field("Component Description"; Rec."Component Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Area Name';
                    ToolTip = 'Specifies the value of the Area Name field.';
                }
                field("Sub-Component Code"; Rec."Sub-Component Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Sub-Area Code';
                    ToolTip = 'Specifies the value of the Sub-Area Code field.';
                }
                field("Sub-Component Description"; Rec."Sub-Component Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Sub-Area Name';
                    ToolTip = 'Specifies the value of the Sub-Area Name field.';
                }
                field("Maximum Score"; Rec."Maximum Score")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maximum Score field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

