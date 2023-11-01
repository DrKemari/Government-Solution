#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
/// <summary>
/// Page DCS Inst. Accreditation (ID 51220).
/// </summary>
#pragma implicitwith disable
Page 51220 "DCS Inst. Accreditation"
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
            group(Control36)
            {
                field("DCS Comment"; Rec."DCS Comment")
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the DCS Comment field.';
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
            action("Complete Proposal Document")
            {
                ApplicationArea = Basic;
                Promoted = true;
                PromotedCategory = Process;
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
                ToolTip = 'Executes the Assign Project Reviewers action.';
                trigger OnAction()
                begin
                    // ResourceTable.Reset;
                    // ResourceTable.SetRange("Accreditation No.", "Accreditation No.");
                    // if ResourceTable.FindSet then begin
                    //     Message('Resources for this accreditation have already been assigned,you can only view them');
                    // end else begin
                    //     CashMgt.Get();
                    //     NoSeriesMgt.InitSeries(CashMgt."PV Nos", CashMgt."PV Nos", 0D, NoSeries, CashMgt."PV Nos");
                    //     ResourceTable.Init;
                    //     ResourceTable.Code := NoSeries;
                    //     ResourceTable."Accreditation No." := "Accreditation No.";
                    //     ResourceTable.Insert(true);
                    // end
                end;
            }
            action("View Assigned Reviewers")
            {
                ApplicationArea = Basic;
                Image = view;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Assigned  Allocation Card";
                //  RunPageLink = Field8 = field("Accreditation No.");
                RunPageMode = Edit;
                ToolTip = 'Executes the View Assigned Reviewers action.';
            }
            action("Project Costs")
            {
                ApplicationArea = Basic;
                Image = person;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Job Card";
                RunPageLink = "Fund Opportunity Name" = field("Accreditation No.");
                ToolTip = 'Executes the Project Costs action.';
            }
            action("Proposal Document Comments")
            {
                ApplicationArea = Basic;
                Gesture = LeftSwipe;
                Promoted = true;
                PromotedIsBig = true;
                RunObject = Page "Proposal Document Comment";
                RunPageLink = "Accreditation No." = field("Accreditation No.");
                RunPageMode = View;
                ToolTip = 'Executes the Proposal Document Comments action.';
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
