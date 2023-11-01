#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51343 "Accreditation Trainers"
{
    PageType = ListPart;
    SourceTable = "Accreditation Trainers";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Course Code"; Rec."Course Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Course Code field.';
                }
                field("Course Section"; Rec."Course Section")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Course Section field.';
                }
                field("No. of Parttime Trainers"; Rec."No. of Parttime Trainers")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Parttime Trainers field.';
                }
                field("No. of Fulltime Trainers"; Rec."No. of Fulltime Trainers")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Fulltime Trainers field.';
                }
                field("Highest Trainer Qualification"; Rec."Highest Trainer Qualification")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Highest Trainer Qualification field.';
                }
                field("Lowest Trainer Qualification"; Rec."Lowest Trainer Qualification")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Lowest Trainer Qualification field.';
                }
                field("Highest Trainer experience"; Rec."Highest Trainer experience")
                {
                    ApplicationArea = Basic;
                    Caption = 'Highest Trainers'' experience(Years)';
                    ToolTip = 'Specifies the value of the Highest Trainers'' experience(Years) field.';
                }
                field("Lowest Trainer experience"; Rec."Lowest Trainer experience")
                {
                    ApplicationArea = Basic;
                    Caption = 'Lowest Trainers'' experience';
                    ToolTip = 'Specifies the value of the Lowest Trainers'' experience field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

