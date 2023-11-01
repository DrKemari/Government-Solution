#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80335 "BR Template Line"
{
    PageType = ListPart;
    SourceTable = "BR Template Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Section ID"; Rec."Section ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Section ID field.';
                }
                field("Question ID"; Rec."Question ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Question ID field.';
                }
                field(Question; Rec.Question)
                {
                    ApplicationArea = Basic;
                    Caption = 'Question';
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
                field("Parent Question ID"; Rec."Parent Question ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Parent Question ID field.';
                }
                field("No. of Branch Logic Conditions"; Rec."No. of Branch Logic Conditions")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the No. of Branch Logic Conditions field.';
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
            action("Template Score Guide")
            {
                ApplicationArea = Basic;
                Image = AddAction;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Template Score GuideSPM";
                RunPageLink = "Template ID" = field("Template ID"),
                              "Section ID" = field("Section ID"),
                              "Question ID" = field("Question ID");
                ToolTip = 'Executes the Template Score Guide action.';
            }
            action("BR Template Line Branch Logic")
            {
                ApplicationArea = Basic;
                Image = AddWatch;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "BR Template Line Branch Logic";
                RunPageLink = "Template ID" = field("Template ID"),
                              "Section ID" = field("Section ID"),
                              "Parent Question ID" = field("Question ID");
                ToolTip = 'Executes the BR Template Line Branch Logic action.';
            }
        }
    }
}

#pragma implicitwith restore

