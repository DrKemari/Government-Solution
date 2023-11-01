#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69132 "Closed Interview Lines"
{
    ApplicationArea = Basic;
    PageType = ListPart;
    SourceTable = "Shortlisting Lines";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Employ; Rec.Employ)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employ field.';
                }
                field("Application No"; Rec."Application No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application No field.';
                }
                field("Full Name"; Rec."Full Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Full Name field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field("Interview Location"; Rec."Interview Location")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interview Location field.';
                }
                field("Interview Date"; Rec."Interview Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interview Date field.';
                }
                field("Interview Time"; Rec."Interview Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interview Time field.';
                }
                field("Interview Due Date"; Rec."Interview Due Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Interview Due Date field.';
                }
                field("Written Interview Score"; Rec."Written Interview Score")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Written Interview Score field.';
                }
                field("Apptitude Interview Score"; Rec."Apptitude Interview Score")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Apptitude Interview Score field.';
                }
                field("Oral Interview Score"; Rec."Oral Interview Score")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Oral Interview Score field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

