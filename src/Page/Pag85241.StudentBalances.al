#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85241 "Student Balances"
{
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = false;
    PageType = Worksheet;
    SourceTable = "Cust. Ledger Entry";
    SourceTableView = where(Amount=filter(<0),
                            Open=filter(true));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Select Payment";Selectpayment)
                {
                    ApplicationArea = Basic;
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                }
                field("Remaining Amount"; Rec."Remaining Amount")
                {
                    ApplicationArea = Basic;
                }
                field(Open; Rec.Open)
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
            action(Allocate)
            {
                ApplicationArea = Basic;
                Image = Allocate;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    TXT001: label 'Are you sure you want to post this allocation?';
                    StudentProcessingHeader: Record "Student Processing Header";
                begin
                    if Confirm(TXT001)=true then begin
                      //get the application header
                      if Selectpayment=true then begin
                       Examination.StudentPaymentApplication(Rec);
                      end
                    end
                end;
            }
        }
    }

    var
        Selectpayment: Boolean;
        Examination: Codeunit Examination;
}

#pragma implicitwith restore

