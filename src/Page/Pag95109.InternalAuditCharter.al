#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 95109 "Internal Audit Charter"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "Internal Audit Charter";
    UsageCategory = Administration;

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
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the External Document No. field.';
                }
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Effective Date field.';
                }
                field(Overview; Rec.Overview)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Overview field.';
                }
                field("CAE ID"; Rec."CAE ID")
                {
                    ApplicationArea = Basic;
                    TableRelation = "Risk & Audit Officer";
                    ToolTip = 'Specifies the value of the CAE ID field.';
                }
                field("CAE  Name"; Rec."CAE Name")
                {
                    ApplicationArea = Basic;
                    TableRelation = "Risk & Audit Officer";
                    ToolTip = 'Specifies the value of the CAE Name field.';
                }
                field("CAE Directly Reports-To"; Rec."CAE Directly Reports-To")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the CAE Directly Reports-To field.';
                }
                field("CAE Indirectly Reports-To"; Rec."CAE Indirectly Reports-To")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the CAE Indirectly Reports-To field.';
                }
                field("Approved By"; Rec."Approved By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approved By field.';
                }
            }
            part(Control13; "Internal Charter Component Lin")
            {
                Caption = 'Internal Audit Roles & Responsibilities';
                SubPageLink = "Component Type" = filter(Responsibility);
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(Mission)
            {
                ApplicationArea = Basic;
                Image = AccountingPeriods;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Charter Components";
                RunPageView = where("Component Type" = filter(Mission));
                ToolTip = 'Executes the Mission action.';
            }
            action(Purpose)
            {
                ApplicationArea = Basic;
                Image = Accounts;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Charter Components";
                RunPageView = where("Component Type" = filter(Purpose));
                ToolTip = 'Executes the Purpose action.';
            }
            action("Standards & Code Of Ethics")
            {
                ApplicationArea = Basic;
                Image = Allocate;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Charter Components";
                RunPageView = where("Component Type" = filter(Standards));
                ToolTip = 'Executes the Standards & Code Of Ethics action.';
            }
            action(Authority)
            {
                ApplicationArea = Basic;
                Image = AdjustItemCost;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Charter Components";
                RunPageView = where("Component Type" = filter(Authority));
                ToolTip = 'Executes the Authority action.';
            }
            action("Independence & Objectivity")
            {
                ApplicationArea = Basic;
                Image = Agreement;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Charter Components";
                RunPageView = where("Component Type" = filter(Independence));
                ToolTip = 'Executes the Independence & Objectivity action.';
            }
            action(Scope)
            {
                ApplicationArea = Basic;
                Image = Alerts;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Charter Components";
                RunPageView = where("Component Type" = filter(Scope));
                ToolTip = 'Executes the Scope action.';
            }
            action("QA & Improvement Program")
            {
                ApplicationArea = Basic;
                Caption = 'Quality Assurance & Improvement Program';
                Image = AutofillQtyToHandle;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Audit Charter Components";
                RunPageView = where("Component Type" = filter("Quality Assurance"));
                ToolTip = 'Executes the Quality Assurance & Improvement Program action.';
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Caption = 'Print';
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Print action.';
                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange(Code, Rec.Code);
                    Report.Run(95013, true, true);
                end;
            }
            action("Attach Documents")
            {
                ApplicationArea = Basic;
                Caption = 'Attach Approved IA Charter';
                Image = Attach;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;
                ToolTip = 'Executes the Attach Approved IA Charter action.';
                trigger OnAction()
                begin
                    DMSDocument.FnUploaIACharterDocuments(Rec.Code, Rec.Description, Rec.RecordId);
                end;
            }
        }
    }

    var
        DMSDocument: Codeunit "DMS Management";
}

#pragma implicitwith restore

