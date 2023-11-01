#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 56066 "Internal Memo"
{
    PageType = Card;
    SourceTable = "Internal Memos";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(RE; Rec.RE)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the RE field.';
                }
                field("Employee UserID"; Rec."Employee UserID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the UserID field.';
                }
                field(From; Rec.From)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the From field.';
                }
                field("To CEO"; Rec."To CEO")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the To field.';
                }
                field(Through; Rec.Through)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Through field.';
                }
                field("Paragraph 1"; Rec."Paragraph 1")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Paragraph 1 field.';
                }
                field("Paragraph 2"; Rec."Paragraph 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Paragraph 2 field.';
                }
                field("Prepared By Date"; Rec."Prepared By Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Prepared By Date field.';
                }
                field("Approved By"; Rec."Approved By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approved By field.';
                }
                field("CEO Approval"; Rec."CEO Approval")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the CEO Approval field.';
                }
                field("Approved By Date"; Rec."Approved By Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approved By Date field.';
                }
                field("CEO Approval Date"; Rec."CEO Approval Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the CEO Approval Date field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Title field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("CEO Comments"; Rec."CEO Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the CEO Comments field.';
                }
                field("HOD ID"; Rec."HOD ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the HOD ID field.';
                }
            }
            part(Control21; "Memo Lines")
            {
                SubPageLink = Code = field(Code);
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(Print)
            {
                ApplicationArea = Basic;
                Image = PrintReport;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    Rec.SetRange(Code, Rec.Code);
                    Report.Run(56237, true, true, Rec);
                end;
            }
        }
    }
}

#pragma implicitwith restore

