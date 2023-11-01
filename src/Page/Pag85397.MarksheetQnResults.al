#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85397 "Marksheet Qn Results"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Marksheet Qn Results";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Paper Code"; Rec."Paper Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Paper Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Question No"; Rec."Question No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Question No field.';
                }
                field("Question Description"; Rec."Question Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Question Description field.';
                }
                field(Results; Rec.Results)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Results field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control9; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control10; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control11; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control12; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

