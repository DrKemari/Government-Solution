#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85259 "Update Student Sitting"
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
                field("Student Name"; Rec."Student Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Student Reg. No."; Rec."Student Reg. No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Examination Sitting"; Rec."Examination Sitting")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Correct Sitting"; CorrectSitting)
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    TableRelation = "Exam Sitting Cycle"."Exam Sitting Cycle";
                }
            }
        }
        area(factboxes)
        {
            systempart(Control8; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control9; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control10; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control11; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Update Student Booking")
            {
                ApplicationArea = Basic;
                Image = UpdateUnitCost;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    TXT001: label 'Are you sure you want to update the processed booking %1';
                begin
                    if Confirm(TXT001, true, Rec."No.") = true then begin
                        Examination.BookingUpdate(Rec, CorrectSitting);
                        CurrPage.Close;
                    end
                end;
            }
        }
    }

    var
        CorrectSitting: Code[30];
        Examination: Codeunit Examination;
}

#pragma implicitwith restore

