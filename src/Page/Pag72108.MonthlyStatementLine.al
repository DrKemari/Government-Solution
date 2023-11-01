#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72108 "Monthly Statement Line"
{
    PageType = ListPart;
    SourceTable = "Monthly Statement Line";

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
                field("Contract No"; Rec."Contract No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract No field.';
                }
                field("Contract Name"; Rec."Contract Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Contract Name field.';
                }
                field("Description Of Works"; Rec."Description Of Works")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description Of Works field.';
                }
                field("Prevoius Certificate"; Rec."Prevoius Certificate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Prevoius Certificate field.';
                }
                field("This Certificate"; Rec."This Certificate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the This Certificate field.';
                }
                field(Total; Rec.Total)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

