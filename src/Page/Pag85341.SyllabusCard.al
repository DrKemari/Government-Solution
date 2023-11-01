#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85341 "Syllabus Card"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = true;
    PageType = Card;
    SourceTable = "Syllabus Header";

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
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Course ID"; Rec."Course ID")
                {
                    ApplicationArea = Basic;
                }
                field("Course Name"; Rec."Course Name")
                {
                    ApplicationArea = Basic;
                }
                field("Domain Code"; Rec."Domain Code")
                {
                    ApplicationArea = Basic;
                }
                field("Domain Name"; Rec."Domain Name")
                {
                    ApplicationArea = Basic;
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Units/Papers"; Rec."No. of Units/Papers")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Major Reviews"; Rec."No. of Major Reviews")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Minor Reviews"; Rec."No. of Minor Reviews")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
                field("Approval Date"; Rec."Approval Date")
                {
                    ApplicationArea = Basic;
                }
                field("Next Major Review Date"; Rec."Next Major Review Date")
                {
                    ApplicationArea = Basic;
                }
                field("Next Minor Review Date"; Rec."Next Minor Review Date")
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
            }
            part(Control26; "Syllabus Papers")
            {
                SubPageLink = "Syllabus No." = field(Code);
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
            action("Rules and Regulations")
            {
                ApplicationArea = Basic;
                Image = PaymentDays;
                Promoted = true;
                RunObject = Page "Syllabus Rules and Regulations";
                RunPageLink = "Syllabus No." = field(Code);
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Image = Print;
                Promoted = true;
                PromotedCategory = "Report";

                trigger OnAction()
                begin
                    Rec.SetRange(Code, Rec.Code);
                    Report.Run(85303, true, false, Rec);
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::Syllabus;
    end;
}

#pragma implicitwith restore

