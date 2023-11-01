#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85258 "Transfer Course"
{
    PageType = Card;
    SourceTable = "Examination Account";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Registration No."; Rec."Registration No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("ID No."; Rec."ID No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Transfer From Course"; Rec."Course ID")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Transfer To Course"; TransferTo)
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    TableRelation = "Transferable Course Setup"."Transferable Course" where(Course = field("Course ID"));
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
        area(processing)
        {
            action("Transfer Student")
            {
                ApplicationArea = Basic;
                Image = MoveUp;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    Examination: Codeunit Examination;
                    TXT001: label 'Transfer %1 to %2 course';
                    TXT002: label 'Kindly select the course to be transfered to';
                begin
                    if TransferTo = '' then
                        Error(TXT002);
                    if Confirm(TXT001, true, Rec."Registration No.", TransferTo) = true then begin

                        Examination.ApplicationTransferRegistrationNo(Rec, TransferTo);
                    end
                end;
            }
        }
    }

    var
        TransferTo: Code[30];
}

#pragma implicitwith restore

