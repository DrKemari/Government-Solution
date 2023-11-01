#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 85534 "Resources Card"
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
                field(No;Rec."No.")
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
                field(Name;Rec.Name)
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies a description of the resource.';
                }
                field(Type;Rec.Type)
                {
                    ApplicationArea = Jobs;
                    Importance = Promoted;
                    ToolTip = 'Specifies whether the resource is a person or a machine.';
                }
                field(BaseUnitofMeasure;Rec."Base Unit of Measure")
                {
                    ApplicationArea = Jobs;
                    Importance = Promoted;
                    ToolTip = 'Specifies the base unit used to measure the resource, such as hour, piece, or kilometer.';
                }
                field(SearchName;Rec."Search Name")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies an alternate name that you can use to search for the record in question when you cannot remember the value in the Name field.';
                }
                field(ResourceGroupNo;Rec."Resource Group No.")
                {
                    ApplicationArea = Jobs;
                    Importance = Promoted;
                    ToolTip = 'Specifies the resource group that this resource is assigned to.';
                }
                field(JobGroup;Rec."Job Group")
                {
                    ApplicationArea = Basic;
                }
                field(Interns;Rec.Interns)
                {
                    ApplicationArea = Basic;
                }
                field(Blocked;Rec.Blocked)
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies that the related record is blocked from being posted in transactions, for example a customer that is declared insolvent or an item that is placed in quarantine.';
                }
                field(PrivacyBlocked;Rec."Privacy Blocked")
                {
                    ApplicationArea = Jobs;
                    Importance = Additional;
                    ToolTip = 'Specifies whether to limit access to data for the data subject during daily operations. This is useful, for example, when protecting data from changes while it is under privacy review.';
                }
                field(LastDateModified;Rec."Last Date Modified")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the date of the most recent change of information in the Resource Card window.';
                }
                field(UseTimeSheet;Rec."Use Time Sheet")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies if a resource uses a time sheet to record time allocated to various tasks.';
                }
                field(TimeSheetOwnerUserID;Rec."Time Sheet Owner User ID")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the name of the owner of the time sheet.';
                }
                field(TimeSheetApproverUserID;Rec."Time Sheet Approver User ID")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the ID of the approver of the time sheet.';
                }
            }
            group(Invoicing)
            {
                Caption = 'Invoicing';
                field(DirectUnitCost;Rec."Direct Unit Cost")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the cost of one unit of the selected item or resource.';
                }
                field(IndirectCost;Rec."Indirect Cost %")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the percentage of the item''s last purchase cost that includes indirect costs, such as freight that is associated with the purchase of the item.';
                }
                field(UnitCost;Rec."Unit Cost")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the cost of one unit of the item or resource on the line.';
                }
                field(PriceProfitCalculation;Rec."Price/Profit Calculation")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the relationship between the Unit Cost, Unit Price, and Profit Percentage fields associated with this resource.';
                }
                field(Profit;Rec."Profit %")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the profit margin that you want to sell the resource at. You can enter a profit percentage manually or have it entered according to the Price/Profit Calculation field';
                }
                field(UnitPrice;Rec."Unit Price")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the price of one unit of the item or resource. You can enter a price manually or have it entered according to the Price/Profit Calculation field on the related card.';
                }
                field(GenProdPostingGroup;Rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = Jobs;
                    Importance = Promoted;
                    ToolTip = 'Specifies the item''s product type to link transactions made for this item with the appropriate general ledger account according to the general posting setup.';
                }
                field(VATProdPostingGroup;Rec."VAT Prod. Posting Group")
                {
                    ApplicationArea = Jobs;
                    Importance = Promoted;
                    ToolTip = 'Specifies the VAT specification of the involved item or resource to link transactions made for this record with the appropriate general ledger account according to the VAT posting setup.';
                }
                field(DefaultDeferralTemplate;Rec."Default Deferral Template Code")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Default Deferral Template';
                    ToolTip = 'Specifies the default template that governs how to defer revenues and expenses to the periods when they occurred.';
                }
                field(AutomaticExtTexts;Rec."Automatic Ext. Texts")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies that an Extended Text Header will be added on sales or purchase documents for this resource.';
                }
                field(ICPartnerPurchGLAccNo;Rec."IC Partner Purch. G/L Acc. No.")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the intercompany g/l account number in your partner''s company that the amount for this resource is posted to.';
                }
            }
            group(PersonalData)
            {
                Caption = 'Personal Data';
                field(JobTitle;Rec."Job Title")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the person''s job title.';
                }
                field(Address;Rec.Address)
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the address or location of the resource, if applicable.';
                }
                field(Address2;Rec."Address 2")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies additional address information.';
                }
                field(PINNo;Rec."Social Security No.")
                {
                    ApplicationArea = Jobs;
                    Caption = 'PIN No.';
                    ToolTip = 'Specifies the person''s social security number or the machine''s serial number.';
                }
                field(BankCode;Rec."Bank Code")
                {
                    ApplicationArea = Basic;
                }
                field(BankName;Rec."Bank Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(BankBranchNo;Rec."Bank Branch No.")
                {
                    ApplicationArea = Basic;
                }
                field(BranchName;Rec."Branch Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(BankAccountNo;Rec."Bank Account No.")
                {
                    ApplicationArea = Basic;
                }
                field(MPesaNumber;Rec."M-Pesa Number")
                {
                    ApplicationArea = Basic;
                }
                field(IDPassportNo;Rec."ID/Passport No")
                {
                    ApplicationArea = Basic;
                }
                field(City;Rec.City)
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the city of the resource''s address.';
                }
                field(ServiceNo;Rec."Service No")
                {
                    ApplicationArea = Basic;
                }
                field(EmailAddress;Rec."E-mail Address")
                {
                    ApplicationArea = Basic;
                }
                field(Email;Rec.Email)
                {
                    ApplicationArea = Basic;
                    Caption = 'Confirm Email';
                }
                group(Control47)
                {
                    Visible = IsCountyVisible;
                    field(County;Rec.County)
                    {
                        ApplicationArea = Jobs;
                        ToolTip = 'Specifies a special region, to which the resource belongs.';
                    }
                }
                field(PostCode;Rec."Post Code")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the postal code.';
                }
                field(CountryRegionCode;Rec."Country/Region Code")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the country/region of the address.';

                    trigger OnValidate()
                    begin
                        IsCountyVisible := FormatAddress.UseCounty(Rec."Country/Region Code");
                    end;
                }
                field(Education;Rec.Education)
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the training, education, or certification level of the person.';
                }
                field(ContractClass;Rec."Contract Class")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the contract class for the person.';
                }
                field(EmploymentDate;Rec."Employment Date")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the date when the person began working for you or the date when the machine was placed in service.';
                }
            }
            group(Examination)
            {
                Caption = 'Examination';
                Visible = false;
                field(ExamBookingCategory;Rec."Exam Booking Category")
                {
                    ApplicationArea = Basic;
                }
                field(ExamResorceType;Rec."Exam Resorce Type")
                {
                    ApplicationArea = Basic;
                }
                field(ExaminerCode;Rec."Examiner Code")
                {
                    ApplicationArea = Basic;
                }
                field(CourseID;Rec."Course ID")
                {
                    ApplicationArea = Basic;
                }
                field(PaperID;Rec."Paper ID")
                {
                    ApplicationArea = Basic;
                }
                field(PartID;Rec."Part ID")
                {
                    ApplicationArea = Basic;
                }
                field(ExamTaskType;Rec."Exam Task Type")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            part(Control39;"Resource Picture")
            {
                ApplicationArea = Jobs;
                SubPageLink = "No."=field("No.");
            }
            part("Attached Documents";"Document Attachment Factbox")
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                SubPageLink = "Table ID"=const(156),
                              "No."=field("No.");
            }
            part(Control1906609707;"Resource Statistics FactBox")
            {
                ApplicationArea = Jobs;
                SubPageLink = "No."=field("No."),
                              "Unit of Measure Filter"=field("Unit of Measure Filter"),
                              "Chargeable Filter"=field("Chargeable Filter"),
                              "Service Zone Filter"=field("Service Zone Filter");
                Visible = true;
            }
            systempart(Control1900383207;Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control1905767507;Notes)
            {
                ApplicationArea = Notes;
                Visible = true;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Resource)
            {
                Caption = '&Resource';
                Image = Resource;
                action(Statistics)
                {
                    ApplicationArea = Jobs;
                    Caption = 'Statistics';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Resource Statistics";
                    RunPageLink = "No."=field("No."),
                                  "Date Filter"=field("Date Filter"),
                                  "Unit of Measure Filter"=field("Unit of Measure Filter"),
                                  "Chargeable Filter"=field("Chargeable Filter");
                    ShortCutKey = 'F7';
                    ToolTip = 'View statistical information, such as the value of posted entries, for the record.';
                }
                action(Papers)
                {
                    ApplicationArea = Basic;
                    Image = Documents;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Marker Task Allocation";
                    RunPageLink = "Resource No"=field("No.");
                }
                action("Examination Role Allocation")
                {
                    ApplicationArea = Basic;
                    Image = ResourceGroup;
                    Promoted = true;
                    PromotedCategory = Category6;
                    PromotedIsBig = true;
                    RunObject = Page "Resource Role Allocation";
                    RunPageLink = "Resource No"=field("No.");
                }
                action(Dimensions)
                {
                    ApplicationArea = Dimensions;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Default Dimensions";
                    RunPageLink = "Table ID"=const(156),
                                  "No."=field("No.");
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';
                }
                action(Picture)
                {
                    ApplicationArea = Jobs;
                    Caption = '&Picture';
                    Image = Picture;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = Page "Resource Picture";
                    RunPageLink = "No."=field("No.");
                    ToolTip = 'View or add a picture of the resource or, for example, the company''s logo.';
                }
                action(ExtendedTexts)
                {
                    ApplicationArea = Suite;
                    Caption = 'E&xtended Texts';
                    Image = Text;
                    RunObject = Page "Extended Text List";
                    RunPageLink = "Table Name"=const(Resource),
                                  "No."=field("No.");
                    RunPageView = sorting("Table Name","No.","Language Code","All Language Codes","Starting Date","Ending Date");
                    ToolTip = 'View the extended description that is set up.';
                }
                action(UnitsofMeasure)
                {
                    ApplicationArea = Jobs;
                    Caption = 'Units of Measure';
                    Image = UnitOfMeasure;
                    RunObject = Page "Resource Units of Measure";
                    RunPageLink = "Resource No."=field("No.");
                    ToolTip = 'View or edit the units of measure that are set up for the resource.';
                }
                action(Skills)
                {
                    ApplicationArea = Basic,Suite;
                    Caption = 'S&kills';
                    Image = Skills;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = Page "Resource Skills";
                    RunPageLink = Type=const(Resource),
                                  "No."=field("No.");
                    ToolTip = 'View the assignment of skills to the resource. You can use skill codes to allocate skilled resources to service items or items that need special skills for servicing.';
                }
                separator(Action34)
                {
                    Caption = '';
                }
                action(ResourceLocations)
                {
                    ApplicationArea = Basic,Suite;
                    Caption = 'Resource L&ocations';
                    Image = Resource;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = Page "Resource Locations";
                    RunPageLink = "Resource No."=field("No.");
                    RunPageView = sorting("Resource No.");
                    ToolTip = 'View where resources are located or assign resources to locations.';
                }
                action(Comments)
                {
                    ApplicationArea = Comments;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category4;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name"=const(Resource),
                                  "No."=field("No.");
                    ToolTip = 'View or add comments for the record.';
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
                action(OnlineMap)
                {
                    ApplicationArea = Jobs;
                    Caption = 'Online Map';
                    Image = Map;
                    ToolTip = 'View the address on an online map.';

                    trigger OnAction()
                    begin
                        Rec.DisplayMap;
                    end;
                }
                separator(Action69)
                {
                }
            }
            group(ActionGroupCRM)
            {
                Caption = 'Dynamics 365 for Sales';
                Visible = CRMIntegrationEnabled;
                action(CRMGoToProduct)
                {
                    ApplicationArea = Suite;
                    Caption = 'Product';
                    Image = CoupledItem;
                    ToolTip = 'Open the coupled Dynamics 365 for Sales product.';

                    trigger OnAction()
                    var
                        CRMIntegrationManagement: Codeunit "CRM Integration Management";
                    begin
                        CRMIntegrationManagement.ShowCRMEntityFromRecordID(Rec.RecordId);
                    end;
                }
                action(CRMSynchronizeNow)
                {
                    AccessByPermission = TableData "CRM Integration Record"=IM;
                    ApplicationArea = Suite;
                    Caption = 'Synchronize';
                    Image = Refresh;
                    ToolTip = 'Send updated data to Dynamics 365 for Sales.';

                    trigger OnAction()
                    var
                        CRMIntegrationManagement: Codeunit "CRM Integration Management";
                    begin
                        CRMIntegrationManagement.UpdateOneNow(Rec.RecordId);
                    end;
                }
                group(Coupling)
                {
                    Caption = 'Coupling', Comment='Coupling is a noun';
                    Image = LinkAccount;
                    ToolTip = 'Create, change, or delete a coupling between the Business Central record and a Dynamics 365 for Sales record.';
                    action(ManageCRMCoupling)
                    {
                        AccessByPermission = TableData "CRM Integration Record"=IM;
                        ApplicationArea = Suite;
                        Caption = 'Set Up Coupling';
                        Image = LinkAccount;
                        ToolTip = 'Create or modify the coupling to a Dynamics 365 for Sales product.';

                        trigger OnAction()
                        var
                            CRMIntegrationManagement: Codeunit "CRM Integration Management";
                        begin
                            CRMIntegrationManagement.DefineCoupling(Rec.RecordId);
                        end;
                    }
                    action(DeleteCRMCoupling)
                    {
                        AccessByPermission = TableData "CRM Integration Record"=IM;
                        ApplicationArea = Suite;
                        Caption = 'Delete Coupling';
                        Enabled = CRMIsCoupledToRecord;
                        Image = UnLinkAccount;
                        ToolTip = 'Delete the coupling to a Dynamics 365 for Sales product.';

                        trigger OnAction()
                        var
                            CRMCouplingManagement: Codeunit "CRM Coupling Management";
                        begin
                            CRMCouplingManagement.RemoveCoupling(Rec.RecordId);
                        end;
                    }
                }
                action(ShowLog)
                {
                    ApplicationArea = Suite;
                    Caption = 'Synchronization Log';
                    Image = Log;
                    ToolTip = 'View integration synchronization jobs for the resource table.';

                    trigger OnAction()
                    var
                        CRMIntegrationManagement: Codeunit "CRM Integration Management";
                    begin
                        CRMIntegrationManagement.ShowLog(Rec.RecordId);
                    end;
                }
            }
            group(Prices)
            {
                Caption = '&Prices';
                Image = Price;
                action(Costs)
                {
                    ApplicationArea = Jobs;
                    Caption = 'Costs';
                    Image = ResourceCosts;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = Page "Resource Costs";
                    RunPageLink = Type=const(Resource),
                                  Code=field("No.");
                    ToolTip = 'View or change detailed information about costs for the resource.';
                }
                action(Action62)
                {
                    ApplicationArea = Jobs;
                    Caption = 'Prices';
                    Image = Price;
                    Promoted = true;
                    PromotedCategory = Category6;
                    RunObject = Page "Resource Prices";
                    RunPageLink = Type=const(Resource),
                                  Code=field("No.");
                    ToolTip = 'View or edit prices for the resource.';
                }
            }
            group(Planning)
            {
                Caption = 'Plan&ning';
                Image = Planning;
                action(ResourceCapacity)
                {
                    ApplicationArea = Jobs;
                    Caption = 'Resource &Capacity';
                    Image = Capacity;
                    Promoted = true;
                    PromotedCategory = Category7;
                    RunObject = Page "Resource Capacity";
                    RunPageOnRec = true;
                    ToolTip = 'View this job''s resource capacity.';
                }
                action(ResourceAllocatedperJob)
                {
                    ApplicationArea = Jobs;
                    Caption = 'Resource &Allocated per Job';
                    Image = ViewJob;
                    RunObject = Page "Resource Allocated per Job";
                    RunPageLink = "Resource Filter"=field("No.");
                    ToolTip = 'View this job''s resource allocation.';
                }
                action(ResourceAllocatedperServiceOrder)
                {
                    ApplicationArea = Basic,Suite;
                    Caption = 'Resource Allocated per Service &Order';
                    Image = ViewServiceOrder;
                    RunObject = Page "Res. Alloc. per Service Order";
                    RunPageLink = "Resource Filter"=field("No.");
                    ToolTip = 'View the service order allocations of the resource.';
                }
                action(ResourceAvailability)
                {
                    ApplicationArea = Jobs;
                    Caption = 'Resource A&vailability';
                    Image = Calendar;
                    Promoted = true;
                    PromotedCategory = Category7;
                    RunObject = Page "Resource Availability";
                    RunPageLink = "No."=field("No."),
                                  "Base Unit of Measure"=field("Base Unit of Measure"),
                                  "Chargeable Filter"=field("Chargeable Filter");
                    ToolTip = 'View a summary of resource capacities, the quantity of resource hours allocated to jobs on order, the quantity allocated to service orders, the capacity assigned to jobs on quote, and the resource availability.';
                }
            }
            group(Service)
            {
                Caption = 'Service';
                Image = ServiceZone;
                action(ServiceZones)
                {
                    ApplicationArea = Service;
                    Caption = 'Service &Zones';
                    Image = ServiceZone;
                    RunObject = Page "Resource Service Zones";
                    RunPageLink = "Resource No."=field("No.");
                    ToolTip = 'View the different service zones that you can assign to customers and resources. When you allocate a resource to a service task that is to be performed at the customer site, you can select a resource that is located in the same service zone as the customer.';
                }
            }
            group(History)
            {
                Caption = 'History';
                Image = History;
                action(LedgerEntries)
                {
                    ApplicationArea = Jobs;
                    Caption = 'Ledger E&ntries';
                    Image = ResourceLedger;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Resource Ledger Entries";
                    RunPageLink = "Resource No."=field("No.");
                    RunPageView = sorting("Resource No.")
                                  order(descending);
                    ShortCutKey = 'Ctrl+F7';
                    ToolTip = 'View the history of transactions that have been posted for the selected record.';
                }
            }
        }
        area(reporting)
        {
            action(ResourceStatistics)
            {
                ApplicationArea = Jobs;
                Caption = 'Resource Statistics';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Resource Statistics";
                ToolTip = 'View detailed, historical information for the resource.';
            }
            action(ResourceUsage)
            {
                ApplicationArea = Jobs;
                Caption = 'Resource Usage';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Resource Usage";
                ToolTip = 'View the resource utilization that has taken place. The report includes the resource capacity, quantity of usage, and the remaining balance.';
            }
            action(ResourceCostBreakdown)
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
        area(processing)
        {
            group(Functions)
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(CreateTimeSheets)
                {
                    ApplicationArea = Jobs;
                    Caption = 'Create Time Sheets';
                    Ellipsis = true;
                    Image = NewTimesheet;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Create new time sheets for the resource.';

                    trigger OnAction()
                    begin
                        Rec.CreateTimeSheets;
                    end;
                }
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
        Rec."Resource Type":=Rec."resource type"::" ";
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
