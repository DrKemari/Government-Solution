#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85221 "Application Card"
{
    DeleteAllowed = false;
    PageType = Card;
    SourceTable = "Student Application Header";
    SourceTableView = where(Posted = const(false));

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Visible = true;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Student No."; Rec."Student No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Student No. field.';
                }
                field("Student Name"; Rec."Student Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Student Name field.';
                }
                field("Reference No."; Rec."Reference No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Transaction No';
                    ToolTip = 'Specifies the value of the Transaction No field.';
                }
                field("Application Date"; Rec."Application Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Transaction Date';
                    ToolTip = 'Specifies the value of the Transaction Date field.';
                }
                field("Amount To Apply"; Rec."Amount To Apply")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    Enabled = true;
                    ToolTip = 'Specifies the value of the Amount To Apply field.';
                }
                field("Total Unapplied Amount"; Rec."Total Unapplied Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Unapplied Amount field.';
                    trigger OnValidate()
                    begin
                        CurrPage.SaveRecord;
                    end;
                }
                field(Cashier; Rec.Cashier)
                {
                    ApplicationArea = Basic;
                    Caption = 'Created By';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
            }
            part(Control1000000017; "Application Lines")
            {
                SubPageLink = "Header No." = field("No.");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control1000000023; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000024; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000025; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000026; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Dimensions)
            {
                AccessByPermission = TableData Dimension = R;
                ApplicationArea = Dimensions;
                Caption = 'Dimensions';
                Enabled = Rec."No." <> '';
                Image = Dimensions;
                Promoted = false;
                //The property 'PromotedIsBig' can only be set if the property 'Promoted' is set to 'true'
                //PromotedIsBig = false;
                ShortCutKey = 'Shift+Ctrl+D';
                ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';

                trigger OnAction()
                begin
                    //ShowDocDim;
                    CurrPage.SaveRecord;
                end;
            }
            action(Post)
            {
                ApplicationArea = Basic;
                Image = Post;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the Post action.';
                trigger OnAction()
                var
                    TXT001: label 'The amount %1,should be less than or equal to the available amount %2';
                    StudentApplicationLines: Record "Student Application Lines";
                begin
                    Rec.TestField("Student No.");
                    if Rec."Amount To Apply" > Rec."Total Unapplied Amount" then
                        Error(TXT001, Rec."Amount To Apply", Rec."Total Unapplied Amount");
                  //  Examination.StudentPaymentApplication(Rec);
                end;
            }
            action("&Print")
            {
                ApplicationArea = Basic;
                Caption = '&Print';
                Ellipsis = true;
                Image = Print;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Executes the &Print action.';
                trigger OnAction()
                begin
                    Rec.SetRange("No.", Rec."No.");
                    Report.Run(56003, true, true, Rec);
                end;
            }
        }
    }
    var
        // Codeunit "Payments-Post";
        // Page "Change Exchange Rate";
}
#pragma implicitwith restore
