#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 75271 "Finance Evaluation Line"
{
    PageType = ListPart;
    SourceTable = "Finance Evaluation Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Bidder No"; Rec."Bidder No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bidder No field.';
                }
                field("Bidder Name"; Rec."Bidder Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bidder Name field.';
                }
                field("Final Evaluated Bid Price"; Rec."Final Evaluated Bid Price")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Final Evaluated Bid Price field.';
                }
                field("Read-out Bid Price (A)"; Rec."Read-out Bid Price (A)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Read-out Bid Price (A) field.';
                }
                field("Weighted Tech Score %"; Rec."Weighted Tech Score %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Weighted Tech Score % field.';
                }
                field("Tech Evaluation Ranking"; Rec."Tech Evaluation Ranking")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tech Evaluation Ranking field.';
                }
                field("Financial Evaluation Date"; Rec."Financial Evaluation Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Financial Evaluation Date field.';
                }
                field("Financial Evaluation Ranking"; Rec."Financial Evaluation Ranking")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Financial Evaluation Ranking field.';
                }
                field("Weighted Financial Score %"; Rec."Weighted Financial Score %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Weighted Financial Score % field.';
                }
                field("Aggregate Weighted Score %"; Rec."Aggregate Weighted Score %")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Aggregate Weighted Score % field.';
                }
                field("Arithmetic Corrections (B)"; Rec."Arithmetic Corrections (B)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Arithmetic Corrections (B) field.';
                }
                field("Corrected Bid Price"; Rec."Corrected Bid Price")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Corrected Bid Price field.';
                }
                field("Evaluation Committee Remarks"; Rec."Evaluation Committee Remarks")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Evaluation Committee Remarks (Financial Evaluation) field.';
                }
                field("Evaluation Committee Recomm"; Rec."Evaluation Committee Recomm")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                    ToolTip = 'Specifies the value of the Evaluation Committee Recomm field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

