#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 75125 "IFS Tender Document Source"
{
    PageType = List;
    SourceTable = "IFS Tender Document Source";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Tender Source ID"; Rec."Tender Source ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender Source ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Url Link"; Rec."Url Link")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Url Link field.';
                }
                field("Date Published"; Rec."Date Published")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Published field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

