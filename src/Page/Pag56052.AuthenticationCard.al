#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 56052 "Authentication Card"
{
    PageType = Card;
    SourceTable = "Authentication Device Applicat";

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
                field("Applicant No."; Rec."Applicant No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Applicant No. field.';
                }
                field("Applicant Name"; Rec."Applicant Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Applicant Name field.';
                }
                field("Copyright Works"; Rec."Copyright Works")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Copyright Works field.';
                }
                field("Copyright Title"; Rec."Copyright Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Copyright Title field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Authentication Item"; Rec."Authentication Item")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Authentication Item field.';
                }
                field("Authentication Description"; Rec."Authentication Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Authentication Description field.';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Unit Price field.';
                }
                field("Quantity Requested"; Rec."Quantity Requested")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quantity Requested field.';
                }
                field("Amount Due"; Rec."Amount Due")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount Due field.';
                }
                field("Minimum Quantity"; Rec."Minimum Quantity")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Minimum Quantity field.';
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Created field.';
                }
                field("Time Created"; Rec."Time Created")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time Created field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Captured by"; Rec."Captured by")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Captured by field.';
                }
                field(Created; Rec.Created)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Function")
            {
                Caption = 'Function';
                group(Approvals)
                {
                    Caption = '-';
                }
                action("Send Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Send Approval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Send Approval Request action.';
                    trigger OnAction()
                    var
                        Text001: label 'This request is already pending approval';
                    begin
                    end;
                }
                action("Approval Request Entries")
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approval;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Approvals action.';
                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                    begin
                    end;
                }
                action("Approved Request Entries")
                {
                    ApplicationArea = Basic;
                    Image = approval;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Approval Entries";
                    RunPageLink = "Document No." = field("No.");
                    ToolTip = 'Executes the Approved Request Entries action.';
                }
                action("Cancel Approval Request")
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Request';
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Executes the Cancel Approval Request action.';
                }
                separator(Action24)
                {
                    Caption = '       -';
                }
                action(SUMBIT)
                {
                    ApplicationArea = Basic;
                    Caption = 'SUBMIT';
                    Image = Customer;
                    Promoted = true;
                    PromotedCategory = Process;
                    Visible = true;
                    ToolTip = 'Executes the SUBMIT action.';
                    trigger OnAction()
                    begin
                        SalesOrder.Reset;
                        SalesOrder.SetRange("Bill-to Customer No.", Rec."Applicant No.");
                        SalesOrder.SetRange("External Document No.", Rec."No.");
                        if SalesOrder.Find('-') then begin
                            Error('The Sales Order has already been created.');

                        end else begin

                            SalesOrder.Init;
                            SalesOrder."Document Type" := SalesOrder."document type"::Order;
                            SalesOrder."No." := '';
                            SalesOrder.Validate(SalesOrder."Sell-to Customer No.", Rec."Applicant No.");
                            SalesOrder."Document Date" := Rec.Date;
                            SalesOrder."Order Date" := Rec.Date;
                            SalesOrder."Posting Date" := Rec.Date;
                            SalesOrder."External Document No." := Rec."No.";
                            SalesOrder.Type := SalesOrder.Type::"Authentication Device";
                            SalesOrder.Insert(true);

                            SalesLine.Init;
                            SalesLine."Document Type" := SalesLine."document type"::Order;
                            SalesLine."Document No." := SalesOrder."No.";
                            SalesLine.Type := SalesLine.Type::Item;
                            SalesLine.Validate(SalesLine."No.", Rec."Authentication Item");
                            SalesLine.Validate(SalesLine.Quantity, Rec."Minimum Quantity");
                            SalesLine.Validate(SalesLine."Unit Price", Rec."Unit Price");
                            SalesLine.Insert(true);

                            Rec.Created := true;
                            Rec.Modify;
                        end;
                    end;
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    RunObject = Page "Default Dimensions";
                    RunPageLink = "No." = field("No.");
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'Executes the Dimensions action.';
                }
            }
            group(Print)
            {
                Caption = 'Print';
                Image = Print;
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
                        //DocPrint.PrintPurchHeader(Rec);


                        Rec.SetRange("No.", Rec."No.");
                        Report.Run(58001, true, true, Rec)
                    end;
                }
            }
        }
    }

    var
        SalesOrder: Record "Sales Header";
        SalesLine: Record "Sales Line";
        Cust: Record Customer;
}

#pragma implicitwith restore

