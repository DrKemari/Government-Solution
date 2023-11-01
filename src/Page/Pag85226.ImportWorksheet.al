#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85226 "Import Worksheet"
{
    ApplicationArea = Basic;
    PageType = Worksheet;
    SourceTable = "Bank Import Entries";
    SourceTableView = where(Posted = filter(false));
    UsageCategory = Documents;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Bank Code"; Rec."Bank Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Code field.';
                }
                field("Transaction Date"; Rec."Transaction Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transaction Date field.';
                }
                field("Reference No."; Rec."Reference No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reference No. field.';
                }
                field("Student Identifier"; Rec."Student Identifier")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Student Identifier field.';
                }
                field("Examination Code"; Rec."Examination Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Examination Code field.';
                }
                field("Form Serial No"; Rec."Form Serial No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Form Serial No field.';
                }
                field("Category Code"; Rec."Category Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Category Code field.';
                }
                field("Category Name"; Rec."Category Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Category Name field.';
                }
                field("Student Name"; Rec."Student Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Student Name field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field(Closed; Rec.Closed)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Closed field.';
                }
                field("Applied Amount"; Rec."Applied Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Applied Amount field.';
                }
                field("Remaining Amount"; Rec."Remaining Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Remaining Amount field.';
                }
                field("Registration No"; Rec."Registration No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Registration No field.';
                }
                field("M-PESA Code"; Rec."M-PESA Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the M-PESA Code field.';
                }
                field(Details; Rec.Details)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Details field.';
                }
                field("Mobile No"; Rec."Mobile No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mobile No field.';
                }
                field(Branch; Rec.Branch)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Branch field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control22; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control23; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control24; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control25; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("EQUITY BANK IMPORT")
            {
                ApplicationArea = Basic;
                Image = Import;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the EQUITY BANK IMPORT action.';
                trigger OnAction()
                begin
                    Clear(EQUITYIMPORT);
                    EQUITYIMPORT.GetVariables(Rec);
                    EQUITYIMPORT.Run;
                end;
            }
            action("CO-OP BANK IMPORT")
            {
                ApplicationArea = Basic;
                Image = iMPORT;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the CO-OP BANK IMPORT action.';
                trigger OnAction()
                begin
                    Clear(COOPBANKIMPORT);
                    COOPBANKIMPORT.GetVariables(Rec);
                    COOPBANKIMPORT.Run;
                end;
            }
            action("NATIONAL BANK IMPORT")
            {
                ApplicationArea = Basic;
                Image = Import;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the NATIONAL BANK IMPORT action.';
                trigger OnAction()
                begin
                    Clear(NATIONALBANKIMPORT);
                    NATIONALBANKIMPORT.GetVariables(Rec);
                    NATIONALBANKIMPORT.Run;
                end;
            }
            action("KCB BANK IMPORT")
            {
                ApplicationArea = Basic;
                Image = Import;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the KCB BANK IMPORT action.';
                trigger OnAction()
                begin
                    Clear(KCBBANKIMPORT);
                    KCBBANKIMPORT.GetVariables(Rec);
                    KCBBANKIMPORT.Run;
                end;
            }
            action("KCB DOLLAR  BANK IMPORT")
            {
                ApplicationArea = Basic;
                Image = Import;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the KCB DOLLAR  BANK IMPORT action.';
                trigger OnAction()
                begin
                    Clear(KCBUSDBANKIMPORT);
                    KCBUSDBANKIMPORT.GetVariables(Rec);
                    KCBUSDBANKIMPORT.Run;
                end;
            }
            action("POSTBANK IMPORT")
            {
                ApplicationArea = Basic;
                Image = Import;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the POSTBANK IMPORT action.';
                trigger OnAction()
                begin
                    Clear(POSTBANKIMPORT);
                    POSTBANKIMPORT.GetVariables(Rec);
                    POSTBANKIMPORT.Run;
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                ToolTip = 'Executes the Post action.';
                trigger OnAction()
                var
                    Examination: Codeunit Examination;
                    TXT001: label 'Post import entries for %1';
                begin
                    if Confirm(TXT001, true, Rec."Bank Code") = true then begin
                        Examination.PostBankEntries(Rec);
                    end
                end;
            }
        }
    }

    var
        EQUITYIMPORT: XmlPort "EQUITY IMPORT";
        KCBBANKIMPORT: XmlPort "KCB BANK IMPORT";
        COOPBANKIMPORT: XmlPort "CO-OP BANK IMPORT";
        NATIONALBANKIMPORT: XmlPort "NATIONAL BANK IMPORT";
        POSTBANKIMPORT: XmlPort "POSTBANK IMPORT";
        KCBUSDBANKIMPORT: XmlPort "KCB BANK IMPORT-USD";
}

#pragma implicitwith restore

