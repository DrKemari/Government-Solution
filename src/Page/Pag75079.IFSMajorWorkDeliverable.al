#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 75079 "IFS Major Work_Deliverable"
{
    PageType = List;
    SourceTable = "IFS Major Work_Deliverable";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field("Major Activity Description"; Rec."Major Activity Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Major Activity Description field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

