#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80066 "Competency"
{
    PageType = Card;
    SourceTable = Competency;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Competency Summary"; Rec."Competency Summary")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Competency Summary field.';
                }
                field("Competency Category"; Rec."Competency Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Competency Category field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

