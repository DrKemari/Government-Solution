#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51233 "New Programme"
{
    PageType = Card;
    SaveValues = true;
    SourceTable = "Acc Fee Schedules";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(Service; Rec.Service)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Service field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Currency; Rec.Currency)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Currency field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field("Application Type"; Rec."Application Type")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Application Type field.';
                }
                // field("Date Created"; "Date Created")
                // {
                //     ApplicationArea = Basic;
                //     Editable = false;
                //     ToolTip = 'Specifies the value of the Date Created field.';
                // }
                // field("Created By"; "Created By")
                // {
                //     ApplicationArea = Basic;
                //     Editable = false;
                //     ToolTip = 'Specifies the value of the Created By field.';
                // }
                group("Program Details")
                {
                    field("Applies To New"; Rec."Applies To New")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Applies To New field.';
                    }
                    field(Blocked; Rec.Blocked)
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Blocked field.';
                    }
                    field("Resource No."; Rec."Resource No.")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Resource No. field.';
                    }
                }
            }
            group("Communication details")
            {
                Editable = false;
                field("Effective Date"; Rec."Effective Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Effective Date field.';
                }
                // field(City; City)
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the City field.';
                // }
                // field(Contact; Contact)
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Contact field.';
                // }
                // field("Telex No."; "Telex No.")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Telex No. field.';
                // }
            }
            group("Verification & Confirmation")
            {
                group("Payment details")
                {
                    field("No. Series"; Rec."No. Series")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the No. Series field.';
                    }
                    // field("Receipt No."; "Receipt No.")
                    // {
                    //     ApplicationArea = Basic;
                    //     ToolTip = 'Specifies the value of the Receipt No. field.';
                    // }
                    // field("Invoice No."; "Invoice No.")
                    // {
                    //     ApplicationArea = Basic;
                    //     ToolTip = 'Specifies the value of the Invoice No. field.';
                    // }
                    // field("Receipt Amount"; "Receipt Amount")
                    // {
                    //     ApplicationArea = Basic;
                    //     ToolTip = 'Specifies the value of the Receipt Amount field.';
                    // }
                    // field("Invoice Amount"; "Invoice Amount")
                    // {
                    //     ApplicationArea = Basic;
                    //     ToolTip = 'Specifies the value of the Invoice Amount field.';
                    // }
                }
                group("Mandatory details")
                {
                    // field("Curriculum Document"; "Curriculum Document")
                    // {
                    //     ApplicationArea = Basic;
                    //     RowSpan = 2;
                    //     ToolTip = 'Specifies the value of the Curriculum Document field.';
                    // }
                    field("Amount LCY"; Rec."Amount LCY")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Amount LCY field.';
                    }
                    // field("Payment Document"; "Payment Document")
                    // {
                    //     ApplicationArea = Basic;
                    //     ToolTip = 'Specifies the value of the Payment Document field.';
                    // }
                }
            }
        }
        area(factboxes)
        {
            part(Control47; "Customer Picture")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "No." = field(Description);
            }
            part(CustomerStatisticsFactBox; "Customer Statistics FactBox")
            {
                ApplicationArea = Advanced;
                SubPageLink = "No." = field(Description);
            }
            part(WorkflowStatus; "Workflow Status FactBox")
            {
                ApplicationArea = Suite;
                Editable = false;
                Enabled = false;
                ShowFilter = false;
            }
            systempart(Control36; Links)
            {
                ApplicationArea = Basic;
            }
            systempart(Control35; Notes)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(creation)
        {
            separator(Action27)
            {
                Caption = '       -';
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
            action("Complete Curriculum Document")
            {
                ApplicationArea = Basic;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Complete Curriculum Document action.';
                trigger OnAction()
                begin
                    // TestField("Curriculum Document", false);
                    // UserSetup.SetRange("User ID", UserId);
                    // if UserSetup.FindSet then begin
                    //     if UserSetup."Portal User" = false then
                    //         Error('You must be authorised to complete this process.Contact the System Admin');
                    //     if Confirm('Are you sure you want to complete the document?', false) then begin
                    //         Message('The proposal document has been completed');
                    //         Status := Status::"1";
                    //         Modify();
                    //         CreateJob(Description);

                    //     end
                    // end
                end;
            }
            action("Assign Project Reviewers")
            {
                ApplicationArea = Basic;
                Image = add;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;
                RunObject = Page "Assigned  Allocation Card";
                RunPageMode = Create;
                RunPageView = sorting(Code, "Topic Code");
                ToolTip = 'Executes the Assign Project Reviewers action.';
                trigger OnAction()
                begin
                    // TestField(Status, Rec.Status::"0");
                    // // Condition to check if the document has been verified before an inspection committe is selected
                    // ResourceTable.Reset;
                    // ResourceTable.SetRange("Accreditation No.", Service);
                    // if ResourceTable.FindSet then begin
                    //     Message('Resources have been added editing is allowed');
                    //     Page.RunModal(51226, ResourceTable, Service);
                    // end else begin
                    //     ResourceTable.Init;
                    //     ResourceTable.Code := '';
                    //     ResourceTable."Accreditation No." := Service;
                    //     Job.Reset;
                    //     Job.SetRange("Fund Opportunity Name", Service);
                    //     if Job.FindSet then begin
                    //         ResourceTable."Topic Code" := Job."No.";
                    //     end;
                    //     ResourceTable.Validate("Topic Code");
                    //     ResourceTable.Insert(true);
                    //     Commit;
                    //     Page.RunModal(51226, ResourceTable, Service);
                    // end;
                end;
            }
            action("Create Receipt")
            {
                ApplicationArea = Basic;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page Receipt;
                //  RunPageLink = "Depot Name" = field(Field30);
                RunPageMode = Edit;
                ToolTip = 'Executes the Create Receipt action.';
                trigger OnAction()
                begin
                    // CalcFields("Receipt No.");
                    // if "Receipt No." = '' then begin
                    //     CReceipt(Service);

                    // end else
                    //     Error('Receipt number %1,is already created', "Receipt No.");
                end;
            }
            action("Project Costs")
            {
                ApplicationArea = Basic;
                Image = person;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;
                RunObject = Page "Job Card";
                RunPageLink = "No." = field(Service);
                ToolTip = 'Executes the Project Costs action.';
            }
        }
        // Page "Sales Invoice";
        //     GenSetUp;
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
        //     Text002Codeunit ""
    }
}
#pragma implicitwith restore
