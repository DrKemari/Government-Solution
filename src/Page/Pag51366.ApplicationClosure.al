#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51366 "Application Closure"
{
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = true;
    PageType = Card;
    SourceTable = "Accreditation Application";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Application No."; Rec."Application No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Application No. field.';
                }
                field("Application Type"; Rec."Application Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Type field.';
                }
                field("Application Type Name"; Rec."Application Type Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Application Type Name field.';
                }
                field("Verdict Code"; Rec."Verdict Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Verdict Code field.';
                }
                field("Verdict Description"; Rec."Verdict Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Verdict Description field.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address 2 field.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the City field.';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Post Code field.';
                }
                field(County; Rec.County)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the County field.';
                }
                field(Country; Rec.Country)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Country field.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
                group("Payment Details")
                {
                    Editable = false;
                    field("Currency Code"; Rec."Currency Code")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Currency Code field.';
                    }
                    field("Application Fee LCY"; Rec."Application Fee LCY")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                        ToolTip = 'Specifies the value of the Application Fee LCY field.';
                    }
                    field("Application Fee"; Rec."Application Fee")
                    {
                        ApplicationArea = Basic;
                        Editable = false;
                        ToolTip = 'Specifies the value of the Application Fee field.';
                    }
                    field("Receipt No."; Rec."Receipt No.")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Receipt No. field.';
                    }
                    field("Receipt Amount"; Rec."Receipt Amount")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Receipt Amount field.';
                    }
                    field("Invoice No."; Rec."Invoice No.")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Invoice No. field.';
                    }
                    field("Invoice Amount"; Rec."Invoice Amount")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Invoice Amount field.';
                    }
                }
            }
            part(Control9; "Accreditation Questions")
            {
                SubPageLink = "Application No." = field("Application No.");
                ApplicationArea = Basic;
            }
            part(Control14; "Application Categories")
            {
                SubPageLink = "Application No." = field("Application No.");
                ApplicationArea = Basic;
            }
            part(Control29; "Accreditation Admin Staff")
            {
                SubPageLink = "Application No." = field("Application No.");
                ApplicationArea = Basic;
            }
            part(Control28; "Accreditation Trainers")
            {
                SubPageLink = "Application No." = field("Application No.");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control24; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control25; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control26; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control27; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Programme Closure")
            {
                Caption = 'Programme Closure';
                Image = "Order";
                action("Close Accreditation Process")
                {
                    ApplicationArea = Basic;
                    Image = Close;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Close Accreditation Process action.';
                    trigger OnAction()
                    var
                        Job: Record Job;
                        TXT001: label 'Are you sure you want to close this application?';
                    begin
                        Rec.TestField("Verdict Code");
                        if Confirm(TXT001) = true then begin
                            Accreditation.AccreditationCloseApplication(Rec);
                        end
                    end;
                }
                action(Dimensions)
                {
                    ApplicationArea = Basic;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    Promoted = true;
                    PromotedIsBig = true;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'Executes the Dimensions action.';
                    trigger OnAction()
                    begin
                        CurrPage.SaveRecord;
                    end;
                }
                action(Approvals)
                {
                    ApplicationArea = Basic;
                    Caption = 'Approvals';
                    Image = Approvals;
                    Promoted = true;
                    PromotedIsBig = false;
                    ToolTip = 'Executes the Approvals action.';
                    trigger OnAction()
                    var
                        ApprovalEntries: Page "Approval Entries";
                    begin
                        //ApprovalEntries.Setfilters(DATABASE::"Purchase Header","Document Type","No.");
                        ApprovalEntries.Setfilters(Database::"Purchase Header", 14, Rec."Application No.");
                        ApprovalEntries.Run;
                    end;
                }
                action("Co&mments")
                {
                    ApplicationArea = Basic;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Purch. Comment Sheet";
                    ToolTip = 'Executes the Co&mments action.';
                }
            }
            group(ActionGroup45)
            {
                Caption = 'Release';
                Image = ReleaseDoc;
                separator(Action44)
                {
                }
                action(Release)
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&lease';
                    Image = ReleaseDoc;
                    Promoted = true;
                    PromotedCategory = Process;
                    ShortCutKey = 'Ctrl+F9';
                    ToolTip = 'Executes the Re&lease action.';
                    trigger OnAction()
                    var
                    // //ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        //ReleasePurchDoc.PerformManualRelease(Rec);
                        Message('');
                    end;
                }
                action("Re&open")
                {
                    ApplicationArea = Basic;
                    Caption = 'Re&open';
                    Image = ReOpen;
                    ToolTip = 'Executes the Re&open action.';
                    trigger OnAction()
                    var
                    // //ReleasePurchDoc: Codeunit "Release Purchase Document";
                    begin
                        ////ReleasePurchDoc.PerformManualReopen(Rec);
                    end;
                }
                separator(Action41)
                {
                }
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                action(SendApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Send A&pproval Request';
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;
                    ToolTip = 'Executes the Send A&pproval Request action.';
                    trigger OnAction()
                    var
                    //   //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalEntries.Run;
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Basic;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = true;
                    Image = Cancel;
                    Promoted = true;
                    PromotedCategory = Category9;
                    ToolTip = 'Executes the Cancel Approval Re&quest action.';
                    trigger OnAction()
                    var
                    //  //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalEntries.Run;
                    end;
                }
            }
            group(Print)
            {
                Caption = 'Print';
                Image = Print;
                action("Preview Certificate")
                {
                    ApplicationArea = Basic;
                    Caption = 'Preview Certificate';
                    Ellipsis = true;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the Preview Certificate action.';
                    trigger OnAction()
                    begin
                        Rec.SetRange("Application No.", Rec."Application No.");
                        Report.Run(51250, true, false, Rec);
                    end;
                }
            }
        }
    }

    var
        ApprovalEntries: Page "Approval Entries";
        Accreditation: Codeunit Examination;
}

#pragma implicitwith restore

