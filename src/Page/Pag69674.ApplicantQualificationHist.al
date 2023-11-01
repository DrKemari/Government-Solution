#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69674 "Applicant Qualification Hist"
{
    PageType = List;
    SourceTable = "Applicant Qualification Histor";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Candidate No."; Rec."Candidate No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Candidate No. field.';
                }
                field("Qualification Line No."; Rec."Qualification Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qualification Line No. field.';
                }
                field("Qualification Code"; Rec."Qualification Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Qualification Code field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No. field.';
                }
                field("Experience Category"; Rec."Experience Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Experience Category field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("From Date"; Rec."From Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the From Date field.';
                }
                field("To Date"; Rec."To Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the To Date field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

