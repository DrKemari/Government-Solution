#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72100 "Compliance Documents"
{
    PageType = List;
    SourceTable = "Compliance Documents";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field(Document; Rec.Document)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document field.';
                }
                field(Appendix; Rec.Appendix)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appendix field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

