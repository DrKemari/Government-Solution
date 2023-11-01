#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51212 "Ongoing Inst. Accreditation"
{
    DeleteAllowed = false;
    Editable = true;
    InsertAllowed = false;
    ModifyAllowed = true;
    MultipleNewLines = true;
    PageType = Card;
    SaveValues = true;
    SourceTable = "Ins. Accreditation Table";

    layout
    {
        area(content)
        {
            group("Institution Details")
            {
                Editable = false;
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
                field("Insitution Campus No."; Rec."Insitution Campus No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Insitution Campus No. field.';
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
                field("Convereted By"; Rec."Convereted By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Convereted By field.';
                }
                field("Accreditation Code"; Rec."Accreditation Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Accreditation Code field.';
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Created field.';
                }
                field("Submission Date"; Rec."Submission Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Submission Date field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
            group("Other Details")
            {
                Editable = false;
                field("KRA Pin"; Rec."KRA Pin")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the KRA Pin field.';
                }
                field(Sponsor; Rec.Sponsor)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sponsor field.';
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
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No. field.';
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
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the City field.';
                }
            }
            group("Payment Details")
            {
                field("Receipt No."; Rec."Receipt No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Receipt No. field.';
                }
                field("Received Amount"; Rec."Received Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Received Amount field.';
                }
                field("Invoice No."; Rec."Invoice No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Invoice No. field.';
                }
                field("Invoiced Amount"; Rec."Invoiced Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Invoiced Amount field.';
                }
            }
            group(Approvals)
            {
                field("Rejection Reason"; Rec."Rejection Reason")
                {
                    ApplicationArea = Basic;
                    //  Enabled = edihod;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Rejection Reason field.';
                }
                field("DCS Comment"; Rec."DCS Comment")
                {
                    ApplicationArea = Basic;
                    //   Enabled = edidcs;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the DCS Comment field.';
                }
                field("CEO Comment"; Rec."CEO Comment")
                {
                    ApplicationArea = Basic;
                    //  Enabled = ediceo;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the CEO Comment field.';
                }
            }
        }
        area(factboxes)
        {
            part(Control39; "Customer Picture")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "No." = field("Institution No.");
            }
            part(CustomerStatisticsFactBox; "Customer Statistics FactBox")
            {
                ApplicationArea = Advanced;
                SubPageLink = "No." = field("Institution No.");
            }
            systempart(Control23; Links)
            {
                ApplicationArea = Basic;
            }
            systempart(Control12; Notes)
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
            action("Project Costs")
            {
                ApplicationArea = Basic;
                Image = project;
                Promoted = true;
                PromotedCategory = Category5;
                PromotedIsBig = true;
                RunObject = Page "Job Card";
                RunPageLink = "Fund Opportunity Name" = field("Accreditation No.");
                ToolTip = 'Executes the Project Costs action.';
            }
            action("Proposal Document Comments")
            {
                ApplicationArea = Basic;
                Image = document;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                RunObject = Page "Proposal Documents Comments";
                RunPageLink = "Accreditation No." = field(upperlimit("Accreditation No."));
                RunPageMode = View;
                ToolTip = 'Executes the Proposal Document Comments action.';
            }
            action("Complete Proposal Document")
            {
                ApplicationArea = Basic;
                Image = complete;
                Promoted = true;
                PromotedCategory = Category4;
                PromotedIsBig = true;
                Visible = false;
                ToolTip = 'Executes the Complete Proposal Document action.';
                trigger OnAction()
                begin

                    // TestField("Proposal Document", false);
                    // TestField("CEO Comment");
                    // UserSetup.SetRange("User ID", UserId);
                    // if UserSetup.FindSet then begin
                    //     if UserSetup."Portal User" = false then
                    //         Error('You must be authorised to complete this process.Contact the System Admin');
                    //     if Confirm('Are you sure you want to complete the document?', false) then begin
                    //         Message('The proposal document has been completed');
                    //         "Proposal Document" := true;
                    //         Status := Status::"Awaiting Payment Processing";
                    //         Modify();

                end;
                 //   end;
                //end;
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
        // Page "Resource Project Allocation";
        //     RunPageLink = "Job No"=Page "Proposed Peer Reviewers";
        //     RunPageLink = "Document No."=Page "Assigned  Allocation Card";
        //     RunPageLink = Field8=Page "Sales Invoice";
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
        //     JobTasks;
        //     UserSetup;
        //     completed;
        //     CashMgt;
        //     NoSeriesMgt;
        //     NoSeries;
        //     ResourceTable;
        //     Editablehod;
        //     Editableceo;
        //     Editabledcs;
        //     edihod;
        //     ediceo;
        //     ""
    }
}
#pragma implicitwith restore
