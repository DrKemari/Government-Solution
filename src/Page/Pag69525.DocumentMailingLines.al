#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69525 "Document Mailing Lines"
{
    PageType = ListPart;
    SourceTable = "Document Mailing Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee Name field.';
                }
                field("E-Mail Address"; Rec."E-Mail Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the E-Mail Address field.';
                }
                field("Mailing Format"; Rec."Mailing Format")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mailing Format field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

