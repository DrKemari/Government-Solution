#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51567 "Audit Resources"
{
    PageType = List;
    SourceTable = "Audit Resource";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("No. Of Sections"; Rec."No. Of Sections")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Of Sections field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control7; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control8; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control9; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control10; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Review Sections")
            {
                ApplicationArea = Basic;
                Image = Allocate;
                Promoted = true;
                RunObject = Page "Resource Sections Setup";
                RunPageLink = "Resource Category" = field(Code);
                ToolTip = 'Executes the Review Sections action.';
            }
        }
    }
}

#pragma implicitwith restore

