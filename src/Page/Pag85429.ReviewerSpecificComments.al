#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85429 "Reviewer Specific Comments"
{
    PageType = ListPart;
    SourceTable = "Examination Review Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Question No."; Rec."Question No.")
                {
                    ApplicationArea = Basic;
                }
                field("Topic Code"; Rec."Topic Code")
                {
                    ApplicationArea = Basic;
                }
                field("Topic Name"; Rec."Topic Name")
                {
                    ApplicationArea = Basic;
                }
                field(References; Rec.References)
                {
                    ApplicationArea = Basic;
                }
                field("Knowledge and Comprehension"; Rec."Knowledge and Comprehension")
                {
                    ApplicationArea = Basic;
                }
                field("Application and Analysis"; Rec."Application and Analysis")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation and Creativity"; Rec."Evaluation and Creativity")
                {
                    ApplicationArea = Basic;
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                }
                field("Action Taken"; Rec."Action Taken")
                {
                    ApplicationArea = Basic;
                    Caption = 'Action Taken';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

