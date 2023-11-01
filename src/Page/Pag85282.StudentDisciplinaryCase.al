#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85282 "Student Disciplinary Case"
{
    PageType = Card;
    SourceTable = "Student Processing Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                }
                field("Student No."; Rec."Student No.")
                {
                    ApplicationArea = Basic;
                }
                field("Student Reg. No."; Rec."Student Reg. No.")
                {
                    ApplicationArea = Basic;
                }
                field("Student Name"; Rec."Student Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("ID Number/Passport No."; Rec."ID Number/Passport No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Date of Birth"; Rec."Date of Birth")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Disabled; Rec.Disabled)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Highest Academic QCode"; Rec."Highest Academic QCode")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Highest Academic Qualification"; Rec."Highest Academic Qualification")
                {
                    ApplicationArea = Basic;
                }
            }
            group("Examination Details")
            {
                field("Case Code"; Rec."Case Code")
                {
                    ApplicationArea = Basic;
                }
                field("Case Description"; Rec."Case Description")
                {
                    ApplicationArea = Basic;
                }
                field("Examination ID"; Rec."Examination ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Examination ID';
                    Editable = false;
                }
                field("Examination Description"; Rec."Examination Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Examination';
                    Editable = false;
                }
                field("Examination Center Code"; Rec."Examination Center Code")
                {
                    ApplicationArea = Basic;
                }
                field("Examination Center"; Rec."Examination Center")
                {
                    ApplicationArea = Basic;
                }
                field("Examination Project Code"; Rec."Examination Project Code")
                {
                    ApplicationArea = Basic;
                }
                field("Examination Project Name"; Rec."Examination Project Name")
                {
                    ApplicationArea = Basic;
                }
                field("Examination Sitting"; Rec."Examination Sitting")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Student Case")
            {
                Caption = 'Student Case';
                Image = "Order";
                action(Submit)
                {
                    ApplicationArea = Basic;
                    Image = ResetStatus;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;

                    trigger OnAction()
                    var
                        TXT001: label 'Are you sure you want to Submit ?';
                    begin
                        Rec.TestField("Document Status", Rec."document status"::Draft);
                        if Confirm(TXT001)=true then begin
                            Rec."Document Status" := Rec."document status"::Submitted;
                          Message('Submitted Successfully');
                          end
                    end;
                }
                action("Attach Documents")
                {
                    ApplicationArea = Basic;
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = New;
                    PromotedIsBig = true;

                    trigger OnAction()
                    begin
                        DMSManagement.FnUploadStudentCaseDocs(Rec."No.", 'Student Case', Rec.RecordId);
                    end;
                }
            }
        }
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."Document Type" := Rec."document type"::Disciplinary;
        Rec."Document Status" := Rec."document status"::Draft;
    end;

    var
        Examination: Codeunit Examination;
        DMSManagement: Codeunit "DMS Management";
}

#pragma implicitwith restore

