#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51217 "Complete Inst. Accreditation"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "Ins. Accreditation Table";

    layout
    {
        area(content)
        {
            group("Institution Details")
            {
                field("Accreditation No."; Rec."Accreditation No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Accreditation No. field.';
                }
                field("Institution No."; Rec."Institution No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution No. field.';
                }
                field("Institution Name."; Rec."Institution Name.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution Name. field.';
                }
                field("Institution Campus"; Rec."Institution Campus")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution Campus field.';
                }
                field("Institution Phone No."; Rec."Institution Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution Phone No. field.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    Caption = 'Email';
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the City field.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
                field("Accreditation Code"; Rec."Accreditation Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Accreditation Code field.';
                }
                field(Sponsor; Rec.Sponsor)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sponsor field.';
                }
                field(County; Rec.County)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the County field.';
                }
                field(Constituency; Rec.Constituency)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Constituency field.';
                }
                field("KRA Pin"; Rec."KRA Pin")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the KRA Pin field.';
                }
                field("Ministry of Education Code"; Rec."Ministry of Education Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Ministry of Education Code field.';
                }
            }
            group("Payment Details")
            {
                field("Receipt No."; Rec."Receipt No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Receipt No. field.';
                }
                field("Payment Amount"; Rec."Payment Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment Amount field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
        area(factboxes)
        {
            part(Control42; "Customer Picture")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "No." = field("Institution No.");
            }
            part(Control41; "Office Customer Details")
            {
                ApplicationArea = All;
                Caption = 'Details';
                SubPageLink = "No." = field("Institution No.");
            }
            part(AgedAccReceivableChart2; "Aged Acc. Receivable Chart")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("Institution No.");
            }
            part(Control39; "CRM Statistics FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("Institution No.");
            }
            part(SalesHistSelltoFactBox; "Sales Hist. Sell-to FactBox")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "No." = field("Institution No.");
            }
            part(SalesHistBilltoFactBox; "Sales Hist. Bill-to FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("Institution No.");
                Visible = false;
            }
            part(CustomerStatisticsFactBox; "Customer Statistics FactBox")
            {
                ApplicationArea = Advanced;
                SubPageLink = "No." = field("Institution No.");
            }
            part(Control35; "Dimensions FactBox")
            {
                ApplicationArea = Advanced;
                SubPageLink = "No." = field("Institution No.");
            }
            part(WorkflowStatus; "Workflow Status FactBox")
            {
                ApplicationArea = Suite;
                Editable = false;
                Enabled = false;
                ShowFilter = false;
            }
            systempart(Control31; Links)
            {
                ApplicationArea = Basic;
            }
            systempart(Control23; Notes)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(creation)
        {
            separator(Action18)
            {
                Caption = '       -';
            }
            action("Create Customer Account")
            {
                ApplicationArea = Basic;
                Caption = 'Create Customer Account';
                Image = Customer;
                Promoted = true;
                PromotedCategory = Process;
                Visible = true;
                ToolTip = 'Executes the Create Customer Account action.';
            }
            action("Confirm Payment")
            {
                ApplicationArea = Basic;
                Caption = 'Confirm Payment';
                Image = Percentage;
                Promoted = true;
                PromotedCategory = Process;
                Visible = true;
                ToolTip = 'Executes the Confirm Payment action.';
            }
            action("Submit Institution Details")
            {
                ApplicationArea = Basic;
                Image = process;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Submit Institution Details action.';
                trigger OnAction()
                begin
                    // Feeschedules.Reset;
                    // Feeschedules.SetRange(Description, Accreditation."Accreditation Code");
                    // if Feeschedules.FindSet then begin
                    //     if Feeschedules."Applies To New" = true then begin
                    //         Cust.Reset;
                    //         Cust.SetRange("No.", Accreditation."Institution No.");
                    //         if Cust.FindSet then begin
                    //             Cust.Type := Cust.Type::"2";
                    //             Cust.Modify;
                    //             Message(Text001);
                end;
                //     end;
                // end else begin
                //     /*Campus.INIT;
                //     Campus."No.":="Accreditation No.";
                //     Campus.Address:=Address;
                //     Campus.Category:="Accreditation Code";
                //     Campus.City:=City;
                //     Campus.County:=County;
                //     Campus.Description:="Institution Campus";
                //     Campus."E-Mail":=Email;
                //     Campus."Institution Code":="Institution No.";
                //     Campus."Ministry of Education Code":="Ministry of Education Code";
                //     Campus.Sponsor:=Sponsor;
                //     Campus."University Code":="Institution No.";
                //     Campus.INSERT(TRUE);
                //    "Submission Date":=TODAY;
                //     MESSAGE(Text001);*/
                // end

                // end;
            }
            action("Forward for Processing")
            {
                ApplicationArea = Basic;
                Caption = 'Forward for Processing';
                Gesture = LeftSwipe;
                Image = Add;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = false;
                Visible = false;
                ToolTip = 'Executes the Forward for Processing action.';
                trigger OnAction()
                begin

                    // AccreditationSetups.Get();
                    // TestField(Converted, false);
                    // /*IF Job.FIND('-') THEN BEGIN
                    //   ERROR('');
                    //  END ELSE BEGIN*/
                    // Job.Init;
                    // Job."No." := "Accreditation No.";
                    // Job.Validate(Description, "Institution Name." + ' ' + 'Accreditation');
                    // Job.Validate("Bill-to Customer No.", AccreditationSetups."Programme Evaluation Nos.");
                    // Job."Creation Date" := Today;
                    // Job."Starting Date" := Today;
                    // Job.Insert(true);

                    // //insert lines
                    // JobTaskLines.Reset;
                    // JobTasks.SetRange("Accreditation Type", JobTasks."accreditation type"::Institution);
                    // if JobTasks.FindSet then begin
                    //     repeat
                    //         JobTaskLines."Job Task No." := JobTasks.Code;
                    //         JobTaskLines."Job No." := "Accreditation No.";
                    //         JobTaskLines.Description := JobTasks.Description;
                    //         JobTaskLines.Insert(true);
                    //     until JobTasks.Next = 0;


                    //     Message('The project %1 has been created,Kindly proceed to assign tasks', Job."No.");
                    //     "Convereted By" := UserId;
                    //     Converted := true;
                    // end;

                end;
            }
            action(Dimensions)
            {
                ApplicationArea = Basic;
                Caption = 'Dimensions';
                Image = Dimensions;
                RunObject = Page "Default Dimensions";
                ShortCutKey = 'Shift+Ctrl+D';
                ToolTip = 'Executes the Dimensions action.';
            }
        }
        // Page "Sales Invoice";
        //     AccreditationSetups;
        //     ApplicationAreaSetup;
        //     LinesInstructionMgt;
        //     SalesPostYesNo;
        //     ReceiptHeader;
        //     ReceiptLines;
        //     PaymentPost;
        //     Banks;
        //     CustomerLedgerEntry;
        //     Cust;
        //     BOSAACC;
        //     Job;
        //     JobTaskLines;
        //     Amount;
        //     JobTasks;
        //     ""
    }
}
#pragma implicitwith restore
