#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57083 "Shares Price Card"
{
    PageType = Card;
    SourceTable = "EFT Header";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                }
                field(Transferred; Rec.Transferred)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Date Transferred"; Rec."Date Transferred")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Time Transferred"; Rec."Time Transferred")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ShowMandatory = true;
                }
            }
            part(Control8; "Interest Rates")
            {
                SubPageLink = "Header No" = field(No);
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(Instutions)
            {
                ApplicationArea = Basic;
                Caption = 'Instutions';
                Image = InventorySetup;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Shares price Institutions";
                RunPageLink = "Header No" = field(No);
            }
            action("Post ")
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    if (Rec.Transferred = true) then
                        Error('This Revaluation Document has been Posted');
                    Temp.Get(UserId);
             //       JTemplate := Temp."Payment Journal Template";
                  //  JBatch := Temp."Payment Journal Batch";
                    if JTemplate = '' then begin
                        Error('Ensure the PV Template is set up in Funds User Setup');
                    end;
                    if JBatch = '' then begin
                        Error('Ensure the PV Batch is set up in the Funds User Setup')
                    end;

                    //Clear Journals
                    GenJnlLine.Reset;
                    GenJnlLine.SetRange(GenJnlLine."Journal Template Name", JTemplate);
                    GenJnlLine.SetRange(GenJnlLine."Journal Batch Name", JBatch);
                    if GenJnlLine.Find('-') then begin
                        GenJnlLine.DeleteAll;
                    end;

                    SharePriceL.Reset;
                    SharePriceL.SetRange("Header No", Rec.No);
                    SharePriceL.SetRange(Posted, false);
                    if SharePriceL.Find('-') then begin
                        repeat
                            InvestmentPosting.FnPost(SharePriceL);
                        until SharePriceL.Next = 0;
                    end;

                    ///  Posted:=TRUE;
                    Rec.Modify;

                    Message('Posted Sucessfully!');
                end;
            }
            action("Mark as Posted")
            {
                ApplicationArea = Basic;
                Image = MakeAgreement;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    SharePriceL.Reset;
                    SharePriceL.SetRange("Header No", Rec.No);
                    SharePriceL.SetRange(Posted, false);
                    if SharePriceL.Find('-') then begin
                        repeat
                            SharePriceL.Posted := true;
                            SharePriceL.Modify;
                        until SharePriceL.Next = 0;
                    end;

                    Rec.Transferred := true;
                    Rec.Modify;
                    Message('Marked as Posted Sucessfully!');
                end;
            }
        }
    }

    var
        SharePriceL: Record "Investment History";
        InvestmentPosting: Codeunit "Investment Management";
        LineNo: Integer;
        GenJnlLine: Record "Gen. Journal Line";
        Temp: Record "CRM Vacancy Responsibility";
        JTemplate: Code[50];
        JBatch: Code[50];
}

#pragma implicitwith restore

