#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51401 "Application Chapter 5"
{
    PageType = ListPart;
    SourceTable = "Application Response";
    SourceTableView = where("Chapter Code" = const('005'));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Question Code"; Rec."Question Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Question Code field.';
                }
                field("Accreditation Question"; Rec."Accreditation Question")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Accreditation Question field.';
                }
                field("Question Type"; Rec."Question Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Question Type field.';
                }
                field("Accreditation Answers"; Rec."Accreditation Answers")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Accreditation Answers field.';
                }
                field(Response; Rec.Response)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Response field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Application Sub-Questions")
            {
                ApplicationArea = Basic;
                Image = SubcontractingWorksheet;
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = true;
                RunObject = Page "SubQuestions Response";
                RunPageLink = "Application No." = field("Application No."),
                              "Question Code" = field("Question Code");
                ToolTip = 'Executes the Application Sub-Questions action.';
            }
        }
    }
}

#pragma implicitwith restore

