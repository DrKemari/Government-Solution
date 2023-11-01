#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50055 "pageextension50055" extends "Bank Account Statement List" 
{

    //Unsupported feature: Property Insertion (DeleteAllowed) on ""Bank Account Statement List"(Page 389)".

    actions
    {
        addfirst(navigation)
        {
            group("St&atement")
            {
                Caption = 'St&atement';
            }
            action("&Card")
            {
                ApplicationArea = Basic;
                Caption = '&Card';
                Image = EditLines;
                RunObject = Page "Bank Account Card";
                RunPageLink = "No."=field("Bank Account No.");
                ShortCutKey = 'Shift+F7';
            }
            action("&Bank Reconciliation Report")
            {
                ApplicationArea = Basic;
                Caption = '&Bank Reconciliation Report';
                Image = "report";
                Promoted = true;
                ShortCutKey = 'Shift+F7';

                trigger OnAction()
                begin
                       BankStatement.Reset;
                      BankStatement.SetRange(BankStatement."Bank Account No.", Rec."Bank Account No.");
                       BankStatement.SetRange(BankStatement."Statement No.", Rec."Statement No.");
                       BankAccount.Reset;
                       BankAccount.SetRange("No.", Rec."Bank Account No.");
                       BankAccount.SetRange("Main Bank",true);
                       if BankAccount.FindSet then
                       Report.Run(50071,true,false,BankStatement)
                       else
                      Report.Run(50070,true,false,BankStatement)
                    //REPORT.RUN(Number [, ReqWindow] [, SystemPrinter] [, Record])
                end;
            }
            action("&Bank Reconciliation Summary Report")
            {
                ApplicationArea = Basic;
                Caption = '&Bank Reconciliation Summary Report';
                Image = "report";
                Promoted = true;
                ShortCutKey = 'Shift+F7';

                trigger OnAction()
                begin
                       BankStatement.Reset;
                      BankStatement.SetRange(BankStatement."Bank Account No.", Rec."Bank Account No.");
                       BankStatement.SetRange(BankStatement."Statement No.", Rec."Statement No.");
                       BankAccount.Reset;
                       BankAccount.SetRange("No.", Rec."Bank Account No.");
                       BankAccount.SetRange("Main Bank",true);
                       if BankAccount.FindSet then
                       Report.Run(50073,true,false,BankStatement)
                       else
                      Report.Run(50073,true,false,BankStatement)
                    //REPORT.RUN(Number [, ReqWindow] [, SystemPrinter] [, Record])
                end;
            }
        }
    }

    var
        BankStatement: Record "Bank Account Statement";
        BankAccount: Record "Bank Account";
}

#pragma implicitwith restore

