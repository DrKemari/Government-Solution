#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85370 "Renewal Lines"
{
    PageType = ListPart;
    SourceTable = "Student Processing Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Registration No."; Rec."Registration No.")
                {
                    ApplicationArea = Basic;
                }
                field("Course Id"; Rec."Course Id")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    var
                        Examination: Codeunit Examination;
                        Header: Record "Student Processing Header";
                        RenewalAmnt: Decimal;
                        TXT001: label 'The student %1,has no pending renewal';
                    begin
                        //validate the student has a pending renewal
                        Header.Reset;
                        Header.SetRange("No.", Rec."Booking Header No.");
                        if Header.FindFirst then begin
                          RenewalAmnt:=Examination.RenewalGetAmount(Header);
                          if RenewalAmnt=0 then begin
                            Error(TXT001,Header."Student Reg. No.");
                          end
                         end
                    end;
                }
                field("Amount LCY"; Rec."Amount LCY")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        Rec.Validate(Amount);
                    end;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.Type := Rec.Type::Booking;
    end;
}

#pragma implicitwith restore

