#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 59055 "Grant Applicants subform"
{
    Editable = false;
    PageType = ListPart;
    SourceTable = "Internal Grants Application";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("PI No"; Rec."PI No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PI No field.';
                }
                field("PI Name"; Rec."PI Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the PI Name field.';
                }
                field("Amount Applied"; Rec."Amount Applied")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount Applied field.';
                }
                field("Application Send"; Rec."Application Send")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Send field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

