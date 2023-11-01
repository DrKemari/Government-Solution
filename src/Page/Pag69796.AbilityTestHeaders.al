#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 69796 "Ability Test Headers"
{
    ApplicationArea = Basic;
    Caption = 'Ability Test Headers';
    CardPageID = "Ability Test Header";
    PageType = List;
    SourceTable = "PreScreen Header";
    SourceTableView = where("Document Type" = filter("Ability Test Invitation"));
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Vacancy ID"; Rec."Vacancy ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vacancy ID field.';
                }
                field("Lead HR Officer"; Rec."Lead HR Officer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Lead HR Officer field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Ability Test ID"; Rec."Ability Test ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ability Test ID field.';
                }
                field("Maximum Test Duration(Min)"; Rec."Maximum Test Duration(Min)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maximum Test Duration(Min) field.';
                }
                field("Phone Interview Template ID"; Rec."Phone Interview Template ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone Interview Template ID field.';
                }
                field("Position ID"; Rec."Position ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Position ID field.';
                }
                field("Job Title/Designation"; Rec."Job Title/Designation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Job Title/Designation field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control14; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control15; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control16; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control17; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

