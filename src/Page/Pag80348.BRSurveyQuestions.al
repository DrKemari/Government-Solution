#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80348 "BR Survey Questions"
{
    PageType = List;
    SourceTable = "BR Survey Question";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Survey ID"; Rec."Survey ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Survey ID field.';
                }
                field("Section Code"; Rec."Section Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Section Code field.';
                }
                field("Question ID"; Rec."Question ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Question ID field.';
                }
                field(Question; Rec.Question)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Question field.';
                }
                field("Question Type"; Rec."Question Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Question Type field.';
                }
                field("Rating Type"; Rec."Rating Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Rating Type field.';
                }
                field("Response Type"; Rec."Response Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Response Type field.';
                }
                field("Option Text Response Type"; Rec."Option Text Response Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Option Text Response Type field.';
                }
                field("Assigned Weight %"; Rec."Assigned Weight %")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Assigned Weight % field.';
                }
                field("Desired Perfomance Direction"; Rec."Desired Perfomance Direction")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Desired Perfomance Direction field.';
                }
                field("Branch Logic Question"; Rec."Branch Logic Question")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Branch Logic Question field.';
                }
                field("No. of Branch Logic Conditions"; Rec."No. of Branch Logic Conditions")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the No. of Branch Logic Conditions field.';
                }
                field("Parent Question ID"; Rec."Parent Question ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Parent Question ID field.';
                }
                field(Mandatory; Rec.Mandatory)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mandatory field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("BR Survey Score Guide")
            {
                ApplicationArea = Basic;
                Image = Document;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "BR Survey Score Guide";
                RunPageLink = "Survey ID" = field("Survey ID"),
                              "Section Code" = field("Section Code"),
                              "Question ID" = field("Question ID");
                ToolTip = 'Executes the BR Survey Score Guide action.';
            }
            action("Branch Survey Question")
            {
                ApplicationArea = Basic;
                Image = "Action";
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "BR Branch Survey Question";
                RunPageLink = "Survey ID" = field("Survey ID"),
                              "Section Code" = field("Section Code"),
                              "Parent Question ID" = field("Question ID");
                ToolTip = 'Executes the Branch Survey Question action.';
            }
        }
    }
}

#pragma implicitwith restore

