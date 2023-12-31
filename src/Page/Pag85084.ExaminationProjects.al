#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85084 "Examination Projects"
{
    AdditionalSearchTerms = 'projects';
    ApplicationArea = Jobs;
    Caption = 'Examination Projects';
    CardPageID = "Examination Project";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    PromotedActionCategories = 'New,Process,Report,Navigate,Job';
    SourceTable = Job;
    SourceTableView = where("Record Type" = filter(Examination));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies a short description of the job.';
                }
                field("Bill-to Customer No."; Rec."Bill-to Customer No.")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the number of the customer who pays for the job.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies a status for the current job. You can change the status for the job as it progresses. Final calculations can be made on completed jobs.';
                }
                field("Person Responsible"; Rec."Person Responsible")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the name of the person responsible for the job. You can select a name from the list of resources available in the Resource List window. The name is copied from the No. field in the Resource table. You can choose the field to see a list of resources.';
                    Visible = false;
                }
                field("Next Invoice Date"; Rec."Next Invoice Date")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the next invoice date for the job.';
                    Visible = false;
                }
                field("Job Posting Group"; Rec."Job Posting Group")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies a job posting group code for a job. To see the available codes, choose the field.';
                    Visible = false;
                }
                field("Search Description"; Rec."Search Description")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the additional name for the job. The field is used for searching purposes.';
                }
                field("% of Overdue Planning Lines"; Rec.PercentOverdue)
                {
                    ApplicationArea = Jobs;
                    Caption = '% of Overdue Planning Lines';
                    Editable = false;
                    ToolTip = 'Specifies the percent of planning lines that are overdue for this job.';
                    Visible = false;
                }
                field("% Completed"; Rec.PercentCompleted)
                {
                    ApplicationArea = Jobs;
                    Caption = '% Completed';
                    Editable = false;
                    ToolTip = 'Specifies the completion percentage for this job.';
                    Visible = false;
                }
                field("% Invoiced"; Rec.PercentInvoiced)
                {
                    ApplicationArea = Jobs;
                    Caption = '% Invoiced';
                    Editable = false;
                    ToolTip = 'Specifies the invoiced percentage for this job.';
                    Visible = false;
                }
                field("Project Budget"; Rec."Project Budget")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Project Budget field.';
                }
                field("Actual Project Costs"; Rec."Actual Project Costs")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Actual Project Costs field.';
                }
                field(Commitments; Rec.Commitments)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Commitments field.';
                }
                field("WIP Method"; Rec."WIP Method")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the method that is used to calculate the value of work in process for the job.';
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the date on which the job actually starts.';
                }
                field("Ending Date"; Rec."Ending Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the date on which the job is expected to be completed.';
                }
                field("Project Manager"; Rec."Project Manager")
                {
                    ApplicationArea = Jobs;
                    ToolTip = 'Specifies the person assigned as the manager for this job.';
                    Visible = false;
                }
            }
        }
        area(factboxes)
        {
            part(Control1907234507; "Sales Hist. Bill-to FactBox")
            {
                ApplicationArea = Jobs;
                SubPageLink = "No." = field("Bill-to Customer No.");
                Visible = false;
            }
            part(Control1902018507; "Customer Statistics FactBox")
            {
                ApplicationArea = Jobs;
                SubPageLink = "No." = field("Bill-to Customer No.");
                Visible = false;
            }
            part(Control1905650007; "Job WIP/Recognition FactBox")
            {
                ApplicationArea = Jobs;
                SubPageLink = "No." = field("No.");
            }
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                ApplicationArea = Notes;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Job")
            {
                Caption = '&Job';
                Image = Job;
                action("Job Task &Lines")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Job Task &Lines';
                    Image = TaskList;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Job Task Lines";
                    RunPageLink = "Job No." = field("No.");
                    ShortCutKey = 'Shift+Ctrl+T';
                    ToolTip = 'Plan how you want to set up your planning information. In this window you can specify the tasks involved in a job. To start planning a job or to post usage for a job, you must set up at least one job task.';
                }
                group("&Dimensions")
                {
                    Caption = '&Dimensions';
                    Image = Dimensions;
                    action("Dimensions-&Single")
                    {
                        ApplicationArea = Dimensions;
                        Caption = 'Dimensions-&Single';
                        Image = Dimensions;
                        Promoted = true;
                        PromotedCategory = Category5;
                        RunObject = Page "Default Dimensions";
                        RunPageLink = "Table ID" = const(167),
                                      "No." = field("No.");
                        ShortCutKey = 'Shift+Ctrl+D';
                        ToolTip = 'View or edit the single set of dimensions that are set up for the selected record.';
                    }
                    action("Dimensions-&Multiple")
                    {
                        AccessByPermission = TableData Dimension = R;
                        ApplicationArea = Dimensions;
                        Caption = 'Dimensions-&Multiple';
                        Image = DimensionSets;
                        Promoted = true;
                        PromotedCategory = Category5;
                        ToolTip = 'View or edit dimensions for a group of records. You can assign dimension codes to transactions to distribute costs and analyze historical information.';

                        trigger OnAction()
                        var
                            Job: Record Job;
                            DefaultDimensionsMultiple: Page "Default Dimensions-Multiple";
                        begin
                            CurrPage.SetSelectionFilter(Job);
                            DefaultDimensionsMultiple.SetMultiRecord(Job, Rec.FieldNo("No."));
                            DefaultDimensionsMultiple.RunModal;
                        end;
                    }
                }
                action("&Statistics")
                {
                    ApplicationArea = Jobs;
                    Caption = '&Statistics';
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    RunObject = Page "Job Statistics";
                    RunPageLink = "No." = field("No.");
                    ShortCutKey = 'F7';
                    ToolTip = 'View this job''s statistics.';
                }
                action(SalesInvoicesCreditMemos)
                {
                    ApplicationArea = Jobs;
                    Caption = 'Sales &Invoices/Credit Memos';
                    Image = GetSourceDoc;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'View sales invoices or sales credit memos that are related to the selected job.';

                    trigger OnAction()
                    var
                        JobInvoices: Page "Job Invoices";
                    begin
                        JobInvoices.SetPrJob(Rec);
                        JobInvoices.RunModal;
                    end;
                }
                action("Co&mments")
                {
                    ApplicationArea = Comments;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    Promoted = true;
                    PromotedCategory = Category5;
                    RunObject = Page "Comment Sheet";
                    RunPageLink = "Table Name" = const(Job),
                                  "No." = field("No.");
                    ToolTip = 'View or add comments for the record.';
                }
            }
            group("W&IP")
            {
                Caption = 'W&IP';
                Image = WIP;
                action("&WIP Entries")
                {
                    ApplicationArea = Jobs;
                    Caption = '&WIP Entries';
                    Image = WIPEntries;
                    RunObject = Page "Job WIP Entries";
                    RunPageLink = "Job No." = field("No.");
                    RunPageView = sorting("Job No.", "Job Posting Group", "WIP Posting Date")
                                  order(descending);
                    ToolTip = 'View entries for the job that are posted as work in process.';
                }
                action("WIP &G/L Entries")
                {
                    ApplicationArea = Jobs;
                    Caption = 'WIP &G/L Entries';
                    Image = WIPLedger;
                    RunObject = Page "Job WIP G/L Entries";
                    RunPageLink = "Job No." = field("No.");
                    RunPageView = sorting("Job No.")
                                  order(descending);
                    ToolTip = 'View the job''s WIP G/L entries.';
                }
            }
            group("&Prices")
            {
                Caption = '&Prices';
                Image = Price;
                action("&Resource")
                {
                    ApplicationArea = Jobs;
                    Caption = '&Resource';
                    Image = Resource;
                    RunObject = Page "Job Resource Prices";
                    RunPageLink = "Job No." = field("No.");
                    ToolTip = 'View this job''s resource prices.';
                }
                action("&Item")
                {
                    ApplicationArea = Jobs;
                    Caption = '&Item';
                    Image = Item;
                    RunObject = Page "Job Item Prices";
                    RunPageLink = "Job No." = field("No.");
                    ToolTip = 'View this job''s item prices.';
                }
                action("&G/L Account")
                {
                    ApplicationArea = Jobs;
                    Caption = '&G/L Account';
                    Image = JobPrice;
                    RunObject = Page "Job G/L Account Prices";
                    RunPageLink = "Job No." = field("No.");
                    ToolTip = 'View this job''s G/L account prices.';
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
                    ToolTip = 'View this job''s resource allocation.';
                }
                action("Res. Group All&ocated per Job")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Res. Group All&ocated per Job';
                    Image = ViewJob;
                    RunObject = Page "Res. Gr. Allocated per Job";
                    ToolTip = 'View the job''s resource group allocation.';
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
                    Image = CustomerLedger;
                    Promoted = true;
                    PromotedCategory = Category5;
                    PromotedIsBig = true;
                    RunObject = Page "Job Ledger Entries";
                    RunPageLink = "Job No." = field("No.");
                    RunPageView = sorting("Job No.", "Job Task No.", "Entry Type", "Posting Date")
                                  order(descending);
                    ShortCutKey = 'Ctrl+F7';
                    ToolTip = 'View the history of transactions that have been posted for the selected record.';
                }
            }
        }
        area(processing)
        {
            group("<Action9>")
            {
                Caption = 'F&unctions';
                Image = "Action";
                action(CopyJob)
                {
                    ApplicationArea = Jobs;
                    Caption = '&Copy Job';
                    Ellipsis = true;
                    Image = CopyFromTask;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ToolTip = 'Copy a job and its job tasks, planning lines, and prices.';

                    trigger OnAction()
                    var
                        CopyJob: Page "Copy Job";
                    begin
                        CopyJob.SetFromJob(Rec);
                        CopyJob.RunModal;
                    end;
                }
                action("Create Job &Sales Invoice")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Create Job &Sales Invoice';
                    Image = JobSalesInvoice;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Report "Job Create Sales Invoice";
                    ToolTip = 'Use a batch job to help you create job sales invoices for the involved job planning lines.';
                }
                group(ActionGroup7)
                {
                    Caption = 'W&IP';
                    Image = WIP;
                    action("<Action151>")
                    {
                        ApplicationArea = Jobs;
                        Caption = '&Calculate WIP';
                        Ellipsis = true;
                        Image = CalculateWIP;
                        //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                        //PromotedCategory = Process;
                        ToolTip = 'Run the Job Calculate WIP batch job.';

                        trigger OnAction()
                        var
                            Job: Record Job;
                        begin
                            Rec.TestField("No.");
                            Job.Copy(Rec);
                            Job.SetRange("No.", Rec."No.");
                            Report.RunModal(Report::"Job Calculate WIP", true, false, Job);
                        end;
                    }
                    action("<Action152>")
                    {
                        ApplicationArea = Jobs;
                        Caption = '&Post WIP to G/L';
                        Ellipsis = true;
                        Image = PostOrder;
                        //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                        //PromotedCategory = Process;
                        ToolTip = 'Run the Job Post WIP to G/L batch job.';

                        trigger OnAction()
                        var
                            Job: Record Job;
                        begin
                            Rec.TestField("No.");
                            Job.Copy(Rec);
                            Job.SetRange("No.", Rec."No.");
                            Report.RunModal(Report::"Job Post WIP to G/L", true, false, Job);
                        end;
                    }
                }
            }
        }
        area(reporting)
        {
            action("Job Actual to Budget")
            {
                ApplicationArea = Jobs;
                Caption = 'Job Actual to Budget';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Job Actual To Budget";
                ToolTip = 'Compare budgeted and usage amounts for selected jobs. All lines of the selected job show quantity, total cost, and line amount.';
            }
            action("Job Analysis")
            {
                ApplicationArea = Jobs;
                Caption = 'Job Analysis';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Job Analysis";
                ToolTip = 'Analyze the job, such as the budgeted prices, usage prices, and contract prices, and then compares the three sets of prices.';
            }
            action("Job - Planning Lines")
            {
                ApplicationArea = Jobs;
                Caption = 'Job - Planning Lines';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Job - Planning Lines";
                ToolTip = 'View all planning lines for the job. You use this window to plan what items, resources, and general ledger expenses that you expect to use on a job (budget) or you can specify what you actually agreed with your customer that he should pay for the job (billable).';
            }
            action("Job - Suggested Billing")
            {
                ApplicationArea = Jobs;
                Caption = 'Job - Suggested Billing';
                Image = "Report";
                Promoted = true;
                PromotedCategory = "Report";
                RunObject = Report "Job Suggested Billing";
                ToolTip = 'View a list of all jobs, grouped by customer, how much the customer has already been invoiced, and how much remains to be invoiced, that is, the suggested billing.';
            }
            action("Jobs per Customer")
            {
                ApplicationArea = Jobs;
                Caption = 'Jobs per Customer';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Jobs per Customer";
                ToolTip = 'Run the Jobs per Customer report.';
            }
            action("Items per Job")
            {
                ApplicationArea = Jobs;
                Caption = 'Items per Job';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Items per Job";
                ToolTip = 'View which items are used for a specific job.';
            }
            action("Jobs per Item")
            {
                ApplicationArea = Jobs;
                Caption = 'Jobs per Item';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Jobs per Item";
                ToolTip = 'Run the Jobs per item report.';
            }
            action("Report Job Quote")
            {
                ApplicationArea = Jobs;
                Caption = 'Preview Job Quote';
                Image = "Report";
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                ToolTip = 'Open the Job Quote report.';

                trigger OnAction()
                var
                    Job: Record Job;
                begin
                    Job.SetCurrentkey("No.");
                    Job.SetFilter("No.", Rec."No.");
                    Report.Run(Report::"Job Quote", true, false, Job);
                end;
            }
            action("Send Job Quote")
            {
                ApplicationArea = Jobs;
                Caption = 'Send Job Quote';
                Image = SendTo;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                ToolTip = 'Send the job quote to the customer. You can change the way that the document is sent in the window that appears.';

                trigger OnAction()
                begin
                    Codeunit.Run(Codeunit::"Jobs-Send", Rec);
                end;
            }
            group("Financial Management")
            {
                Caption = 'Financial Management';
                Image = "Report";
                action("Job WIP to G/L")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Job WIP to G/L';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = Report "Job WIP To G/L";
                    ToolTip = 'View the value of work in process on the jobs that you select compared to the amount that has been posted in the general ledger.';
                }
            }
            group(ActionGroup23)
            {
                Caption = 'History';
                Image = "Report";
                action("Jobs - Transaction Detail")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Jobs - Transaction Detail';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = Report "Job - Transaction Detail";
                    ToolTip = 'View all postings with entries for a selected job for a selected period, which have been charged to a certain job. At the end of each job list, the amounts are totaled separately for the Sales and Usage entry types.';
                }
                action("Job Register")
                {
                    ApplicationArea = Jobs;
                    Caption = 'Job Register';
                    Image = "Report";
                    Promoted = false;
                    //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                    //PromotedCategory = "Report";
                    RunObject = Report "Job Register";
                    ToolTip = 'View one or more selected job registers. By using a filter, you can select only those register entries that you want to see. If you do not set a filter, the report can be impractical because it can contain a large amount of information. On the job journal template, you can indicate that you want the report to print when you post.';
                }
            }
        }
    }
}

#pragma implicitwith restore

