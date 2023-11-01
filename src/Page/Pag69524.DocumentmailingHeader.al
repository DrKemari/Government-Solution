#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69524 "Document mailing Header"
{
    PageType = Card;
    SourceTable = "Mailing frequency";

    layout
    {
        area(content)
        {
            group(General)
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
                field("Attachments File Path"; Rec."Attachments File Path")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Attachments File Path field.';
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
            part(Control8; "Document Mailing Lines")
            {
                SubPageLink = "Report No." = field("Report No.");
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

