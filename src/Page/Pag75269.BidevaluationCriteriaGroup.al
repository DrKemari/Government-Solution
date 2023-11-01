#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 75269 "Bid evaluation Criteria Group"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Bid Evaluation Criteria Group";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Template ID"; Rec."Template ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Template ID field.';
                }
                field("Criteria Group ID"; Rec."Criteria Group ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Criteria Group ID field.';
                }
                field("Evaluation Type"; Rec."Evaluation Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluation Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Total Weight %"; Rec."Total Weight %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Weight % field.';
                }
                field("No of Scored Criteria Groups"; Rec."No of Scored Criteria Groups")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No of Scored Criteria Groups field.';
                }
                field("No of Criteria Croups"; Rec."No of Criteria Croups")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No of Criteria Croups field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

