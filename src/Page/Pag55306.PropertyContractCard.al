#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 55306 "Property Contract Card"
{
    Caption = 'Service Contract';
    PageType = Document;
    RefreshOnActivate = true;
    SourceTable = "Service Contract Header";
    SourceTableView = where("Contract Type" = filter(Contract));

    layout
    {
        area(content)
        {
            group(Control1)
            {
                Caption = 'General';
                field("Contract No."; Rec."Contract No.")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the number of the service contract or service contract quote.';

                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update;
                    end;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies a description of the service contract.';
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Tenant No.';
                    Importance = Promoted;
                    ToolTip = 'Specifies the number of the customer who owns the service items in the service contract/contract quote.';

                    trigger OnValidate()
                    begin
                        CustomerNoOnAfterValidate;
                    end;
                }
                field("Contact No."; Rec."Contact No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the number of the contact who will receive the service delivery.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    ToolTip = 'Specifies the name of the customer in the service contract.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    ToolTip = 'Specifies the customer''s address.';
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    ToolTip = 'Specifies an additional address line for the customer.';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    ToolTip = 'Specifies the postal code of the address.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    ToolTip = 'Specifies the name of the city in where the customer is located.';
                }
                field("Contact Name"; Rec."Contact Name")
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    ToolTip = 'Specifies the name of the person you regularly contact when you do business with the customer in this service contract.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the customer phone number.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the customer''s email address.';
                }
                field("Property Code"; Rec."Property Code")
                {
                    ApplicationArea = Basic;
                }
                field("Service Period"; Rec."Service Period")
                {
                    ApplicationArea = Basic;
                }
                field("Contract Group Code"; Rec."Contract Group Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the contract group code assigned to the service contract.';
                }
                field("Salesperson Code"; Rec."Salesperson Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the code of the salesperson assigned to this service contract.';
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Commencement Date';
                    Importance = Promoted;
                    ToolTip = 'Specifies the starting date of the service contract.';

                    trigger OnValidate()
                    begin
                        StartingDateOnAfterValidate;
                    end;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the status of the service contract or contract quote.';

                    // trigger OnValidate()
                    // begin
                    //     ActivateFields;
                    //     StatusOnAfterValidate;
                    // end;
                }
                field("Responsibility Center"; Rec."Responsibility Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the code of the responsibility center associated either with the customer in the service contract or with your company.';
                }
                field("Change Status"; Rec."Change Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies if a service contract or contract quote is locked or open for changes.';
                }
            }
            part(ServContractLines; "Service Contract Subform")
            {
                SubPageLink = "Contract No." = field("Contract No.");
                ApplicationArea = Basic;
            }
            group(Invoicing)
            {
                Caption = 'Invoicing';
                field("Bill-to Customer No."; Rec."Bill-to Customer No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Bill-to Tenant No.';
                    Importance = Promoted;
                    ToolTip = 'Specifies the number of the customer to whom you will send the invoice.';

                    trigger OnValidate()
                    begin
                        BilltoCustomerNoOnAfterValidat;
                    end;
                }
                field("Bill-to Contact No."; Rec."Bill-to Contact No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the number of the contact who receives the invoice.';
                }
                field("Bill-to Name"; Rec."Bill-to Name")
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    ToolTip = 'Specifies the name of the customer you will send the invoice to.';
                }
                field("Bill-to Address"; Rec."Bill-to Address")
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    ToolTip = 'Specifies the customer address.';
                }
                field("Bill-to Address 2"; Rec."Bill-to Address 2")
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    ToolTip = 'Specifies an additional line of the address.';
                }
                field("Bill-to Post Code"; Rec."Bill-to Post Code")
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    ToolTip = 'Specifies the postal code of the address.';
                }
                field("Bill-to City"; Rec."Bill-to City")
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    ToolTip = 'Specifies the city of the address.';
                }
                field("Bill-to Contact"; Rec."Bill-to Contact")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the name of your customer contact person, who you send the invoice to.';
                }
                field("Your Reference"; Rec."Your Reference")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the customer''s reference number.';
                }
                field("Serv. Contract Acc. Gr. Code"; Rec."Serv. Contract Acc. Gr. Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the code associated with the service contract account group.';
                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies a dimension value code for the document line.';
                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies a dimension value code for the document line.';
                }
                field("Payment Terms Code"; Rec."Payment Terms Code")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the payment terms code for the customer in the contract.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the currency used to calculate the amounts in the documents related to this contract.';
                }
            }
            group(Shipping)
            {
                Caption = 'Shipping';
                field("Ship-to Code"; Rec."Ship-to Code")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the ship-to code for the customer.';

                    trigger OnValidate()
                    begin
                        ShiptoCodeOnAfterValidate;
                    end;
                }
                field("Ship-to Name"; Rec."Ship-to Name")
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    ToolTip = 'Specifies the customer name.';
                }
                field("Ship-to Address"; Rec."Ship-to Address")
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    ToolTip = 'Specifies the customer address.';
                }
                field("Ship-to Address 2"; Rec."Ship-to Address 2")
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    ToolTip = 'Specifies an additional line of the address.';
                }
                field("Ship-to Post Code"; Rec."Ship-to Post Code")
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the postal code of the address.';
                }
                field("Ship-to City"; Rec."Ship-to City")
                {
                    ApplicationArea = Basic;
                    DrillDown = false;
                    ToolTip = 'Specifies the city of the address.';
                }
            }
            group(Service)
            {
                Caption = 'Service';
                field("Service Zone Code"; Rec."Service Zone Code")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the code of the service zone of the customer ship-to address.';
                }
                label(Control186)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies a default service period for the items in the contract.';

                    //   trigger OnValidate()
                    //     begin
                    //         ServicePeriodOnAfterValidate;
                    //     end;
                }
                // "field"("First Service Date";"First Service Date")
                // {
                //     ApplicationArea = Basic;
                //     Editable = FirstServiceDateEditable;
                //     Importance = Promoted;
                //     ToolTip = 'Specifies the date of the first expected service for the service items in the contract.';

                //     trigger OnValidate()
                //     begin
                //         FirstServiceDateOnAfterValidat;
                //     end;
                // }
                field("Response Time (Hours)"; Rec."Response Time (Hours)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the response time for the service contract.';

                    trigger OnValidate()
                    begin
                        ResponseTimeHoursOnAfterValida;
                    end;
                }
                field("Service Order Type"; Rec."Service Order Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the service order type assigned to service orders linked to this contract.';
                }
            }
            group("Invoice Details")
            {
                Caption = 'Invoice Details';
                field("Annual Amount"; Rec."Annual Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the amount that will be invoiced annually for the service contract or contract quote.';

                    trigger OnValidate()
                    begin
                        AnnualAmountOnAfterValidate;
                    end;
                }
                field("Allow Unbalanced Amounts"; Rec."Allow Unbalanced Amounts")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies if the contents of the Calcd. Annual Amount field are copied into the Annual Amount field in the service contract or contract quote.';

                    trigger OnValidate()
                    begin
                        AllowUnbalancedAmountsOnAfterV;
                    end;
                }
                field("Calcd. Annual Amount"; Rec."Calcd. Annual Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the sum of the Line Amount field values on all contract lines associated with the service contract or contract quote.';
                }
                field(InvoicePeriod; Rec."Invoice Period")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the invoice period for the service contract.';
                }
                field(NextInvoiceDate; Rec."Next Invoice Date")
                {
                    ApplicationArea = Basic;
                    Importance = Promoted;
                    ToolTip = 'Specifies the date of the next invoice for this service contract.';
                }
                field(AmountPerPeriod; Rec."Amount per Period")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    ToolTip = 'Specifies the amount that will be invoiced for each invoice period for the service contract.';
                }
                field(NextInvoicePeriod; Rec.NextInvoicePeriod)
                {
                    ApplicationArea = Basic;
                    Caption = 'Next Invoice Period';
                }
                field("Last Invoice Date"; Rec."Last Invoice Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the date when this service contract was last invoiced.';
                }
                field(Prepaid; Rec.Prepaid)
                {
                    ApplicationArea = Basic;
                    // Enabled = PrepaidEnable;
                    ToolTip = 'Specifies that this service contract is prepaid.';

                    // trigger OnValidate()
                    // begin
                    //     PrepaidOnAfterValidate;
                    // end;
                }
                field("Automatic Credit Memos"; Rec."Automatic Credit Memos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies that a credit memo is created when you remove a contract line.';
                }
                field("Invoice after Service"; Rec."Invoice after Service")
                {
                    ApplicationArea = Basic;
                    //Enabled = InvoiceAfterServiceEnable;
                    ToolTip = 'Specifies that you can only invoice the contract if you have posted a service order since last time you invoiced the contract.';

                    // trigger OnValidate()
                    // begin
                    //     InvoiceafterServiceOnAfterVali;
                    // end;
                }
                field("Combine Invoices"; Rec."Combine Invoices")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies you want to combine invoices for this service contract with invoices for other service contracts with the same bill-to customer.';
                }
                field("Contract Lines on Invoice"; Rec."Contract Lines on Invoice")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies that you want the lines for this contract to appear as text on the invoice.';
                }
                field("No. of Unposted Invoices"; Rec."No. of Unposted Invoices")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the number of unposted service invoices linked to the service contract.';
                }
                field("No. of Unposted Credit Memos"; Rec."No. of Unposted Credit Memos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the number of unposted credit memos linked to the service contract.';
                }
                field("No. of Posted Invoices"; Rec."No. of Posted Invoices")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the number of posted service invoices linked to the service contract.';
                }
                field("No. of Posted Credit Memos"; Rec."No. of Posted Credit Memos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the number of posted credit memos linked to this service contract.';
                }
            }
            group("Price Update")
            {
                Caption = 'Price Update';
                field("Price Update Period"; Rec."Price Update Period")
                {
                    ApplicationArea = Basic;
                    Caption = 'Rent Escalation Period';
                    Importance = Promoted;
                    ToolTip = 'Specifies the price update period for this service contract.';
                }
                field("Next Price Update Date"; Rec."Next Price Update Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Next Rent Escalation Date';
                    Importance = Promoted;
                    ToolTip = 'Specifies the next date you want contract prices to be updated.';
                }
                field("Last Price Update %"; Rec."Last Price Update %")
                {
                    ApplicationArea = Basic;
                    Caption = 'Last Rent Escalation Price Update %';
                    ToolTip = 'Specifies the price update percentage you used the last time you updated the contract prices.';
                }
                field("Last Price Update Date"; Rec."Last Price Update Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'Last Price Rent Escalation Date';
                    ToolTip = 'Specifies the date you last updated the contract prices.';
                }
                field("Print Increase Text"; Rec."Print Increase Text")
                {
                    ApplicationArea = Basic;
                    Caption = 'Print Rent Escalation Text';
                    ToolTip = 'Specifies the standard text code printed on service invoices, informing the customer which prices have been updated since the last invoice.';
                }
                field("Price Inv. Increase Code"; Rec."Price Inv. Increase Code")
                {
                    ApplicationArea = Basic;
                    Caption = 'Rent Inv.  Escalation Code';
                    ToolTip = 'Specifies the standard text code printed on service invoices, informing the customer which prices have been updated since the last invoice.';
                }
            }
            group(Details)
            {
                Caption = 'Details';
                field("Expiration Date"; Rec."Expiration Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the date when the service contract expires.';

                    trigger OnValidate()
                    begin
                        ExpirationDateOnAfterValidate;
                    end;
                }
                field("Cancel Reason Code"; Rec."Cancel Reason Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies a reason code for canceling the service contract.';
                }
                field("Max. Labor Unit Price"; Rec."Max. Labor Unit Price")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the maximum unit price that can be set for a resource on all service orders and lines for the service contract.';
                }
            }
        }
        area(factboxes)
        {
            part(Control1902018507; "Customer Statistics FactBox")
            {
                SubPageLink = "No." = FIELD("Bill-to Customer No.");
                Visible = true;
            }
            part(Control1900316107; "Customer Details FactBox")
            {
                SubPageLink = "No." = FIELD("Customer No.");
                Visible = true;
            }
            systempart(Control1900383207; Links)
            {
                Visible = false;
            }
            systempart(Control1905767507; Notes)
            {
                Visible = true;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(Overview)
            {
                Caption = 'Overview';
            }
        }
    }
    // group("Ser&vice Overview")
    // {
    //     Caption = 'Ser&vice Overview';
    //     Image = Tools;
    //                     action("Service Orders")
    //                     {
    //                         ApplicationArea = Basic;
    //                         Caption = 'Service Orders';
    //                         Image = Document;
    //                         RunObject = Page "Service List";
    //                                         RunPageLink = "Document Type"=CONST(Order),
    //                                       "Contract No."=                            PAGEPAGEPage "Service Document Registers";
    //                                         RunPageLink = "Source Document No."=Page "Contract/Service Discounts";
    //                                         RunPageLink = "Contract Type"=Page "Service Hours";
    //                                         RunPageLink = "Service Contract No."=Page "Contract Statistics";
    //                                         RunPageLink = "Contract Type"=CONST(Contract),
    //                                       "Contract No."=Page "Contract Trendscape";
    //                                         RunPageLink = "Contract Type"=CONST(Contract),
    //                                       "Contract No."=Page "Filed Service Contract List";
    //                                         RunPageLink = "Contract Type Relation"=Page "Service Comment Sheet";
    //                                         RunPageLink = "Table Name"=CONST("Service Contract"),
    //                                   "Table Subtype"=Page "Contract Gain/Loss Entries";
    //                                         RunPageLink = "Contract No."=Page "Contract Change Log";
    //                                         RunPageLink = "Contract No."=Page "Warranty Ledger Entries";
    //                                         RunPageLink = "Service Contract No."=Page "Service Ledger Entries";
    //                                         RunPageLink = "Service Contract No."=Codeunit "Document-Print"Codeunit "Lock-OpenServContract"Codeunit "Lock-OpenServContract"                        REPORTREPORTCodeunit SignServContractDocReport "Service Contract-Detail";
    //                                         ToolTip = 'Specifies billable prices for the job task that are related to items.';
    // Report "Contract Gain/Loss Entries";
    //     ToolTip = 'Specifies billable prices for the job task that are related to G/L accounts, expressed in the local currency.';
    // Report "Contract Invoicing";
    //     ToolTip = 'Specifies all billable profits for the job task.';
    // Report "Contract Price Update - Test";
    // Report "Prepaid Contr. Entries - Test";
    // Report "Expired Contract Lines - Test";
    // Report "Change Customer in Contract";
    //     CopyServDoc;
    //     ServContractMgt;
    //     UserMgt;
    //     Text015Page ""Contract ;
    //     ""
    // ;
    //     ContractLineSelection;
    //     ContractLineSelection;
    //     CurrPage;

    local procedure StartingDateOnAfterValidate()
    begin
        CurrPage.Update;
    end;

    local procedure StatusOnAfterValidate()
    begin
        CurrPage.Update;
    end;

    local procedure CustomerNoOnAfterValidate()
    begin
        CurrPage.Update;
    end;

    local procedure BilltoCustomerNoOnAfterValidat()
    begin
        CurrPage.Update;
    end;

    local procedure ShiptoCodeOnAfterValidate()
    begin
        CurrPage.Update;
    end;

    local procedure ResponseTimeHoursOnAfterValida()
    begin
        CurrPage.Update(true);
    end;

    local procedure ServicePeriodOnAfterValidate()
    begin
        CurrPage.Update;
    end;

    local procedure AnnualAmountOnAfterValidate()
    begin
        CurrPage.Update;
    end;

    // local procedure InvoiceafterServiceOnAfterVali()
    // begin
    //     ActivateFields;
    // end;

    local procedure AllowUnbalancedAmountsOnAfterV()
    begin
        CurrPage.Update;
    end;

    // local procedure PrepaidOnAfterValidate()
    // begin
    //   //  ActivateFields;
    // end;

    local procedure ExpirationDateOnAfterValidate()
    begin
        CurrPage.Update;
    end;

    local procedure FirstServiceDateOnAfterValidat()
    begin
        CurrPage.Update;
    end;

}

#pragma implicitwith restore

