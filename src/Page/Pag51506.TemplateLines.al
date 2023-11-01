#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51506 "Template Lines"
{
    PageType = ListPart;
    SourceTable = "SAR  Template Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Section ID"; Rec."Section ID")
                {
                    ApplicationArea = Basic;
                }
                field("Section Name"; Rec."Section Name")
                {
                    ApplicationArea = Basic;
                }
                field("Question ID"; Rec."Question ID")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        Questions.Reset;
                        if Questions.Get(Rec."Question ID") then begin
                            Rec."Question Type" := Questions."Question Type";
                        end;
                    end;
                }
                field("Question Description"; Rec."Question Description")
                {
                    ApplicationArea = Basic;
                }
                field("Question Type"; Rec."Question Type")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Sub-Questions")
            {
                ApplicationArea = Basic;
                RunObject = Page "SAR Sub-Questions";
                RunPageLink = "Question Code"=field("Question ID");
            }
        }
    }

    var
        Questions: Record "SAR Question Setup";
}

#pragma implicitwith restore

