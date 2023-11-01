#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69523 "Document Mailing List"
{
    ApplicationArea = Basic;
    CardPageID = "Document mailing Header";
    PageType = List;
    SourceTable = "Mailing frequency";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Report No."; Rec."Report No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Report No. field.';
                }
                field("Report Name"; Rec."Report Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Report Name field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("Mail Frequency"; Rec."Mail Frequency")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mail Frequency field.';
                }
                field("Last Mail Date"; Rec."Last Mail Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Last Mail Date field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

