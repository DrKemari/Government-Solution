#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69446 "OSH legal Instrument Lines"
{
    PageType = ListPart;
    SourceTable = "OSH legal Instrument Line";

    layout
    {
        area(content)
        {
            field("Legal Instrument ID"; Rec."Legal Instrument ID")
            {
                ApplicationArea = Basic;
                Visible = false;
                ToolTip = 'Specifies the value of the Legal Instrument ID field.';
            }
            field("Line No."; Rec."Line No.")
            {
                ApplicationArea = Basic;
                Editable = false;
                ToolTip = 'Specifies the value of the Line No. field.';
            }
            field(Description; Rec.Description)
            {
                ApplicationArea = Basic;
                ToolTip = 'Specifies the value of the Description field.';
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

