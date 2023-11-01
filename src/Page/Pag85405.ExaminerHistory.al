#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85405 "Examiner History"
{
    PageType = List;
    SourceTable = "Examiner History";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Examiner Name"; Rec."Examiner Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Examiner Name field.';
                }
                field("Category Code"; Rec."Category Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Category Code field.';
                }
                field("Category Name"; Rec."Category Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Category Name field.';
                }
                field("Examiner Domain"; Rec."Examiner Domain")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Examiner Domain field.';
                }
                field("Examiner Domain Name"; Rec."Examiner Domain Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Examiner Domain Name field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control11; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control12; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control13; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control14; Links)
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

