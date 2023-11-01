#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85351 "Draft Syllabus Papers"
{
    PageType = ListPart;
    SourceTable = "Syllabus Papers";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Part"; Rec.Part)
                {
                    ApplicationArea = Basic;
                    Caption = 'Levels/Modules';
                    ToolTip = 'Specifies the value of the Levels/Modules field.';
                }
                field(Section; Rec.Section)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Section field.';
                }
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
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Paper Details")
            {
                ApplicationArea = Basic;
                Image = AllLines;
                RunObject = Page "Draft Syllabus Lines";
                RunPageLink = "Syllabus No." = field("Syllabus No."),
                              "Paper Code" = field("Paper Code");
                ToolTip = 'Executes the Paper Details action.';
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::Draft;
    end;
}

#pragma implicitwith restore

