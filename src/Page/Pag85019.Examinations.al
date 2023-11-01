#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85019 "Examinations"
{
    ApplicationArea = Basic;
    DeleteAllowed = true;
    InsertAllowed = true;
    PageType = List;
    SourceTable = Courses;
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Description 2"; Rec."Description 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description 2 field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("No. of Levels"; Rec."No. of Levels")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Levels field.';
                }
                field("No. of Papers"; Rec."No. of Papers")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Papers field.';
                }
                field("No. of Exam Bookings"; Rec."No. of Exam Bookings")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Exam Bookings field.';
                }
                field("No. of Passed"; Rec."No. of Passed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Passed field.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Series field.';
                }
                field("Certificate Nos."; Rec."Certificate Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Certificate Nos. field.';
                }
                field("Exemption Reference Nos."; Rec."Exemption Reference Nos.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Exemption Reference Nos. field.';
                }
                field("Result Reference"; Rec."Result Reference")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Result Reference field.';
                }
                field("Paper Color"; Rec."Paper Color")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Paper Color field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Sponsors)
            {
                ApplicationArea = Basic;
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = New;
                RunObject = Page "Course Sponsors";
                RunPageLink = "Course Code" = field(Code);
                ToolTip = 'Executes the Sponsors action.';
            }
            action(Levels)
            {
                ApplicationArea = Basic;
                Image = Agreement;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page Levels;
                RunPageLink = Course = field(Code);
                ToolTip = 'Executes the Levels action.';
            }
            action(Papers)
            {
                ApplicationArea = Basic;
                Image = Answers;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page Subjects;
                RunPageLink = Course = field(Code);
                ToolTip = 'Executes the Papers action.';
            }
        }
    }
}

#pragma implicitwith restore

