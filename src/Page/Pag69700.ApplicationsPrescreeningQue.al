#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69700 "Applications Pre-screening Que"
{
    PageType = List;
    SourceTable = "Applications Prescreening Ques";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Pre-screening Stage"; Rec."Pre-screening Stage")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Pre-screening Stage field.';
                }
                field("Question ID"; Rec."Question ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Question ID field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Question Type"; Rec."Question Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Question Type field.';
                }
                field("Close Ended Sub-type"; Rec."Close Ended Sub-type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Close Ended Sub-type field.';
                }
                field("Response Option"; Rec."Response Option")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Response Option field.';
                }
                field("Number Response"; Rec."Number Response")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Number Response field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control13; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control14; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control15; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control16; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Application Pre-screening Note")
            {
                ApplicationArea = Basic;
                Caption = 'Application Pre-screening Note';
                RunObject = Page "Application Pre-screening Note";
                RunPageLink = "Application No." = field("Application No."),
                              "Question ID" = field("Question ID");
                ToolTip = 'Executes the Application Pre-screening Note action.';
            }
        }
    }
}

#pragma implicitwith restore

