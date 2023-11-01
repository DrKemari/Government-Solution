#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
PageExtension 50010 "pageextension50010" extends "Vendor Card"
{

    //Unsupported feature: Property Insertion (DeleteAllowed) on ""Vendor Card"(Page 26)".

    layout
    {
        addafter(Blocked)
        {
            field(Trainer; Rec.Trainer)
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Balance Due (LCY)")
        {
            field(Category; Rec.Category)
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Responsibility Center")
        {
            field("Supplier Category"; Rec."Supplier Category")
            {
                ApplicationArea = Basic;
            }
            field("Special Category"; Rec."Special Category")
            {
                ApplicationArea = Basic;
            }
        }
        addafter("Address & Contact")
        {
            group("Vendor Details")
            {
                Caption = 'Vendor Details';
                group("Business Details")
                {
                    Caption = 'Business Details';
                    field("Ownership Type"; Rec."Ownership Type")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Registration/Incorporation No."; Rec."Registration/Incorporation No.")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Reg/Incorporation Date"; Rec."Reg/Incorporation Date")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Operations Start Date"; Rec."Operations Start Date")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Tax PIN No."; Rec."Tax PIN No.")
                    {
                        ApplicationArea = Basic;
                    }
                    field("NSSF No."; Rec."NSSF No.")
                    {
                        ApplicationArea = Basic;
                    }
                    field("NHIF No."; Rec."NHIF No.")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Current Vendor Class"; Rec."Current Vendor Class")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Vendor Group"; Rec."Vendor Group")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Supplier Type"; Rec."Supplier Type")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Nominal Capital LCY"; Rec."Nominal Capital LCY")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Issued Capital LCY"; Rec."Issued Capital LCY")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Dealer Type"; Rec."Dealer Type")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Max Value of Business"; Rec."Max Value of Business")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Nature of Business"; Rec."Nature of Business")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Fixed Line Tel No"; Rec."Fixed Line Tel No")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Building/House No"; Rec."Building/House No")
                    {
                        ApplicationArea = Basic;
                    }
                    field(Floor; Rec.Floor)
                    {
                        ApplicationArea = Basic;
                    }
                    field("Plot No"; Rec."Plot No")
                    {
                        ApplicationArea = Basic;
                    }
                    field(Street; Rec.Street)
                    {
                        ApplicationArea = Basic;
                    }
                    field("Authorized Signatory Name"; Rec."Authorized Signatory Name")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Signatory Designation"; Rec."Signatory Designation")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Vision Statement"; Rec."Vision Statement")
                    {
                        ApplicationArea = Basic;
                    }
                    field("Mission Statement"; Rec."Mission Statement")
                    {
                        ApplicationArea = Basic;
                    }
                }
            }
        }
    }
    actions
    {

        //Unsupported feature: Property Modification (RunPageLink) on "PayVendor(Action 98)".

        addafter(Comment)
        {
            action(CreatePortalUser)
            {
                ApplicationArea = Basic;
                Caption = 'Create as PortalUser';

                trigger OnAction()
                begin
                    //Code by SHAWn: to create portal user
                    portalusers.Reset;
                    portalusers.SetRange("customer No", Rec."No.");
                    if portalusers.FindSet() then begin
                        Error('That user is already created as a portal user!');
                    end
                    else begin
                        // MESSAGE("E-Mail");
                        portalusers.Init;
                        portalusers."customer No" := Rec."No.";
                        portalusers.Password := Format(fnRandomPass);
                        portalusers.usertype := 1; //1 for directors
                        portalusers.Email := Rec."E-Mail";
                        if portalusers.Insert then begin
                            Message('User created as a director succeffully!')
                        end else begin
                            Error('Unknown error occured!');
                        end
                    end
                end;
            }
        }
        addafter("Vendor - Balance to Date")
        {
            action("Vendor Statement")
            {
                ApplicationArea = Basic;
                Caption = 'Vendor Statement';
                Image = Document;
                Promoted = true;
                PromotedCategory = "Report";

                trigger OnAction()
                begin
                    Vendor.SetRange("No.", Rec."No.");
                    Report.Run(69036, true, false, Vendor);
                end;
            }
        }
    }

    var
        Vendor: Record Vendor;
        portalusers: Record portalusers;


    //Unsupported feature: Code Modification on "OnAfterGetCurrRecord".

    //trigger OnAfterGetCurrRecord()
    //>>>> ORIGINAL CODE:
    //begin
    /*
    CreateVendorFromTemplate;
    ActivateFields;
    OpenApprovalEntriesExistCurrUser := //ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RECORDID);
  //  OpenApprovalEntriesExist := //ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
    ShowWorkflowStatus := CurrPage.WorkflowStatus.PAGE.SetFilterOnWorkflowRecord(RECORDID);
    CanCancelApprovalForRecord := //ApprovalsMgmt.CanCancelApprovalForRecord(RECORDID);
    WorkflowWebhookManagement.GetCanRequestAndCanCancel(RECORDID,CanRequestApprovalForFlow,CanCancelApprovalForFlow);

    IF "No." <> '' THEN
      CurrPage.AgedAccPayableChart.PAGE.UpdateChartForVendor("No.");
    */
    //end;
    //>>>> MODIFIED CODE:
    //begin
    /*
     CreateVendorFromTemplate;
     ActivateFields;
     OpenApprovalEntriesExistCurrUser := //ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RECORDID);
   //  OpenApprovalEntriesExist := //ApprovalsMgmt.HasOpenApprovalEntries(RecordId);
     ShowWorkflowStatus := CurrPage.WorkflowStatus.PAGE.SetFilterOnWorkflowRecord(RECORDID);
     CanCancelApprovalForRecord := //ApprovalsMgmt.CanCancelApprovalForRecord(RECORDID);
     WorkflowWebhookManagement.GetCanRequestAndCanCancel(RECORDID,CanRequestApprovalForFlow,CanCancelApprovalForFlow);
    #8..10
    */
    //end;

    procedure fnRandomPass() intPass: Integer
    begin
        Randomize();
        intPass := Random(10000);
    end;
}

#pragma implicitwith restore

