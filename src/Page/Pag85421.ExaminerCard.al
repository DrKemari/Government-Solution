#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85421 "Examiner Card"
{
    Caption = 'Resource Card';
    PageType = Card;
    PromotedActionCategories = 'New,Process,Report,Resource,Navigate,Prices,Planning';
    RefreshOnActivate = true;
    SourceTable = Resource;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Importance = Standard;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                    Visible = true;

                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update;
                    end;
                }
                field("Examiner Code"; Rec."Examiner Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Examiner Code field.';
                }
                field("Exam Task Type"; Rec."Exam Task Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Exam Task Type field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies a description of the resource.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Jobs;
                    Importance = Promoted;
                    ToolTip = 'Specifies whether the resource is a person or a machine.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies that the related record is blocked from being posted in transactions, for example a customer that is declared insolvent or an item that is placed in quarantine.';
                }
            }
            group("Personal Data")
            {
                Caption = 'Personal Data';
                field("Job Title"; Rec."Job Title")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the person''s job title.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the address or location of the resource, if applicable.';
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies additional address information.';
                }
                field("Social Security No."; Rec."Social Security No.")
                {
                    ApplicationArea = Jobs;
                    Caption = 'PIN No.';
                    ToolTip = 'Specifies the person''s social security number or the machine''s serial number.';
                }
                field("M-Pesa Number"; Rec."M-Pesa Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the M-Pesa Number field.';
                }
                field("ID/Passport No"; Rec."ID/Passport No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ID/Passport No field.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the city of the resource''s address.';
                }
                field("E-mail Address"; Rec."E-mail Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the E-mail Address field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    Caption = 'Confirm Email';
                    ToolTip = 'Specifies the value of the Confirm Email field.';
                }
                field(County; Rec.County)
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies a special region, to which the resource belongs.';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the postal code.';
                }
                field("Country/Region Code"; Rec."Country/Region Code")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the country/region of the address.';

                    trigger OnValidate()
                    begin
                        IsCountyVisible := FormatAddress.UseCounty(Rec."Country/Region Code");
                    end;
                }
                field(Education; Rec.Education)
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the training, education, or certification level of the person.';
                }
                field("Employment Date"; Rec."Employment Date")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the date when the person began working for you or the date when the machine was placed in service.';
                }
            }
            group("Bank Details")
            {
                field("Bank Code"; Rec."Bank Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Code field.';
                }
                field("Bank Name"; Rec."Bank Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Bank Name field.';
                }
                field("Bank Branch No."; Rec."Bank Branch No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Branch No. field.';
                }
                field("Branch Name"; Rec."Branch Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Branch Name field.';
                }
                field("Bank Account No."; Rec."Bank Account No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Account No. field.';
                }
            }
            part(Control5; "Examiner History")
            {
                SubPageLink = "Examiner Code" = field("No.");
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            part(Control39; "Resource Picture")
            {
                ApplicationArea = Jobs;
                SubPageLink = "No." = field("No.");
            }
            part("Attached Documents"; "Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID" = const(156),
                              "No." = field("No.");
            }
            part(Control1906609707; "Resource Statistics FactBox")
            {
                ApplicationArea = Jobs;
                SubPageLink = "No." = field("No."),
                              "Unit of Measure Filter" = field("Unit of Measure Filter"),
                              "Chargeable Filter" = field("Chargeable Filter"),
                              "Service Zone Filter" = field("Service Zone Filter");
                Visible = true;
            }
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
                Visible = true;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(Papers)
            {
                ApplicationArea = Basic, Suite;
                Image = Skills;
                Promoted = true;
                PromotedCategory = Category5;
                RunObject = Page "Setter Papers";
                RunPageLink = "Marker No" = field("No.");
                ToolTip = 'Executes the Papers action.';
            }
        }
        area(navigation)
        {
            group("&Resource")
            {
                Caption = '&Resource';
                Image = Resource;
                action(Dimensions)
                {
                    ApplicationArea = Dimensions;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Default Dimensions";
                    RunPageLink = "Table ID" = const(156),
                                  "No." = field("No.");
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';
                }
                action("&Picture")
                {
                    ApplicationArea = Jobs;
                    Caption = '&Picture';
                    Image = Picture;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = Page "Resource Picture";
                    RunPageLink = "No." = field("No.");
                    ToolTip = 'View or add a picture of the resource or, for example, the company''s logo.';
                    Visible = false;
                }
                action("Units of Measure")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Units of Measure';
                    Image = UnitOfMeasure;
                    RunObject = Page "Resource Units of Measure";
                    RunPageLink = "Resource No." = field("No.");
                    ToolTip = 'View or edit the units of measure that are set up for the resource.';
                }
                action("S&kills")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'S&kills';
                    Image = Skills;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = Page "Resource Skills";
                    RunPageLink = Type = const(Resource),
                                  "No." = field("No.");
                    ToolTip = 'View the assignment of skills to the resource. You can use skill codes to allocate skilled resources to service items or items that need special skills for servicing.';
                }
                separator(Action34)
                {
                    Caption = '';
                }
                action(Attachments)
                {
                    ApplicationArea = All;
                    Caption = 'Attachments';
                    Image = Attach;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                    trigger OnAction()
                    var
                        DocumentAttachmentDetails: Page "Document Attachment Details";
                        RecRef: RecordRef;
                    begin
                        RecRef.GetTable(Rec);
                        DocumentAttachmentDetails.OpenForRecRef(RecRef);
                        DocumentAttachmentDetails.RunModal;
                    end;
                }
            }
            group("Plan&ning")
            {
                Caption = 'Plan&ning';
                Image = Planning;
                action("Resource &Allocated per Job")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Resource &Allocated per Job';
                    Image = ViewJob;
                    RunObject = Page "Resource Allocated per Job";
                    RunPageLink = "Resource Filter" = field("No.");
                    ToolTip = 'View this job''s resource allocation.';
                }
            }
            group(History)
            {
                Caption = 'History';
                Image = History;
                action("Ledger E&ntries")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Ledger E&ntries';
                    Image = ResourceLedger;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Resource Ledger Entries";
                    RunPageLink = "Resource No." = field("No.");
                    RunPageView = sorting("Resource No.")
                                  order(descending);
                    ShortCutKey = 'Ctrl+F7';
                    ToolTip = 'View the history of transactions that have been posted for the selected record.';
                }
            }
        }
        area(reporting)
        {
            action("Resource Statistics")
            {
                ApplicationArea = Jobs;
                Caption = 'Resource Statistics';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Resource Statistics";
                ToolTip = 'View detailed, historical information for the resource.';
            }
            action("Resource Usage")
            {
                ApplicationArea = Jobs;
                Caption = 'Resource Usage';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Resource Usage";
                ToolTip = 'View the resource utilization that has taken place. The report includes the resource capacity, quantity of usage, and the remaining balance.';
            }
            action("Resource - Cost Breakdown")
            {
                ApplicationArea = Jobs;
                Caption = 'Resource - Cost Breakdown';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Resource - Cost Breakdown";
                ToolTip = 'View the direct unit costs and the total direct costs for each resource. Only usage postings are considered in this report. Resource usage can be posted in the resource journal or the job journal.';
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    var
        CRMCouplingManagement: Codeunit "CRM Coupling Management";
    begin
        if CRMIntegrationEnabled then begin
            CRMIsCoupledToRecord := CRMCouplingManagement.IsRecordCoupledToCRM(Rec.RecordId);
            if Rec."No." <> xRec."No." then
                CRMIntegrationManagement.SendResultNotification(Rec);
        end;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        //"Resource Type":="Resource Type"::" ";
    end;

    trigger OnOpenPage()
    begin
        CRMIntegrationEnabled := CRMIntegrationManagement.IsCRMIntegrationEnabled;
        SetNoFieldVisible;
        IsCountyVisible := FormatAddress.UseCounty(Rec."Country/Region Code");
    end;

    var
        CRMIntegrationManagement: Codeunit "CRM Integration Management";
        FormatAddress: Codeunit "Format Address";
        CRMIntegrationEnabled: Boolean;
        CRMIsCoupledToRecord: Boolean;
        NoFieldVisible: Boolean;
        IsCountyVisible: Boolean;

    local procedure SetNoFieldVisible()
    var
        DocumentNoVisibility: Codeunit DocumentNoVisibility;
    begin
        NoFieldVisible := DocumentNoVisibility.ResourceNoIsVisible;
    end;
}

#pragma implicitwith restore

