#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69775 "Phone Interview Header"
{
    Caption = 'Phone Interview Header';
    PageType = Card;
    SourceTable = "PreScreen Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Vacancy ID"; Rec."Vacancy ID")
                {
                    ApplicationArea = Basic;
                }
                field("Position ID"; Rec."Position ID")
                {
                    ApplicationArea = Basic;
                }
                field("Job Title/Designation"; Rec."Job Title/Designation")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Openings"; Rec."No. of Openings")
                {
                    ApplicationArea = Basic;
                }
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                }
                field("Region ID"; Rec."Region ID")
                {
                    ApplicationArea = Basic;
                }
                field("Lead HR Officer"; Rec."Lead HR Officer")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Phone Interview Template ID"; Rec."Phone Interview Template ID")
                {
                    ApplicationArea = Basic;
                }
                field("Maximum Test Duration(Min)"; Rec."Maximum Test Duration(Min)")
                {
                    ApplicationArea = Basic;
                }
                field("Planned Start Date"; Rec."Planned Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Planned End Date"; Rec."Planned End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Document Status"; Rec."Document Status")
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
            part(Control29; "Phone Interview Lines")
            {
                SubPageLink = "Document No." = field("Document No."),
                              "Vacancy ID" = field("Vacancy ID");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control25; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control26; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control27; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control28; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Suggest Job Applicants")
            {
                ApplicationArea = Basic;
                Image = SuggestCustomerPayments;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.TestField("Vacancy ID");
                    if Confirm('Are you sure you want to suggest applicants for  phone interviews?') = true then begin
                        Recruitment.SuggestPhoneInterviewApplicants(Rec);
                    end
                end;
            }
            action("E-Notify Job Applicants")
            {
                ApplicationArea = Basic;
                Image = ElectronicVATExemption;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to notify the applicants on the scheduled phone interviews?') = true then begin
                        Recruitment.NotifyPhoneInterviewApplicants(Rec);
                    end
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Image = PostApplication;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    if Confirm('Are you sure you want to post the report?') = true then begin
                        Recruitment.PostPhoneApplicants(Rec);
                    end
                end;
            }
        }
        area(navigation)
        {
            action(Dimensions)
            {
                ApplicationArea = Basic;
                Image = Dimensions;
            }
        }
        area(reporting)
        {
            action("Print Summary")
            {
                ApplicationArea = Basic;
                Image = Print;
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = true;

                trigger OnAction()
                begin
                    Rec.SetRange("Document No.", Rec."Document No.");
                    Report.Run(69619, true, false, Rec);
                end;
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::"Phone Interview Report";
    end;

    var
        Recruitment: Codeunit Recruitment;
}

#pragma implicitwith restore

