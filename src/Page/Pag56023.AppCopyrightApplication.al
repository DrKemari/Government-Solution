#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 56023 "App. Copyright Application"
{
    Caption = 'Copyright Application Card';
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Reports,Approval,Budgetary Control,Cancellation,Category7_caption,Category8_caption,Category9_caption,Category10_caption';
    SourceTable = "Copyright Registration Table";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("Applicant Account"; Rec."Applicant Account")
                {
                    ApplicationArea = Basic;
                    Editable = applicantAccountEditable;
                    ToolTip = 'Specifies the value of the Applicant Account field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Customer Category"; Rec."Customer Category")
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                    ToolTip = 'Specifies the value of the Applicant Category field.';
                }
                field("Customer Type"; Rec."Customer Type")
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                    ToolTip = 'Specifies the value of the Applicant Type field.';
                }
                field("Registration Date"; Rec."Registration Date")
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                    ToolTip = 'Specifies the value of the Registration Date field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("P.I.N"; Rec."P.I.N")
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                    ToolTip = 'Specifies the value of the P.I.N field.';
                }
                field("Company Reg No"; Rec."Company Reg No")
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                    ToolTip = 'Specifies the value of the Company Reg No field.';
                }
                field("ID. No."; Rec."ID. No.")
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                    ToolTip = 'Specifies the value of the ID. No. field.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = Basic;
                    Caption = 'Address 2(County)';
                    Editable = isEditable;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Address 2(County) field.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                    ToolTip = 'Specifies the value of the City field.';
                }
                field(Contact; Rec.Contact)
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                    ToolTip = 'Specifies the value of the Contact field.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                    ToolTip = 'Specifies the value of the Post Code field.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                    ToolTip = 'Specifies the value of the E-Mail field.';
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                    ToolTip = 'Specifies the value of the Title field.';
                }
                field("Customer Posting Group"; Rec."Customer Posting Group")
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Customer Posting Group field.';
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Gen. Bus. Posting Group field.';
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                    ToolTip = 'Specifies the value of the Country/Region Code field.';
                }
                field("VAT Bus. Posting Group"; Rec."VAT Bus. Posting Group")
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                    Visible = false;
                    ToolTip = 'Specifies the value of the VAT Bus. Posting Group field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Captured by"; Rec."Captured by")
                {
                    ApplicationArea = Basic;
                    Visible = false;
                    ToolTip = 'Specifies the value of the Captured by field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
            }
            group("Agent Details")
            {
                Caption = 'Agent Details';
                field("Agent First Name"; Rec."Agent First Name")
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                    ToolTip = 'Specifies the value of the Agent First Name field.';
                }
                field("Agent Surname"; Rec."Agent Surname")
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                    ToolTip = 'Specifies the value of the Agent Surname field.';
                }
                field("Agent Middle Name"; Rec."Agent Middle Name")
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                    ToolTip = 'Specifies the value of the Agent Middle Name field.';
                }
                field("Agent Address"; Rec."Agent Address")
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                    ToolTip = 'Specifies the value of the Agent Address field.';
                }
                field("Agent Address 2"; Rec."Agent Address 2")
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                    ToolTip = 'Specifies the value of the Agent Address 2 field.';
                }
                field("Agent City"; Rec."Agent City")
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                    ToolTip = 'Specifies the value of the Agent City field.';
                }
                field("Agent Contact"; Rec."Agent Contact")
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                    ToolTip = 'Specifies the value of the Agent Contact field.';
                }
                field("Agent Phone No."; Rec."Agent Phone No.")
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                    ToolTip = 'Specifies the value of the Agent Phone No. field.';
                }
                field("Agent ID. No."; Rec."Agent ID. No.")
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                    ShowMandatory = false;
                    ToolTip = 'Specifies the value of the Agent ID. No. field.';
                }
                field("Agent P.I.N"; Rec."Agent P.I.N")
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                    ShowMandatory = false;
                    ToolTip = 'Specifies the value of the Agent P.I.N field.';
                }
            }
            group("Authorship Details")
            {
                Caption = 'Authorship Details';
                field("Author First Name"; Rec."Author First Name")
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Author First Name field.';
                }
                field("Author Surname"; Rec."Author Surname")
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Author  Surname field.';
                }
                field("Author Middle Name"; Rec."Author Middle Name")
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                    ToolTip = 'Specifies the value of the Author Middle Name field.';
                }
                field("Author Stage Name"; Rec."Author Stage Name")
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                    ToolTip = 'Specifies the value of the Author Stage Name field.';
                }
                field("Author Postal Address"; Rec."Author Postal Address")
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                    ToolTip = 'Specifies the value of the Author Address field.';
                }
                field("Author Physical Address"; Rec."Author Physical Address")
                {
                    ApplicationArea = Basic;
                    Caption = 'Author Address 2';
                    Editable = isEditable;
                    ToolTip = 'Specifies the value of the Author Address 2 field.';
                }
                field("Author Email"; Rec."Author Email")
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Author Email field.';
                }
                field("Author City"; Rec."Author City")
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                    ToolTip = 'Specifies the value of the Author City field.';
                }
                field("Author Phone No."; Rec."Author Phone No.")
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                    ToolTip = 'Specifies the value of the Author Phone No. field.';
                }
                field("Author ID. No."; Rec."Author ID. No.")
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Author ID. No. field.';
                }
                field("Author P.I.N"; Rec."Author P.I.N")
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                    ShowMandatory = false;
                    ToolTip = 'Specifies the value of the Author P.I.N field.';
                }
            }
            group("Copyright Work Details")
            {
                Caption = 'Copyright Work Details';
                field("Copyright Title"; Rec."Copyright Title")
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                    ToolTip = 'Specifies the value of the Copyright Title field.';
                }
                field("Copyright Work Category"; Rec."Copyright Work Category")
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                    ToolTip = 'Specifies the value of the Copyright Work Category field.';
                }
                field("Copyright Work SubCategory"; Rec."Copyright Work SubCategory")
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                    ToolTip = 'Specifies the value of the Copyright Work SubCategory field.';
                }
                field("Copyright Category Description"; Rec."Copyright Category Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Copyright Category Description field.';
                }
                field("Copyright SubCategory Desc"; Rec."Copyright SubCategory Desc")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Copyright SubCategory Desc field.';
                }
                field("Date of Fixation/Reduction"; Rec."Date of Fixation/Reduction")
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Date of Fixation/Reduction field.';
                }
                field(Language; Rec.Language)
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                    ToolTip = 'Specifies the value of the Language field.';
                }
                field("Copyright Works Abstract"; ObjText)
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                    MultiLine = true;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the ObjText field.';
                    trigger OnValidate()
                    begin
                        Rec.CalcFields("Copyright Work Abstract");
                        Rec."Copyright Work Abstract".CreateInstream(ObjInstr);
                        Obj.Read(ObjInstr);

                        if ObjText <> Format(Obj) then begin
                            Clear(Rec."Copyright Work Abstract");
                            Clear(Obj);
                            Obj.AddText(ObjText);
                            Rec."Copyright Work Abstract".CreateOutstream(ObjOutStr);
                            Obj.Write(ObjOutStr);
                            //MODIFY;
                        end;
                    end;
                }
            }
            group("Production Details")
            {
                Caption = 'Production Details';
                field("Prod/Pub Name"; Rec."Prod/Pub Name")
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Prod/Pub Name field.';
                }
                field("Prod/Pub ID No/Company Reg No"; Rec."Prod/Pub ID No/Company Reg No")
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Prod/Pub ID No/Company Reg No field.';
                }
                field("Prod/Pub P.I.N"; Rec."Prod/Pub P.I.N")
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                    ShowMandatory = false;
                    ToolTip = 'Specifies the value of the Prod/Pub P.I.N field.';
                }
                field("Assignment/License Date"; Rec."Assignment/License Date")
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                    ToolTip = 'Specifies the value of the Assignment/License Date field.';
                }
                field("1st Country of Production"; Rec."1st Country of Production")
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the 1st Country of Production field.';
                }
                field(ISBN; Rec.ISBN)
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                    ToolTip = 'Specifies the value of the ISBN field.';
                }
                field("Production Category"; Rec."Production Category")
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Production Category field.';
                }
                field("Prod/Pub Phone No."; Rec."Prod/Pub Phone No.")
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                    ToolTip = 'Specifies the value of the Prod/Pub Phone No. field.';
                }
                field("Prod/Pub Email"; Rec."Prod/Pub Email")
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                    ToolTip = 'Specifies the value of the Prod/Pub Email field.';
                }
            }
            group(Payments)
            {
                Caption = 'Payments';
                field("Payement Reference No"; Rec."Payemnt Reference No")
                {
                    ApplicationArea = Basic;
                    Editable = isEditable;
                    ToolTip = 'Specifies the value of the Payemnt Reference No field.';
                }
                field("Receipt No"; Rec."Receipt No")
                {
                    ApplicationArea = Basic;
                    Editable = receiptEditable;
                    ToolTip = 'Specifies the value of the Receipt No field.';
                }
                field("Receipt Amount"; Rec."Receipt Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Receipt Amount field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000021; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000022; MyNotes)
            {
                ApplicationArea = Basic;
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
                        //ApprovalEntries.Setfilters(56022, entries."document type"::"Imprest Memo", "No.");


                        //Setfilters(DATABASE::"Copyright Registration Table",16,"No.");
                        ApprovalEntries.Run;
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
                    Visible = false;
                    ToolTip = 'Executes the Approved Request Entries action.';
                }
                separator(Action7)
                {
                    Caption = '       -';
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
                action("Submit Works")
                {
                    ApplicationArea = Basic;
                    Caption = 'Submit Works';
                    Image = Customer;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the Submit Works action.';
                    trigger OnAction()
                    begin
                        categoriesNoSetup.Reset;
                        categoriesNoSetup.SetRange(categoriesNoSetup."copyright Category Code", Rec."Copyright Work Category");
                        if categoriesNoSetup.FindSet then begin
                            NoSeriesMgt.InitSeries(categoriesNoSetup."no series", categoriesNoSetup."no series", 0D, worksNo, categoriesNoSetup."no series");


                            if Rec.Submitted = true then
                                Error(Text005);
                            Rec.TestField("Receipt No");
                            if Rec.Status <> Rec.Status::Approved then
                                Error(Text008);

                            if Confirm(Text009, false) = true then begin
                                Rec.Submitted := true;
                                GenSetUp.Get;
                                Scheme.Get;
                                //create a list of registered works
                                Service."No." := worksNo;
                                Service.Address := Rec.Address;
                                Service."Address 2" := Rec."Address 2";
                                Service."Agent City" := Rec."Agent City";
                                Service."Agent Contact" := Rec."Agent Contact";
                                Service."Agent Contact" := Rec."Agent Contact";
                                Service."Agent First Name" := Rec."Agent First Name";
                                Service."Agent ID. No." := Rec."Agent ID. No.";
                                Service."Agent Middle Name" := Rec."Agent Middle Name";
                                Service."Agent P.I.N" := Rec."Agent P.I.N";
                                Service."Author Phone No." := Rec."Author Phone No.";
                                Service."Author Address" := Rec."Author Postal Address";
                                Service."Assignment/License Date" := Rec."Assignment/License Date";
                                Service."Author Address 2" := Rec."Author Physical Address";
                                Service."Agent Phone No." := Rec."Agent Phone No.";
                                Service."Agent Surname" := Rec."Agent Surname";
                                Service."Author Agent Surname" := Rec."Author Surname";
                                Service."Author City" := Rec."Author City";
                                Service."Author Contact" := Rec."Author Contact";
                                Service."Author First Name" := Rec."Author First Name";
                                Service."Author ID. No." := Rec."Author ID. No.";
                                Service."Author Middle Name" := Rec."Author Middle Name";
                                Service."Author P.I.N" := Rec."Author P.I.N";
                                ;
                                Service."Author Phone No." := Rec."Author Phone No.";
                                Service."Applicant Account" := Rec."Applicant Account";
                                Service.City := Rec.City;
                                Service."Company Reg No" := Rec."Company Reg No";
                                Service.Contact := Rec.Contact;
                                Service."Copyright Category Description" := Rec."Copyright Category Description";
                                Service."Customer No." := Rec."Applicant Account";
                                Service."Customer Type" := Rec."Customer Type";
                                Service."Customer Category" := Rec."Customer Category";
                                ;
                                Service."Copyright SubCategory Desc" := Rec."Copyright SubCategory Desc";
                                Service."Copyright Title" := Rec."Copyright Title";
                                Service."Copyright Work Abstract" := Rec."Copyright Work Abstract";
                                Service."Copyright Work Category" := Rec."Copyright Work Category";
                                Service."Copyright Work SubCategory" := Rec."Copyright Work SubCategory";
                                Service."Date of Fixation/Reduction" := Rec."Date of Fixation/Reduction";
                                Service."ID. No." := Rec."ID. No.";
                                Service.Language := Rec.Language;
                                Service.Name := Rec.Name;
                                Service."Name 2" := Rec."Name 2";
                                Service."P.I.N" := Rec."P.I.N";
                                Service."Payemnt Reference No" := Rec."Payemnt Reference No";
                                Service."Phone No." := Rec."Phone No.";
                                Service."Post Code" := Rec."Post Code";
                                Service."Prod/Pub Email" := Rec."Prod/Pub Email";
                                Service."Prod/Pub ID No/Company Reg No" := Rec."Prod/Pub ID No/Company Reg No";
                                Service."Prod/Pub Name" := Rec."Prod/Pub Name";
                                Service."Prod/Pub P.I.N" := Rec."Prod/Pub P.I.N";
                                Service."Prod/Pub Phone No." := Rec."Prod/Pub Phone No.";
                                Service."Production Category" := Rec."Production Category";
                                Service."Receipt Amount" := Rec."Receipt Amount";
                                Service."Receipt No" := Rec."Receipt No";
                                Service."Registration Date" := Rec."Registration Date";
                                Service.Title := Rec.Title;
                                Service.Type := Rec.Type;
                                Service."Copyright?" := true;
                                Service.Description := Rec."Copyright Title";
                                Service."Description 2" := Rec."Copyright Title";
                                //Service."Vendor No.":="Vendor No.";
                                //Service."Vendor Name":="Vendor Name";
                                Service.Insert(true);



                                Cust.Reset;
                                if Cust.Get(BOSAACC) then begin
                                    Cust.Validate(Cust.Name);
                                    Cust.Validate(Cust."Global Dimension 1 Code");
                                    Cust.Validate(Cust."Global Dimension 2 Code");
                                    Cust.Modify;
                                end;


                                //End Updating Advice Buffer
                                /*
                                GenSetUp.GET();
                                SMTPMailSet.GET;
                                Notification.Create('Dynamics NAV',SMTPMailSet."Email Sender Address","E-Mail",'Member Acceptance Notification',
                                                'Member application '+ "No." + ' has been approved'
                                               + ' (Dynamics NAV ERP)',FALSE);
                                Notification.Send;
                                //Send SMS
                                */
                                //
                                /*
                                Sms:='Your Account No. '+ "No." +' has been opened successfully. CIC PENSION LTD ';
                                SendSms1.SendSms('MEMBAPP',"Phone No.",Sms);
                                */
                                SendNotMail();
                                Message(Text007);
                                Rec.Status := Rec.Status::Approved;

                                Rec."Created By" := UserId;
                                Rec.Invoiced := true;
                                Rec.Modify;

                            end else
                                Error(Text008);

                        end else begin
                            Error('Number series for this category has not been setup');
                        end;

                    end;
                }
                action("&Print CR1")
                {
                    ApplicationArea = Basic;
                    Caption = '&Print CR1';
                    Ellipsis = true;
                    Image = Print;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Executes the &Print CR1 action.';
                    trigger OnAction()
                    begin
                        //DocPrint.PrintPurchHeader(Rec);

                        Rec.TestField("Copyright Title");
                        Rec.TestField("Copyright Work Abstract");
                        Rec.TestField("Agent ID. No.");
                        Rec.TestField("Agent P.I.N");
                        Rec.TestField("Author Email");
                        Rec.TestField("Author ID. No.");
                        Rec.TestField("Author P.I.N");
                        Rec.TestField("Copyright Work Category");
                        Rec.TestField("Copyright Work SubCategory");
                        Rec.SetRange("No.", Rec."No.");
                        Report.Run(56230, true, true, Rec)
                    end;
                }
                action("Other Participants")
                {
                    ApplicationArea = Basic;
                    Image = Relatives;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Other Participants";
                    RunPageLink = "Copyright Reg No" = field("No.");
                    ToolTip = 'Executes the Other Participants action.';
                }
                action(Tracks)
                {
                    ApplicationArea = Basic;
                    Image = Link;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page Tracks;
                    RunPageLink = "Copyright No" = field("No.");
                    ToolTip = 'Executes the Tracks action.';
                }
                action("Invoice Application Fee")
                {
                    ApplicationArea = Basic;
                    Caption = 'Invoice Application Fee';
                    Image = Invoice;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    Visible = true;
                    ToolTip = 'Executes the Invoice Application Fee action.';
                    trigger OnAction()
                    begin
                        Rec.TestField("Receipt No");
                        GenSetUp.Get();
                        if Rec."Receipt Amount" <> GenSetUp."Copyright Amount" then
                            Error(Text0021);

                        SalesInv.Reset;
                        SalesInv.SetRange("Bill-to Customer No.", Rec."Applicant Account");
                        SalesInv.SetRange("External Document No.", Rec."No.");
                        if SalesInv.Find('-') then begin
                            Error('The Sales Order has already been created.');

                        end else begin

                            SalesInv.Init;
                            SalesInv."Document Type" := SalesInv."document type"::Invoice;
                            SalesInv."No." := '';
                            SalesInv.Validate(SalesInv."Sell-to Customer No.", Rec."Applicant Account");
                            SalesInv."Document Date" := Today;
                            SalesInv."Order Date" := Today;
                            SalesInv."Posting Date" := Today;
                            SalesInv."External Document No." := Rec."No.";
                            SalesInv.Type := SalesInv.Type::Normal;
                            //SalesInv.VALIDATE(SalesInv."Currency Code","Currency Code");
                            SalesInv."Prepayment %" := 100;//enforce prepayment`
                            SalesInv.Insert(true);

                            SalesLine.Init;
                            SalesLine."Document Type" := SalesLine."document type"::Invoice;
                            SalesLine."Document No." := SalesInv."No.";
                            SalesLine.Type := SalesLine.Type::Resource;
                            //get resource No & Worktype
                            /*serviceFee.RESET;
                            serviceFee.SETRANGE("Line No","Application Service type");
                            IF serviceFee.FINDSET THEN BEGIN
                            ResourceNo:=serviceFee."Default Resource No";
                            workType:=serviceFee."Default Work Type";
                            END;
                            */
                            SalesLine.Validate(SalesLine."No.", GenSetUp.Resource);
                            //SalesLine.VALIDATE(SalesLine."Work Type Code",workType);
                            SalesLine.Validate(SalesLine.Quantity, 1);
                            SalesLine.Validate(SalesLine."Unit Price", GenSetUp."Copyright Amount");
                            SalesLine.Insert(true);

                            Rec.Invoiced := true;
                            Rec.Modify;
                            Message('Invoice %1 has been created Successfully', SalesInv."No.");
                        end;

                        //salesheader.Post(CODEUNIT::"Sales-Post (Yes/No)",NavigateAfterPost::"Posted Document");

                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin

        //UpdateControls();
        ClassBCategory := false;
        PrincipalMemberVisible := false;
        PrincipalVisible := false;
    end;

    trigger OnAfterGetRecord()
    begin
        /*IF Status=Status::Approved THEN
          CurrPage.EDITABLE:=FALSE;
          */
        SetControlAppearance;
        UpdateControls;
        Rec.CalcFields("Copyright Work Abstract");
        Rec."Copyright Work Abstract".CreateInstream(ObjInstr);
        Obj.Read(ObjInstr);
        ObjText := Format(Obj);

    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        if Rec.Status = Rec.Status::Approved then
            CurrPage.Editable := false;

        MembAppl.Reset;
        //MembAppl.SETRANGE(MembAppl.Created,FALSE);
        MembAppl.SetRange(MembAppl.Status, MembAppl.Status::Open);
        MembAppl.SetRange(MembAppl."Captured by", UserId);
        if MembAppl.Find('-') then begin
            if MembAppl.Count > 0 then begin
                //ERROR(Text0014);   //users say they dont want limitation on the same
            end;
        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin

        //"Customer Posting Group":='MEMBER';
        //"Global Dimension 1 Code":='BOSA';
        //"Vendor Type":="Vendor Type"::Member;
        //"Pension Type":="Pension Type"::Live;
        Rec."Registration Date" := Today;
        Rec."Captured by" := UserId;
    end;

    trigger OnNextRecord(Steps: Integer): Integer
    begin
        /*IF Status=Status::Approved THEN
          CurrPage.EDITABLE:=FALSE;
          */

    end;

    trigger OnOpenPage()
    begin
        SetControlAppearance;
        /*
        InsertBenvVisisble:=FALSE;
        IF Status=Status::Approved THEN
          CurrPage.EDITABLE:=FALSE;
        */
        //UpdateControls;

    end;

    var
        Cust: Record Customer;
        // //ApprovalsMgmt: Codeunit "Approvals Mgmt.";
        Accounts: Record Vendor;
        AcctNo: Code[20];
        Sms: Text;
        Acc: Record Vendor;
        UsersID: Record User;
        BOSAACC: Code[20];
        MembAppl: Record "Copyright Registration Table";
        InsBbfVisible: Boolean;
        i: Integer;
        PrincipalMemberVisible: Boolean;
        PrincipalVisible: Boolean;
        ClassBCategory: Boolean;
        PictureExists: Boolean;
        text001: label 'Status must be open';
        UserMgt: Codeunit "User Setup Management";
        //NotificationMAIL: Codeunit "SMTP Mail";
        NotificationE: Codeunit Mail;
        MailBody: Text[250];
        ccEmail: Text[1000];
        toEmail: Text[1000];
        GenSetUp: Record "Copyright Setup";
        ClearingAcctNo: Code[20];
        AdvrAcctNo: Code[20];
        DocumentType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order","None",JV,"Member Closure","Account Opening",Batches,"Payment Voucher","Petty Cash",Requisition,Loan,Imprest,ImprestSurrender,Interbank,"Copyright registration";
        DivAcctNo: Code[20];
        NameEditable: Boolean;
        AddressEditable: Boolean;
        GlobalDim1Editable: Boolean;
        GlobalDim2Editable: Boolean;
        CustPostingGroupEdit: Boolean;
        PhoneEditable: Boolean;
        MaritalstatusEditable: Boolean;
        IDNoEditable: Boolean;
        RegistrationDateEdit: Boolean;
        OfficeBranchEditable: Boolean;
        DeptEditable: Boolean;
        SectionEditable: Boolean;
        OccupationEditable: Boolean;
        DesignationEdiatble: Boolean;
        EmployerCodeEditable: Boolean;
        DOBEditable: Boolean;
        EmailEdiatble: Boolean;
        StaffNoEditable: Boolean;
        GenderEditable: Boolean;
        MonthlyContributionEdit: Boolean;
        PostCodeEditable: Boolean;
        CityEditable: Boolean;
        WitnessEditable: Boolean;
        StatusEditable: Boolean;
        BankCodeEditable: Boolean;
        BranchCodeEditable: Boolean;
        BankAccountNoEditable: Boolean;
        VillageResidence: Boolean;
        SignatureExists: Boolean;
        ForceNo: Boolean;
        ContPhone: Boolean;
        ContRelation: Boolean;
        ContOcuppation: Boolean;
        Recruitedby: Boolean;
        PassEditable: Boolean;
        EmployerEditable: Boolean;
        CountryEditable: Boolean;
        SalesEditable: Boolean;
        text002: label 'Kindly specify the next of kin';
        AccountCategory: Boolean;
        text003: label 'You must specify Signatories for this type of membership';
        Text004: label 'You MUST specify the next of kin Benevolent';
        CustMember: Record Customer;
        "BenvNo.": Code[10];
        BankAEditable: Boolean;
        MemEditable: Boolean;
        BenvEditable: Boolean;
        BankNEditable: Boolean;
        InserFEditable: Boolean;
        FosAEditable: Boolean;
        Text005: label 'This Application has been created';
        Text006: label 'Customer account does not match applicant ';
        Text007: label 'This Account Has Been created Successfully';
        Text008: label 'Application Not approved.Kindly send for Approval';
        Text009: label 'Are you sure you want to Create Account Application?';
        Text0010: label 'All Members are created  must have a FOSA Account.Please Check General Setup.';
        Text0011: label 'Does this member have a Benevolent Fund Application?';
        Text0012: label 'Traansaction Type Must a value in Application -%1, It cannot be empty';
        InsertBenV: Boolean;
        IdentityEditable: Boolean;
        RecriutedEditable: Boolean;
        ActivicodeEditable: Boolean;
        applicantAccountEditable: Boolean;
        CustPostEditable: Boolean;
        InsertBenvVisisble: Boolean;
        Text0013: label 'Member contributions must have values';
        iEntryNo: Integer;
        Vendor: Record Vendor;
        Text0014: label 'There are still some pending Applications. Please utilise them first';
        Text0015: label 'This information is not needed for this Membership application category- %1';
        Text0016: label 'This category is eligible for BBF enrollment';
        UserSetup: Record "User Setup";
        //SMTPMailSet: Record "Email Account";
        Text0017: label 'Insurance Contributions Must have a value in application No. -%1.It cannot be null.';
        Text0018: label 'Deposit Contributions Must have a value.It cannot be null';
        Text0019: label 'Either Benevolent Fund or Entrance fee must have a value in application No. -%1';
        Text0020: label 'Deposit Contributions Must have a value in application No. -%1.It cannot be null.';
        SposnorCode: Record Customer;
        Scheme: Record "Company Information";
        Service: Record "Service Item";
        Obj: BigText;
        ObjInstr: InStream;
        ObjOutStr: OutStream;
        ObjText: Text;
        OpenApprovalEntriesExist: Boolean;
        ServiceItem: Record "Service Item";
        LITERARY: Text;
        BOOKS: Text;
        Text0021: label 'LITERARY';
        Text0022: label 'BOOKS';
        SalesInv: Record "Sales Header";
        SalesLine: Record "Sales Line";
        salesheader: Page "Sales Invoice";
        isEditable: Boolean;
        entries: Record "Approval Entry";
        receiptEditable: Boolean;
        categoriesNoSetup: Record "Categories Number Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
        worksNo: Code[20];


    procedure UpdateControls()
    begin
        if Rec.Status = Rec.Status::Approved then begin
            NameEditable := false;
            AddressEditable := false;
            GlobalDim1Editable := false;
            GlobalDim2Editable := false;
            CustPostingGroupEdit := false;
            PhoneEditable := false;
            MaritalstatusEditable := false;
            IDNoEditable := false;
            PhoneEditable := false;
            RegistrationDateEdit := false;
            OfficeBranchEditable := false;
            DeptEditable := false;
            SectionEditable := false;
            OccupationEditable := false;
            DesignationEdiatble := false;
            EmployerCodeEditable := false;
            DOBEditable := false;
            EmailEdiatble := false;
            StaffNoEditable := false;
            GenderEditable := false;
            MonthlyContributionEdit := false;
            PostCodeEditable := false;
            CityEditable := false;
            WitnessEditable := false;
            BankCodeEditable := false;
            BranchCodeEditable := false;
            BankAccountNoEditable := false;
            VillageResidence := false;
            ForceNo := false;
            ContPhone := false;
            ContRelation := false;
            ContOcuppation := false;
            Recruitedby := false;
            PassEditable := false;
            EmployerEditable := false;
            CountryEditable := false;
            SalesEditable := false;
            AccountCategory := false;
            BankAEditable := false;
            MemEditable := false;
            BenvEditable := false;
            BankNEditable := false;
            InsertBenV := false;
            IdentityEditable := false;
            RecriutedEditable := false;
            ActivicodeEditable := false;
            applicantAccountEditable := false;
            CustPostEditable := false;
            PrincipalMemberVisible := false;
            PrincipalVisible := false;
            ClassBCategory := false;
            isEditable := false;


        end;
        if Rec.Status = Rec.Status::Pending then
            receiptEditable := true;
        if Rec.Status = Rec.Status::Open then begin
            NameEditable := true;
            //PrincipalMemberVisible:=TRUE;
            //PrincipalVisible:=TRUE;
            //ClassBCategory:=TRUE;
            AddressEditable := true;
            GlobalDim1Editable := false;
            GlobalDim2Editable := true;
            CustPostingGroupEdit := false;
            PhoneEditable := true;
            MaritalstatusEditable := true;
            IDNoEditable := true;
            PhoneEditable := true;
            RegistrationDateEdit := true;
            OfficeBranchEditable := true;
            DeptEditable := true;
            SectionEditable := true;
            OccupationEditable := true;
            DesignationEdiatble := true;
            EmployerCodeEditable := true;
            DOBEditable := true;
            EmailEdiatble := true;
            StaffNoEditable := true;
            GenderEditable := true;
            MonthlyContributionEdit := true;
            PostCodeEditable := true;
            CityEditable := false;
            WitnessEditable := true;
            BankCodeEditable := true;
            BranchCodeEditable := true;
            BankAccountNoEditable := true;
            VillageResidence := true;
            ForceNo := true;
            ContPhone := true;
            ContRelation := true;
            ContOcuppation := true;
            Recruitedby := true;
            PassEditable := true;
            EmployerEditable := true;
            CountryEditable := true;
            SalesEditable := true;
            AccountCategory := true;
            BankAEditable := true;
            MemEditable := true;
            BenvEditable := true;
            BankNEditable := true;
            InsertBenV := true;
            IdentityEditable := true;
            RecriutedEditable := true;
            ActivicodeEditable := true;
            applicantAccountEditable := true;
            CustPostEditable := true;
            isEditable := true;
        end
    end;


    procedure SendSMS()
    begin
        /*
        SMSMessages.RESET;
        IF SMSMessages.FIND('+') THEN BEGIN
        iEntryNo:=SMSMessages."Entry No";
        iEntryNo:=iEntryNo+1;
        END ELSE BEGIN
        iEntryNo:=1;
        END;
        
        SMSMessages.INIT;
        SMSMessages."Entry No":=iEntryNo;
        SMSMessages."Account No":="No.";
        SMSMessages."Date Entered":=TODAY;
        SMSMessages."Time Entered":=TIME;
        SMSMessages.Source:='Member Application';
        SMSMessages."Entered By":=USERID;
        SMSMessages."System Created Entry":=TRUE;
        SMSMessages."Document No":="No.";
        SMSMessages."Sent To Server":=SMSMessages."Sent To Server"::No;
        SMSMessages."SMS Message":='Your Account No. '+ "No." +' of type ' + "FOSA Account Type" + ' has been opened successfully. MWALIMU SACCCO';
        IF Vendor."Phone No."<> '' THEN BEGIN
        SMSMessages."Telephone No":=Vendor."Phone No.";
        END ELSE BEGIN
        SMSMessages."Telephone No":=Vendor."MPESA Mobile No";
        END;
        SMSMessages.INSERT;
        */

    end;


    procedure CheckMemberCat()
    begin

        //IF "Member Category"="Member Category"::"Class A" THEN
        //ERROR(Text0015,"Member Category");
    end;


    procedure SendNotMail()
    var
        Notification: Codeunit "Email Message";
        FileDirectory: Text[100];
        FileName: Text[100];
    begin
    end;

    local procedure SetControlAppearance()
    var
    ////ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        // OpenApprovalEntriesExist := //ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
    end;
}

#pragma implicitwith restore

