#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69282 "Processe Training Applications"
{
    ApplicationArea = Basic;
    CardPageID = "Closed Training Application";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Training Requests";
    SourceTableView = where(Status = filter(Closed));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field("Course Title"; Rec."Course Title")
                {
                    ApplicationArea = Basic;
                    StyleExpr = true;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("Start DateTime"; Rec."Start DateTime")
                {
                    ApplicationArea = Basic;
                }
                field("End DateTime"; Rec."End DateTime")
                {
                    ApplicationArea = Basic;
                }
                field(Cost; Rec.Cost)
                {
                    ApplicationArea = Basic;
                    Caption = 'Estimated Cost';
                }
                field("Total Procurement Cost"; Rec."Total Procurement Cost")
                {
                    ApplicationArea = Basic;
                }
                field(Provider; Rec."Planned Budget")
                {
                    ApplicationArea = Basic;
                }
                field("Total Per diem Costs"; Rec."Total Per diem Costs")
                {
                    ApplicationArea = Basic;
                }
                field("Budget Name"; Rec."Budget Name")
                {
                    ApplicationArea = Basic;
                    Style = Strong;
                    StyleExpr = true;
                }
            }
        }
        area(factboxes)
        {
            part(Control1102755002; "Trainings Factbox")
            {
                SubPageLink = Code = field(Code);
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(reporting)
        {
            action("Training Applications List")
            {
                ApplicationArea = Basic;
                Caption = 'Training Applications List';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                //  RunObject = Report UnknownReport39005603;
            }
            action("Training Applications")
            {
                ApplicationArea = Basic;
                Caption = 'Training Applications';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                //    RunObject = Report UnknownReport39005580;
            }
            action(Attachments)
            {
                ApplicationArea = All;
                Caption = 'Upload Documents';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Category9;
                ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                trigger OnAction()
                var
                    DocumentAttachmentDetails: Page "Document Attachment Details";
                    RecRef: RecordRef;
                begin
                    RecRef.GetTable(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.RunModal;
                end;
            }
        }
    }
}

#pragma implicitwith restore

