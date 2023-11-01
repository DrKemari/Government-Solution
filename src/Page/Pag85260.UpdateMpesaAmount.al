#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85260 "Update Mpesa Amount"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    ShowFilter = false;
    SourceTable = "MPESA Integration Table";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(MPESA_TXN_ID; Rec.MPESA_TXN_ID)
                {
                    ApplicationArea = Basic;
                }
                field(MPESA_AMOUNT; Rec.MPESA_AMOUNT)
                {
                    ApplicationArea = Basic;
                }
                field(ACCOUNT_NUMBER; Rec.ACCOUNT_NUMBER)
                {
                    ApplicationArea = Basic;
                }
                field(Fetch; Rec.Fetch)
                {
                    ApplicationArea = Basic;
                }
                field("Correct Amount";CorrectAmount)
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
            action(Update)
            {
                ApplicationArea = Basic;
                Image = UpdateXML;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                var
                    TXT001: label 'Are you sure you want to update the remaining amount';
                    TXT002: label 'Consult the administrator to assign you MPESA amounts admin rights';
                begin
                    UserSetup.Get;
                    UserSetup.SetRange("User ID",UserId);
                    UserSetup.SetRange("MPESA amounts Admin",true);
                    if UserSetup.FindFirst then begin
                    if Confirm(TXT001)=true then begin
                        Examination.UpdateMpesaDetails(Rec,CorrectAmount);
                    end
                    end else
                    Error(TXT002);
                end;
            }
        }
    }

    trigger OnOpenPage()
    begin
        CorrectAmount:= Rec."Remaining Amount";
    end;

    var
        CorrectAmount: Decimal;
        Examination: Codeunit Examination;
        UserSetup: Record "User Setup";
}

#pragma implicitwith restore

