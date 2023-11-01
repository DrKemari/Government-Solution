#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72113 "Contract Evaluation Line"
{
    PageType = ListPart;
    SourceTable = "Contract Evaluation Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Project No"; Rec."Project No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project No field.';
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field(Item; Rec.Item)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Item field.';
                }
                field("No of Months"; Rec."No of Months")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No of Months field.';
                }
                field(Jan; Rec.Jan)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Jan field.';
                }
                field(Feb; Rec.Feb)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Feb field.';
                }
                field(Mar; Rec.Mar)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mar field.';
                }
                field(April; Rec.April)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the April field.';
                }
                field(May; Rec.May)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the May field.';
                }
                field(June; Rec.June)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the June field.';
                }
                field(July; Rec.July)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the July field.';
                }
                field(August; Rec.August)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the August field.';
                }
                field(Septemeber; Rec.Septemeber)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Septemeber field.';
                }
                field(October; Rec.October)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the October field.';
                }
                field(November; Rec.November)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the November field.';
                }
                field(December; Rec.December)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the December field.';
                }
                field(Year; Rec.Year)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Year field.';
                }
                field("Total Pass"; Rec."Total Pass")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Pass field.';
                }
                field("Total Month"; Rec."Total Month")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Month field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

