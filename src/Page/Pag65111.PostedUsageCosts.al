#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 65111 "Posted Usage Costs"
{
    ApplicationArea = Jobs;
    Caption = 'Posted Usage Costs';
    DataCaptionFields = "Job No.";
    Editable = false;
    PageType = List;
    PromotedActionCategories = 'New,Process,Report,Entry';
    SourceTable = "Job Ledger Entry";
    SourceTableView = sorting("Job No.","Posting Date")
                      order(descending)
                      where("Entry Type"=const(Usage));
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Jobs;
                    Editable = false;
                    ToolTip = 'Specifies the posting date for the entry.';
                }
                field("Entry Type"; Rec."Entry Type")
                {
                    ApplicationArea = Jobs;
                    Editable = false;
                    ToolTip = 'Specifies the type of the entry. There are two types of entries:';
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Jobs;
                    Editable = false;
                    ToolTip = 'Specifies the document number on the job ledger entry.';
                }
                field("Job No."; Rec."Job No.")
                {
                    ApplicationArea = Jobs;
                    Editable = false;
                    ToolTip = 'Specifies the number of the job.';
                }
                field("Job Task No."; Rec."Job Task No.")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the number of the related job task.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the type of account to which the job ledger entry is posted.';
                }
                field("No."; Rec."No.")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Jobs;
                    Editable = false;
                    ToolTip = 'Specifies the description of the job ledger entry.';
                }
                field("Gen. Bus. Posting Group"; Rec."Gen. Bus. Posting Group")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the vendor''s or customer''s trade type to link transactions made for this business partner with the appropriate general ledger account according to the general posting setup.';
                    Visible = false;
                }
                field("Gen. Prod. Posting Group"; Rec."Gen. Prod. Posting Group")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the item''s product type to link transactions made for this item with the appropriate general ledger account according to the general posting setup.';
                    Visible = false;
                }
                field("Job Posting Group"; Rec."Job Posting Group")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the code for the Job posting group that was used when the entry was posted.';
                    Visible = false;
                }
                field("Variant Code"; Rec."Variant Code")
                {
                    ApplicationArea = Planning;
                    ToolTip = 'Specifies the variant of the item on the line.';
                    Visible = false;
                }
                field("Location Code"; Rec."Location Code")
                {
                    ApplicationArea = Location;
                    Editable = false;
                    ToolTip = 'Specifies the relevant location code if an item is posted.';
                }
                field("Work Type Code"; Rec."Work Type Code")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies which work type the resource applies to. Prices are updated based on this entry.';
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies how each unit of the item or resource is measured, such as in pieces or hours. By default, the value in the Base Unit of Measure field on the item or resource card is inserted.';
                }
                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the quantity that was posted on the entry.';
                }
                field("Direct Unit Cost (LCY)"; Rec."Direct Unit Cost (LCY)")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the cost, in the local currency, of one unit of the selected item or resource.';
                    Visible = false;
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = Jobs;
                    Editable = false;
                    ToolTip = 'Specifies the cost of one unit of the item or resource on the line.';
                }
                field("Unit Cost (LCY)"; Rec."Unit Cost (LCY)")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the cost, in LCY, of one unit of the item or resource on the line.';
                }
                field("Total Cost"; Rec."Total Cost")
                {
                    ApplicationArea = Jobs;
                    Editable = false;
                    ToolTip = 'Specifies the total cost for the posted entry, in the currency specified for the job.';
                }
                field("Total Cost (LCY)"; Rec."Total Cost (LCY)")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the total cost of the posted entry in local currency. If you update the job ledger costs for item ledger cost adjustments, this field will be adjusted to include the item cost adjustments.';
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the price of one unit of the item or resource. You can enter a price manually or have it entered according to the Price/Profit Calculation field on the related card.';
                }
                field("Unit Price (LCY)"; Rec."Unit Price (LCY)")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the price, in LCY, of one unit of the item or resource. You can enter a price manually or have it entered according to the Price/Profit Calculation field on the related card.';
                    Visible = false;
                }
                field("Line Amount"; Rec."Line Amount")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the value of products on the entry.';
                }
                field("Line Discount Amount"; Rec."Line Discount Amount")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the line discount amount for the posted entry, in the currency specified for the job.';
                }
                field("Line Discount %"; Rec."Line Discount %")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the line discount percent of the posted entry.';
                }
                field("Total Price"; Rec."Total Price")
                {
                    ApplicationArea = Jobs;
                    Editable = false;
                    ToolTip = 'Specifies the total price for the posted entry, in the currency specified for the job.';
                    Visible = false;
                }
                field("Total Price (LCY)"; Rec."Total Price (LCY)")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the total price (in local currency) of the posted entry.';
                    Visible = false;
                }
                field("Line Amount (LCY)"; Rec."Line Amount (LCY)")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the value in the local currency of products on the entry.';
                    Visible = false;
                }
                field("Amt. to Post to G/L"; Rec."Amt. to Post to G/L")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the amount that will be posted to the general ledger.';
                    Visible = false;
                }
                field("Amt. Posted to G/L"; Rec."Amt. Posted to G/L")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the amount that has been posted to the general ledger.';
                    Visible = false;
                }
                field("Original Unit Cost"; Rec."Original Unit Cost")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the unit cost for the posted entry at the time of posting, in the currency specified for the job. No item cost adjustments are included.';
                    Visible = false;
                }
                field("Original Unit Cost (LCY)"; Rec."Original Unit Cost (LCY)")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the unit cost of the posted entry in local currency at the time the entry was posted. It does not include any item cost adjustments.';
                    Visible = false;
                }
                field("Original Total Cost"; Rec."Original Total Cost")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the total cost for the posted entry at the time of posting, in the currency specified for the job. No item cost adjustments are included.';
                    Visible = false;
                }
                field("Original Total Cost (LCY)"; Rec."Original Total Cost (LCY)")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the total cost of the posted entry in local currency at the time the entry was posted. It does not include any item cost adjustments.';
                    Visible = false;
                }
                field("Original Total Cost (ACY)"; Rec."Original Total Cost (ACY)")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the total cost of the posted entry in the additional reporting currency at the time of posting. No item cost adjustments are included.';
                    Visible = false;
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Jobs;
                    Editable = false;
                    ToolTip = 'Specifies the ID of the user who posted the entry, to be used, for example, in the change log.';
                    Visible = false;
                }
                field("Source Code"; Rec."Source Code")
                {
                    ApplicationArea = Jobs;
                    Editable = false;
                    ToolTip = 'Specifies the source code that specifies where the entry was created.';
                    Visible = false;
                }
                field("Reason Code"; Rec."Reason Code")
                {
                    ApplicationArea = Jobs;
                    Editable = false;
                    ToolTip = 'Specifies the reason code, a supplementary source code that enables you to trace the entry.';
                    Visible = false;
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ApplicationArea = ItemTracking;
                    ToolTip = 'Specifies the serial number if the job ledger entry Specifies an item usage that was posted with serial number tracking.';
                    Visible = false;
                }
                field("Lot No."; Rec."Lot No.")
                {
                    ApplicationArea = ItemTracking;
                    Editable = false;
                    ToolTip = 'Specifies the lot number if the job ledger entry Specifies an item usage that was posted with lot number tracking.';
                    Visible = false;
                }
                field("Ledger Entry Type"; Rec."Ledger Entry Type")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the entry type that the job ledger entry is linked to.';
                }
                field("Ledger Entry No."; Rec."Ledger Entry No.")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the entry number (Resource, Item or G/L) to which the job ledger entry is linked.';
                }
                field("Entry No."; Rec."Entry No.")
                {
                    ApplicationArea = Jobs;
                    Editable = false;
                    ToolTip = 'Specifies the number of the entry, as assigned from the specified number series when the entry was created.';
                }
                field(Adjusted; Rec.Adjusted)
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies whether a job ledger entry has been modified or adjusted. The value in this field is inserted by the Adjust Cost - Item Entries batch job. The Adjusted check box is selected if applicable.';
                }
                field("DateTime Adjusted"; Rec."DateTime Adjusted")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the time stamp of a job ledger entry adjustment or modification.';
                }
                field("Dimension Set ID"; Rec."Dimension Set ID")
                {
                    ApplicationArea = Dimensions;
                    ToolTip = 'Specifies a reference to a combination of dimension values. The actual values are stored in the Dimension Set Entry table.';
                    Visible = false;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207;Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control1905767507;Notes)
            {
                ApplicationArea = Notes;
                Visible = false;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Ent&ry")
            {
                Caption = 'Ent&ry';
                Image = Entry;
                action(Dimensions)
                {
                    AccessByPermission = TableData Dimension=R;
                    ApplicationArea = Dimensions;
                    Caption = 'Dimensions';
                    Image = Dimensions;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to sales and purchase documents to distribute costs and analyze transaction history.';

                    trigger OnAction()
                    begin
                        xRec.ShowDimensions;
                    end;
                }
                action(SetDimensionFilter)
                {
                    ApplicationArea = Dimensions;
                    Caption = 'Set Dimension Filter';
                    Ellipsis = true;
                    Image = "Filter";
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Limit the entries according to the dimension filters that you specify. NOTE: If you use a high number of dimension combinations, this function may not work and can result in a message that the SQL server only supports a maximum of 2100 parameters.';

                    trigger OnAction()
                    begin
                        Rec.SetFilter("Dimension Set ID",DimensionSetIDFilter.LookupFilter);
                    end;
                }
                action("<Action28>")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Show Linked Job Planning Lines';
                    Image = JobLines;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'View the planning lines that are associated with job journal entries that have been posted to the job ledger. This requires that the Apply Usage Link check box has been selected for the job, or is the default setting for all jobs in your organization.';

                    trigger OnAction()
                    var
                        JobUsageLink: Record "Job Usage Link";
                        JobPlanningLine: Record "Job Planning Line";
                    begin
                        JobUsageLink.SetRange("Entry No.", Rec."Entry No.");

                        if JobUsageLink.FindSet then
                          repeat
                            JobPlanningLine.Get(JobUsageLink."Job No.",JobUsageLink."Job Task No.",JobUsageLink."Line No.");
                            JobPlanningLine.Mark := true;
                          until JobUsageLink.Next = 0;

                        JobPlanningLine.MarkedOnly(true);
                        Page.Run(Page::"Job Planning Lines",JobPlanningLine);
                    end;
                }
            }
        }
        area(processing)
        {
            group("F&unctions")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action("Transfer To Planning Lines")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Transfer To Planning Lines';
                    Ellipsis = true;
                    Image = TransferToLines;
                    Promoted = true;
                    PromotedCategory = Process;
                    ToolTip = 'Create planning lines from posted job ledger entries. This is useful if you forgot to specify the planning lines that should be created when you posted the job journal lines.';

                    trigger OnAction()
                    var
                        JobLedgEntry: Record "Job Ledger Entry";
                        JobTransferToPlanningLine: Report "Job Transfer To Planning Lines";
                    begin
                        JobLedgEntry.Copy(Rec);
                        CurrPage.SetSelectionFilter(JobLedgEntry);
                        Clear(JobTransferToPlanningLine);
                        JobTransferToPlanningLine.GetJobLedgEntry(JobLedgEntry);
                        JobTransferToPlanningLine.RunModal;
                        Clear(JobTransferToPlanningLine);
                    end;
                }
            }
            action("&Navigate")
            {
                ApplicationArea = Jobs;
                Caption = '&Navigate';
                Image = Navigate;
                Promoted = true;
                PromotedCategory = Category4;
                ToolTip = 'Find all entries and documents that exist for the document number and posting date on the selected entry or document.';

                trigger OnAction()
                begin
                    Navigate.SetDoc(Rec."Posting Date", Rec."Document No.");
                    Navigate.Run;
                end;
            }
        }
    }

    var
        Navigate: Page Navigate;
        DimensionSetIDFilter: Page "Dimension Set ID Filter";
}

#pragma implicitwith restore

