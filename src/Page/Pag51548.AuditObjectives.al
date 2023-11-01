#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 51548 "Audit Objectives"
{
    PageType = List;
    //SourceTable = "Audit Plan Line Objective";

    layout
    {
        // area(content)
        // {
        //     repeater(Group)
        //     {
        //         field(Description; Description)
        //         {
        //             ApplicationArea = Basic;
        //             ToolTip = 'Specifies the value of the Description field.';
        //         }
        //     }
        // }
        area(factboxes)
        {
            systempart(Control5; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control6; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control7; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control8; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

