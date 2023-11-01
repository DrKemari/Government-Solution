#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
/// <summary>
/// Page Revision Inst. Accreditation (ID 51222).
/// </summary>
#pragma implicitwith disable
Page 51222 "Revision Inst. Accreditation"
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
                }
                field("Institution No."; Rec."Institution No.")
                {
                    ApplicationArea = Basic;
                }
                field("Institution Name."; Rec."Institution Name.")
                {
                    ApplicationArea = Basic;
                }
                field("Insitution Campus No."; Rec."Insitution Campus No.")
                {
                    ApplicationArea = Basic;
                }
                field("Institution Campus"; Rec."Institution Campus")
                {
                    ApplicationArea = Basic;
                }
                field("Institution Phone No."; Rec."Institution Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field("Convereted By"; Rec."Convereted By")
                {
                    ApplicationArea = Basic;
                }
                field("Accreditation Code"; Rec."Accreditation Code")
                {
                    ApplicationArea = Basic;
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = Basic;
                }
                field("Submission Date"; Rec."Submission Date")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
            }
            group("Other Details")
            {
                Editable = false;
                field("KRA Pin"; Rec."KRA Pin")
                {
                    ApplicationArea = Basic;
                }
                field(Sponsor; Rec.Sponsor)
                {
                    ApplicationArea = Basic;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    Caption = 'Email';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                }
                field(County; Rec.County)
                {
                    ApplicationArea = Basic;
                }
                field(Constituency; Rec.Constituency)
                {
                    ApplicationArea = Basic;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                }
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
            action("Assign Project Reviewers")
            {
                ApplicationArea = Basic;
                Caption = 'Assign Inspection Committee';
                Image = add;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;

                trigger OnAction()
                begin
                    // TestField(Status,Rec.Status::"Awaiting Peer Review");
                    // // Condition to check if the document has been verified before an inspection committe is selected
                    // ResourceTable.Reset;
                    // ResourceTable.SetRange("Accreditation No.","Accreditation No.");
                    // if ResourceTable.FindSet then begin
                    //   Message('Resources have been added editing is allowed');
                    //      Page.RunModal(51229,ResourceTable,"Accreditation No.");
                    // end else begin
                    //  ResourceTable.Init;
                    //  ResourceTable.Code:='';
                    //  ResourceTable."Accreditation No.":="Accreditation No.";
                    //     Job.Reset;
                    //     Job.SetRange("Fund Opportunity Name","Accreditation No.");
                    //     if Job.FindSet then begin
                    //          ResourceTable."Topic Code":=Job."No.";
                    //     end;
                    //  ResourceTable.Validate("Topic Code");
                    //  ResourceTable.Insert(true);
                    //  Commit;
                    //  Page.RunModal(51229,ResourceTable,"Accreditation No.");
                    //  end;
                end;
            }
            action("View Assigned Reviewers")
            {
                ApplicationArea = Basic;
                Caption = 'View Assigned Committee';
                Image = view;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Assigned  Allocation Card";
                //  RunPageLink = Field8=field("Accreditation No.");
                RunPageMode = Edit;
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
            }
            action(Dimensions)
            {
                ApplicationArea = Basic;
                Caption = 'Dimensions';
                Image = Dimensions;
                RunObject = Page "Default Dimensions";
                ShortCutKey = 'Shift+Ctrl+D';
            }
        }
        // Page "Ammendment Allocation List";
        //                 RunPageLink = "Topic Code"=Page "Sales Invoice";
        //         GenSetUp;
        //         ApplicationAreaSetup;
        //         LinesInstructionMgt;
        //         SalesPostYesNo;
        //         ReceiptHeader;
        //         ReceiptLines;
        //         PaymentPost;
        //         Banks;
        //         CustomerLedgerEntry;
        //         Cust;
        //         BOSAACC;
        //         Job;
        //         JobTaskLines;
        //         Amount;
        //         JobTasks;
        //         UserSetup;
        //         completed;
        //         CashMgt;
        //         NoSeriesMgt;
        //         NoSeries;
        //         ResourceTable;
        //         Editablehod;
        //         Editableceo;
        //         Editabledcs;
        //         edihod;
        //         ediceo;
        //         ""
    }
}
#pragma implicitwith restore
