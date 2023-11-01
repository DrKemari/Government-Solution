#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51516 "Programme Audit Response"
{
    Caption = 'Programme Audit Response';
    DeleteAllowed = false;
    InsertAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Report,Stakeholder Details,Programme SAR Components,Teaching and Learning Strategy,Student Assessment,Teaching Staff,Support Staff,Student Profile';
    SourceTable = "Audit Requisition Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field("Response No."; Rec."Response No.")
                {
                    ApplicationArea = Basic;
                }
                field("Insitution/Programme No."; Rec."Insitution/Programme No.")
                {
                    ApplicationArea = Basic;
                }
                field("Programme Name"; Rec."Programme Name")
                {
                    ApplicationArea = Basic;
                }
                field("Domain Name"; Rec."Domain Name")
                {
                    ApplicationArea = Basic;
                }
                field("Institution Name"; Rec."Institution Name")
                {
                    ApplicationArea = Basic;
                }
                field("Institution Email"; Rec."Institution Email")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Audit Plan No."; Rec."Audit Plan No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Audit Plan Start Date"; Rec."Audit Plan Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Audit Plan End Date"; Rec."Audit Plan End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Expected Submission End Date"; Rec."Expected Submission End Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("SAR Template No."; Rec."SAR Template No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("SAR Template Description"; Rec."SAR Template Description")
                {
                    ApplicationArea = Basic;
                }
                field("Responsible Officer No."; Rec."Responsible Officer No.")
                {
                    ApplicationArea = Basic;
                }
                field("Officer Name"; Rec."Officer Name")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                }
                group("Payment Details")
                {
                    field("Payment Mode"; Rec."Payment Mode")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Transaction No."; Rec."Transaction No.")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Payment Document"; Rec."Payment Document")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Reason For Rejection"; Rec."Reason For Rejection")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Audit Invoice No."; Rec."Audit Invoice No.")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Invoice Amount"; Rec."Invoice Amount")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Audit Receipt No."; Rec."Audit Receipt No.")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Receipt Amount"; Rec."Receipt Amount")
                    {
                        ApplicationArea = Basic;
                    }
                }
            }
            part(Control24; "Programme Audit Answer Lines")
            {
                SubPageLink = "Audit Requisition No." = field(Code);
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control20; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control21; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control22; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control23; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Reject Payment")
            {
                ApplicationArea = Basic;
                Caption = 'Reject Payment';
                Image = Reject;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = Visibility;

                trigger OnAction()
                var
                    TXT001: label 'Reject Payment From the Institution %1';
                begin
                    if Confirm(TXT001, true, Rec."Institution Name") = true then begin
                        Rec.TestField("Reason For Rejection");
                        // AccreditationQualityAudit.SuggestQuestionFromTemplate(Rec);
                    end
                end;
            }
            action("Process Payment")
            {
                ApplicationArea = Basic;
                Image = PostedTaxInvoice;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                Visible = Visibility;

                trigger OnAction()
                var
                    TXT001: label 'Process Payment for the Audit %1';
                begin
                    Rec.TestField("Payment Document");
                    if Confirm(TXT001, true, Rec.Code) = true then begin
                        //create a payment process
                        Rec."Document Status" := Rec."document status"::"Awaiting Completeness Checks";
                        //create a feedback voucher
                      //  AccreditationQualityAudit.CreateSARFeedback(Rec);
                    end
                end;
            }
        }
        area(creation)
        {
            group("STAKEHOLDER")
            {
                Image = Bank;
                action("Stakeholder Detail")
                {
                    ApplicationArea = Basic;
                    Caption = 'Stakeholder Details';
                    Image = UserInterface;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    RunObject = Page "Prog Stakeholder Response";
                }
                action("Strength/Weakness")
                {
                    ApplicationArea = Basic;
                    Caption = 'Strength/Weakness';
                    Image = AnalysisView;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category4;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    RunObject = Page "Analysis of Stakeholders";
                    RunPageLink = "Quality Response No." = field(Code);
                }
            }
            group("PROGRAMME SAR COMPONENTS")
            {
                Image = RegisteredDocs;
                action("Programme Objectives")
                {
                    ApplicationArea = Basic;
                    Image = AddAction;
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category5;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    RunObject = Page "Programme Response Objectives";
                    RunPageLink = "Quality Response No." = field(Code);
                }
                action("Programme Organization")
                {
                    ApplicationArea = Basic;
                    Caption = 'Programme Organization';
                    Image = AllocatedCapacity;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category5;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    RunObject = Page "Audit Programme Organization";
                    RunPageLink = "Quality Response No." = field(Code);
                }
                action("Specification Strength/Weakness")
                {
                    ApplicationArea = Basic;
                    Caption = 'Specification Strength/Weakness';
                    Image = AnalysisViewDimension;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category5;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    RunObject = Page "Analy Programme Specification";
                    RunPageLink = "Quality Response No." = field(Code);
                }
                action("Content Strength/Weakness")
                {
                    ApplicationArea = Basic;
                    Caption = 'Content Strength/Weakness';
                    Image = AnalysisView;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category5;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    RunObject = Page "Analy Programme Curriculm";
                    RunPageLink = "Quality Response No." = field(Code);
                }
                action("Organization  Strength/Weakness")
                {
                    ApplicationArea = Basic;
                    Caption = 'Organization  Strength/Weakness';
                    Image = AlternativeAddress;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category5;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    RunObject = Page "Analy Programme Organization";
                    RunPageLink = "Quality Response No." = field(Code);
                }
            }
            group("TEACHING AND LEARING  STRATEGY")
            {
                Image = Transactions;
                action("Approach Strength/Weakness")
                {
                    ApplicationArea = Basic;
                    Caption = 'Teaching Approach Strength/Weakness';
                    Image = Agreement;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category6;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    RunObject = Page "Analy Programme Teaching";
                    RunPageLink = "Quality Response No." = field(Code);
                }
                action("Attachment Strength/Weakness")
                {
                    ApplicationArea = Basic;
                    Caption = 'Attachment Strength/Weakness';
                    Image = BOMLevel;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category6;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    RunObject = Page "Analy Programme Attachment";
                    RunPageLink = "Quality Response No." = field(Code);
                }
            }
            group("STUDENT ASSESSMENT")
            {
                Image = History;
                action("Assessment Strength/Weakness")
                {
                    ApplicationArea = Basic;
                    Caption = 'Assessment Strength/Weakness';
                    Image = BOMLevel;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category7;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    RunObject = Page "Analy Programme Grading";
                    RunPageLink = "Quality Response No." = field(Code);
                }
                action("Programme Grading")
                {
                    ApplicationArea = Basic;
                    Caption = 'Programme Grading';
                    Image = GanttChart;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category7;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    RunObject = Page "Audit Programme Grading";
                    RunPageLink = "Quality Response No." = field(Code);
                }
            }
            group("QUALITY OF TEACHING STAFF")
            {
                Image = AnalysisView;
                action("Programme Leader")
                {
                    ApplicationArea = Basic;
                    Caption = 'Programme Leader';
                    Image = AmountByPeriod;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category8;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    RunObject = Page "Programme Leader";
                    RunPageLink = "Quality Response No." = field(Code);
                }
                action("Academic Staff Statistics")
                {
                    ApplicationArea = Basic;
                    Caption = 'Academic Staff Statistics';
                    Image = AdjustVATExemption;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category8;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    RunObject = Page "Teaching Staff Details";
                    RunPageLink = "Quality Response No." = field(Code);
                }
                action("Staff Strength/Weakness")
                {
                    ApplicationArea = Basic;
                    Caption = 'Staff Strength/Weakness';
                    Image = BOMLevel;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category8;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    RunObject = Page "Analy Quality Teaching Staff";
                    RunPageLink = "Quality Response No." = field(Code);
                }
            }
            group("QUALITY OF SUPPORT STAFF")
            {
                Image = Ledger;
                action("Support Strength/Weakness")
                {
                    ApplicationArea = Basic;
                    Caption = 'Support Strength/Weakness';
                    Image = BOMLevel;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category9;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    RunObject = Page "Analy Quality Support Staff";
                    RunPageLink = "Quality Response No." = field(Code);
                }
            }
            group("STUDENT PROFILE")
            {
                Image = ResourcePlanning;
                action("Student Strength/Weakness")
                {
                    ApplicationArea = Basic;
                    Caption = 'Student Strength/Weakness';
                    Image = BOMLevel;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = Category10;
                    //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedIsBig = true;
                    RunObject = Page "Analy Quality Student Profile";
                    RunPageLink = "Quality Response No." = field(Code);
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::Engagement;
        Rec."Task Type" := Rec."task type"::"Course Quality Audit";
    end;

    trigger OnOpenPage()
    begin
        if Rec."Document Status" = Rec."document status"::"Awaiting Finance Processing" then
            Visibility := true else
            Visibility := false
    end;

    var
        AccreditationQualityAudit: Codeunit "Accreditation-Quality Audit";
        Visibility: Boolean;
}

#pragma implicitwith restore

