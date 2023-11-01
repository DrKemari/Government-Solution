#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 95013 "Risk Management Framework"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "Risk Management Framework";
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            group(General)
            {
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("External Document No"; Rec."External Document No")
                {
                    ApplicationArea = Basic;
                }
                field("Organization Name"; Rec."Organization Name")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Purpose"; Rec."Primary Purpose")
                {
                    ApplicationArea = Basic;
                }
                field("Overall Responsibility"; Rec."Overall Responsibility")
                {
                    ApplicationArea = Basic;
                }
                field("Last Revision Date"; Rec."Last Revision Date")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Risk Qualification/Measurements")
            {
                Caption = 'Risk Qualification/Measurements';
                field("Default Risk LR Scale ID"; Rec."Default Risk LR Scale ID")
                {
                    ApplicationArea = Basic;
                }
                field("Default Risk Impact R. Scale"; Rec."Default Risk Impact R. Scale")
                {
                    ApplicationArea = Basic;
                }
                field("Default Overall RR Scale ID"; Rec."Default Overall RR Scale ID")
                {
                    ApplicationArea = Basic;
                }
                field("Default Risk AR Scale ID"; Rec."Default Risk AR Scale ID")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Number Series")
            {
                Caption = 'Number Series';
                field("Corporate Risk Mgt Plan Nos."; Rec."Corporate Risk Mgt Plan Nos.")
                {
                    ApplicationArea = Basic;
                    Visible = true;
                }
                field("Functional Risk Mgt Plan Nos."; Rec."Functional Risk Mgt Plan Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Project Risk Mgt Plan Nos."; Rec."Project Risk Mgt Plan Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("Directorate Risk Mgt Plan Nos."; Rec."Directorate Risk Mgt Plan Nos.")
                {
                    ApplicationArea = Basic;
                    Caption = 'CEO''s Office Risk Mgt Plan Nos.';
                    Visible = true;
                }
                field("Departmenta Risk Mgt Plan Nos."; Rec."Departmenta Risk Mgt Plan Nos.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Divisional Risk Mgt Plan Nos.';
                }
                field("Regional Risk Mgt Plan Nos."; Rec."Regional Risk Mgt Plan Nos.")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                }
                field("Risk Incident Nos."; Rec."Risk Incident Nos.")
                {
                    ApplicationArea = Basic;
                }
                field("New Risk Voucher Nos"; Rec."New Risk Voucher Nos")
                {
                    ApplicationArea = Basic;
                }
                field("Status Report Nos"; Rec."Status Report Nos")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            part(Control34; "Risk Mgt Framework FactBox")
            {
                Caption = 'Risk Measurement & Control Statistics';
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(Overview)
            {
                ApplicationArea = Basic;
                Image = AddToHome;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Risk Mgt Framework Detail";
                RunPageView = where("RMF Section" = filter("RMF Overview"));
            }
            action("Purpose(Goals & Objectives)")
            {
                ApplicationArea = Basic;
                Image = Agreement;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Risk Mgt Framework Detail";
                RunPageView = where("RMF Section" = filter("Benefits/Importance"));
            }
            action("Guiding Principles")
            {
                ApplicationArea = Basic;
                Image = Agreement;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Risk Mgt Framework Detail";
                RunPageView = where("RMF Section" = filter("RMF Guiding Principle"));
            }
            action("Stakeholder Register")
            {
                ApplicationArea = Basic;
                Image = Stop;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page StakeHolders;
            }
            action("Risk Taxonomy")
            {
                ApplicationArea = Basic;
                Image = SuggestCapacity;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Risk Categories";
            }
            action("Risk Response Strategies")
            {
                ApplicationArea = Basic;
                Image = ServiceAgreement;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Risk Response Strategies";
            }
            action("Roles & Responsibilities")
            {
                ApplicationArea = Basic;
                Image = Restore;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Risk Management Roles";
            }
            action("Risk Identification Methods")
            {
                ApplicationArea = Basic;
                Image = Indent;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Risk Identification Methods";
            }
            action("Risk Likelihood Rating Scales")
            {
                ApplicationArea = Basic;
                Image = Production;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Risk Likelihood Rating Scales";
                RunPageView = where("Risk Rating Scale Type" = filter("Likelihood Rating"));
            }
            action("Risk Impact Rating Scales")
            {
                ApplicationArea = Basic;
                Image = AdjustItemCost;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Risk Impact Rating Scales";
                RunPageView = where("Risk Rating Scale Type" = filter("Impact Rating"));
            }
            action("Risk Overal Rating Scales")
            {
                ApplicationArea = Basic;
                Image = OrderList;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Risk Overall Rating Scales";
                RunPageView = where("Risk Rating Scale Type" = filter("Overall Risk Rating"));
            }
            action("Risk Appetite Rating Scales")
            {
                ApplicationArea = Basic;
                Image = Add;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Risk Appetite Rating Scales";
                RunPageView = where("Risk Rating Scale Type" = filter("Risk Appetite Rating"));
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.Reset;
                    Rec.SetRange("Primary Key", Rec."Primary Key");
                    Report.Run(95000, true, true, Rec);
                end;
            }
            action("Attach Documents")
            {
                ApplicationArea = Basic;
                Caption = 'Attach Approved RMF ';
                Image = Attach;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    //DMSManagement.FnUploadPurchaseInvoiceDocuments("Code",'Purchase Invoice',RECORDID);
                    // DMSManagement.FnUploadPurchaseInvoiceDocuments("Doc");

                    //CC
                    DMSManagement.FnUploaRMFDocuments(Rec."External Document No", Rec.Description, Rec.RecordId);
                end;
            }
        }
    }

    var
        DMSManagement: Codeunit "DMS Management";
}

#pragma implicitwith restore

