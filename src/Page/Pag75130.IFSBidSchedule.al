#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 75130 "IFS Bid Schedule"
{
    PageType = List;
    SourceTable = "RFI Bid Schedule";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field("Activity Category"; Rec."Activity Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Activity Category field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Date field.';
                }
                field("Start Time"; Rec."Start Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Start Time field.';
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Date field.';
                }
                field("End Time"; Rec."End Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the End Time field.';
                }
                field("Activity Status"; Rec."Activity Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Activity Status field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

