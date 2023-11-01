#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80172 "Policy Information Sources"
{
    PageType = List;
    SourceTable = "Policy Information Sources";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Source Type"; Rec."Source Type")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("URL Link"; Rec."URL Link")
                {
                    ApplicationArea = Basic;
                    ExtendedDatatype = URL;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

