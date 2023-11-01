#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 55302 "Property Item Card"
{
    Caption = 'Property Item Card';
    PageType = Card;
    SourceTable = "Service Item";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("No."; Rec."No.")
                {
                    ApplicationArea = Service;
                    Importance = Promoted;
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';

                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update;
                    end;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = Service;
                    Caption = 'Tenant No';
                    Importance = Promoted;
                    ToolTip = 'Specifies the number of the customer who owns this item.';

                    trigger OnValidate()
                    begin
                        Rec.CalcFields(Name, "Name 2", Address, "Address 2", "Post Code",
                          City, Contact, "Phone No.", County, "Country/Region Code");
                        CustomerNoOnAfterValidate;
                    end;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Service;
                    DrillDown = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the name of the customer who owns this item.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Service;
                    Importance = Promoted;
                    ToolTip = 'Specifies a description of this item.';
                }
                field("Property Code"; Rec."Property Code")
                {
                    ApplicationArea = Basic;
                }
                field("Property Item Group Code"; Rec."Service Item Group Code")
                {
                    ApplicationArea = Service;
                    Caption = 'Property Item Group Code';
                    ToolTip = 'Specifies the code of the service item group associated with this item.';
                }
                field("Property Price Group Code"; Rec."Service Price Group Code")
                {
                    ApplicationArea = Service;
                    Caption = 'Property Price Group Code';
                    ToolTip = 'Specifies the code of the Service Price Group associated with this item.';
                }
                field("Location of Property Item"; Rec."Location of Service Item")
                {
                    ApplicationArea = Location;
                    Caption = 'Location of Property Item';
                    Importance = Promoted;
                    ToolTip = 'Specifies the code of the location of this item.';
                }
                field("Search Description"; Rec."Search Description")
                {
                    ApplicationArea = Service;
                    ToolTip = 'Specifies an alternate description to search for the service item.';
                }
            }
            group("Tenant Details")
            {
                Caption = 'Tenant Details';
                field(Address; Rec.Address)
                {
                    ApplicationArea = Service;
                    DrillDown = false;
                    ToolTip = 'Specifies the address of the customer who owns this item.';
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = Service;
                    DrillDown = false;
                    ToolTip = 'Specifies additional address information.';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Service;
                    DrillDown = false;
                    ToolTip = 'Specifies the postal code.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Service;
                    DrillDown = false;
                    ToolTip = 'Specifies the city of the customer address.';
                }
                field(Contact; Rec.Contact)
                {
                    ApplicationArea = Service;
                    DrillDown = false;
                    Importance = Promoted;
                    ToolTip = 'Specifies the name of the person you regularly contact when you do business with the customer who owns this item.';
                }
                field("Phone No."; Rec."Phone No.")
                {
                    ApplicationArea = Service;
                    DrillDown = false;
                    ToolTip = 'Specifies the customer phone number.';
                }
            }
            group(Contract)
            {
                Caption = 'Contract';
                field("Rent per square Feet"; Rec."Rent per square Feet")
                {
                    ApplicationArea = Basic;
                    Caption = 'Amount  per square Feet';
                }
                field("Area in Square Feet"; Rec."Area in Square Feet")
                {
                    ApplicationArea = Basic;
                }
                field("Quarterly Rent"; Rec."Quarterly Rent")
                {
                    ApplicationArea = Basic;
                    Caption = 'Quarterly Amount';
                }
                field("Default Contract Cost"; Rec."Default Contract Cost")
                {
                    ApplicationArea = Service;
                    Caption = 'Monthly Amount';
                    Editable = false;
                    ToolTip = 'Specifies the default contract cost of a service item that later will be included in a service contract or contract quote.';
                }
                field("Default Contract Value"; Rec."Default Contract Value")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Service Contracts"; Rec."Service Contracts")
                {
                    ApplicationArea = Service;
                    Caption = 'Lease Agreements';
                    ToolTip = 'Specifies that this service item is associated with one or more service contracts/quotes.';
                }
            }
            group(Vendor)
            {
                Caption = 'Vendor';
                Visible = false;
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = Service;
                    ToolTip = 'Specifies the number of the vendor for this item.';

                    trigger OnValidate()
                    begin
                        Rec.CalcFields("Vendor Name");
                    end;
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = Service;
                    DrillDown = false;
                    ToolTip = 'Specifies the vendor name for this item.';
                }
                field("Vendor Item No."; Rec."Vendor Item No.")
                {
                    ApplicationArea = Service;
                    ToolTip = 'Specifies the number that the vendor uses for this item.';
                }
                field("Vendor Item Name"; Rec."Vendor Item Name")
                {
                    ApplicationArea = Service;
                    ToolTip = 'Specifies the name assigned to this item by the vendor.';
                }
            }
            group(Detail)
            {
                Caption = 'Detail';
                Visible = false;
                field("Sales Unit Cost"; Rec."Sales Unit Cost")
                {
                    ApplicationArea = Service;
                    ToolTip = 'Specifies the unit cost of this item when it was sold.';
                }
                field("Sales Unit Price"; Rec."Sales Unit Price")
                {
                    ApplicationArea = Service;
                    ToolTip = 'Specifies the unit price of this item when it was sold.';
                }
                field("Sales Date"; Rec."Sales Date")
                {
                    ApplicationArea = Service;
                    ToolTip = 'Specifies the date when this item was sold.';
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = Service;
                    ToolTip = 'Specifies how each unit of the item or resource is measured, such as in pieces or hours. By default, the value in the Base Unit of Measure field on the item or resource card is inserted.';
                }
                field("Installation Date"; Rec."Installation Date")
                {
                    ApplicationArea = Service;
                    ToolTip = 'Specifies the date when this item was installed at the customer''s site.';
                }
            }
        }
        area(factboxes)
        {
            part(Control1900316107; "Customer Details FactBox")
            {
                ApplicationArea = Service;
                Caption = 'Tenant Details FactBox';
                SubPageLink = "No." = field("Customer No."),
                              "Date Filter" = field("Date Filter");
                Visible = true;
            }
            systempart(Control1900383207; Links)
            {
                Visible = false;
                ApplicationArea = Basic;
            }
            systempart(Control1905767507; Notes)
            {
                Visible = true;
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("&Service Item")
            {
                Caption = '&Service Item';
                Image = ServiceItem;
                action("&Components")
                {
                    ApplicationArea = Service;
                    Caption = '&Components';
                    Image = Components;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Service Item Component List";
                    RunPageLink = Active = const(true),
                                  "Parent Service Item No." = field("No.");
                    RunPageView = sorting(Active, "Parent Service Item No.", "Line No.");
                    ToolTip = 'View components that are used in the service item.';
                }
                action("&Dimensions")
                {
                    ApplicationArea = Dimensions;
                    Caption = '&Dimensions';
                    Image = Dimensions;
                    RunObject = Page "Default Dimensions";
                    RunPageLink = "Table ID" = const(5940),
                                  "No." = field("No.");
                    ShortCutKey = 'Shift+Ctrl+D';
                    ToolTip = 'View or edit dimensions, such as area, project, or department, that you can assign to journal lines to distribute costs and analyze transaction history.';
                }
                group(Statistics)
                {
                    Caption = 'Statistics';
                    Image = Statistics;
                    action(Action39)
                    {
                        ApplicationArea = Service;
                        Caption = 'Statistics';
                        Image = Statistics;
                        Promoted = true;
                        PromotedCategory = Process;
                        RunObject = Page "Service Item Statistics";
                        RunPageLink = "No." = field("No.");
                        ShortCutKey = 'F7';
                        ToolTip = 'View statistical information, such as the value of posted entries, for the record.';
                    }
                    action("Tr&endscape")
                    {
                        ApplicationArea = Service;
                        Caption = 'Tr&endscape';
                        Image = Trendscape;
                        RunObject = Page "Service Item Trendscape";
                        RunPageLink = "No." = field("No.");
                        ToolTip = 'View a detailed account of service item transactions by time intervals.';
                    }
                }
                group(Troubleshooting)
                {
                    Caption = 'Troubleshooting';
                    Image = Troubleshoot;
                    action("Troubleshooting Setup")
                    {
                        ApplicationArea = Service;
                        Caption = 'Troubleshooting Setup';
                        Image = Troubleshoot;
                        RunObject = Page "Troubleshooting Setup";
                        RunPageLink = Type = const("Service Item"),
                                      "No." = field("No.");
                        ToolTip = 'View or edit your settings for troubleshooting service items.';
                    }
                    action("<Page Troubleshooting>")
                    {
                        ApplicationArea = Service;
                        Caption = 'Troubleshooting';
                        Image = Troubleshoot;
                        ToolTip = 'View or edit information about technical problems with a service item.';

                        trigger OnAction()
                        var
                            TroubleshootingHeader: Record "Troubleshooting Header";
                        begin
                            TroubleshootingHeader.ShowForServItem(Rec);
                        end;
                    }
                }
                action("Resource Skills")
                {
                    ApplicationArea = Service;
                    Caption = 'Resource Skills';
                    Image = ResourceSkills;
                    RunObject = Page "Resource Skills";
                    RunPageLink = Type = const("Service Item"),
                                  "No." = field("No.");
                    ToolTip = 'View the assignment of skills to resources, items, service item groups, and service items. You can use skill codes to allocate skilled resources to service items or items that need special skills for servicing.';
                }
                action("S&killed Resources")
                {
                    ApplicationArea = Service;
                    Caption = 'S&killed Resources';
                    Image = ResourceSkills;
                    ToolTip = 'View the list of resources that have the skills required to handle service items.';

                    trigger OnAction()
                    begin
                        Clear(SkilledResourceList);
                        SkilledResourceList.Initialize(ResourceSkill.Type::"Service Item", Rec."No.", Rec.Description);
                        SkilledResourceList.RunModal;
                    end;
                }
                action("Co&mments")
                {
                    ApplicationArea = Service;
                    Caption = 'Co&mments';
                    Image = ViewComments;
                    RunObject = Page "Service Comment Sheet";
                    RunPageLink = "Table Name" = const("Service Item"),
                                  "Table Subtype" = const(0),
                                  "No." = field("No.");
                    ToolTip = 'View or add comments for the record.';
                }
            }
            group(Documents)
            {
                Caption = 'Documents';
                Image = Documents;
                group("S&ervice Orders")
                {
                    Caption = 'S&ervice Orders';
                    Image = "Order";
                    action("&Item Lines")
                    {
                        ApplicationArea = Service;
                        Caption = '&Item Lines';
                        Image = ItemLines;
                        RunObject = Page "Service Item Lines";
                        RunPageLink = "Service Item No." = field("No.");
                        RunPageView = sorting("Service Item No.");
                        ToolTip = 'View ongoing service item lines for the item. ';
                    }
                    action("&Service Lines")
                    {
                        ApplicationArea = Service;
                        Caption = '&Service Lines';
                        Image = ServiceLines;
                        RunObject = Page "Service Line List";
                        RunPageLink = "Service Item No." = field("No.");
                        RunPageView = sorting("Service Item No.");
                        ToolTip = 'View ongoing service lines for the item.';
                    }
                }
                group("Service Shi&pments")
                {
                    Caption = 'Service Shi&pments';
                    Image = Shipment;
                    action(Action117)
                    {
                        ApplicationArea = Service;
                        Caption = '&Item Lines';
                        Image = ItemLines;
                        RunObject = Page "Posted Shpt. Item Line List";
                        RunPageLink = "Service Item No." = field("No.");
                        RunPageView = sorting("Service Item No.");
                        ToolTip = 'View ongoing service item lines for the item. ';
                    }
                    action(Action113)
                    {
                        ApplicationArea = Service;
                        Caption = '&Service Lines';
                        Image = ServiceLines;
                        RunObject = Page "Posted Serv. Shpt. Line List";
                        RunPageLink = "Service Item No." = field("No.");
                        RunPageView = sorting("Service Item No.");
                        ToolTip = 'View ongoing service lines for the item.';
                    }
                }
                action("Ser&vice Contracts")
                {
                    ApplicationArea = Service;
                    Caption = 'Ser&vice Contracts';
                    Image = ServiceAgreement;
                    Promoted = true;
                    PromotedCategory = Process;
                    RunObject = Page "Serv. Contr. List (Serv. Item)";
                    RunPageLink = "Service Item No." = field("No.");
                    RunPageView = sorting("Service Item No.", "Contract Status");
                    ToolTip = 'Open the list of ongoing service contracts.';
                }
            }
            group(History)
            {
                Caption = 'History';
                Image = History;
                action("Service Item Lo&g")
                {
                    ApplicationArea = Service;
                    Caption = 'Service Item Lo&g';
                    Image = Log;
                    RunObject = Page "Service Item Log";
                    RunPageLink = "Service Item No." = field("No.");
                    ToolTip = 'View a list of the service document changes that have been logged. The program creates entries in the window when, for example, the response time or service order status changed, a resource was allocated, a service order was shipped or invoiced, and so on. Each line in this window identifies the event that occurred to the service document. The line contains the information about the field that was changed, its old and new value, the date and time when the change took place, and the ID of the user who actually made the changes.';
                }
                action("Service Ledger E&ntries")
                {
                    ApplicationArea = Service;
                    Caption = 'Service Ledger E&ntries';
                    Image = ServiceLedger;
                    RunObject = Page "Service Ledger Entries";
                    RunPageLink = "Service Item No. (Serviced)" = field("No."),
                                  "Service Order No." = field("Service Order Filter"),
                                  "Service Contract No." = field("Contract Filter"),
                                  "Posting Date" = field("Date Filter");
                    RunPageView = sorting("Service Item No. (Serviced)", "Entry Type", "Moved from Prepaid Acc.", Type, "Posting Date");
                    ShortCutKey = 'Ctrl+F7';
                    ToolTip = 'View all the ledger entries for the service item or service order that result from posting transactions in service documents.';
                }
                action("&Warranty Ledger Entries")
                {
                    ApplicationArea = Service;
                    Caption = '&Warranty Ledger Entries';
                    Image = WarrantyLedger;
                    RunObject = Page "Warranty Ledger Entries";
                    RunPageLink = "Service Item No. (Serviced)" = field("No.");
                    RunPageView = sorting("Service Item No. (Serviced)", "Posting Date", "Document No.");
                    ToolTip = 'View all the ledger entries for the service item or service order that result from posting transactions in service documents that contain warranty agreements.';
                }
            }
        }
        area(processing)
        {
            group(New)
            {
                Caption = 'New';
                Image = NewItem;
                action("New Item")
                {
                    ApplicationArea = Service;
                    Caption = 'New Item';
                    Image = NewItem;
                    Promoted = true;
                    PromotedCategory = New;
                    RunObject = Page "Item Card";
                    RunPageMode = Create;
                    ToolTip = 'Create an item card based on the stockkeeping unit.';
                }
            }
        }
        area(reporting)
        {
            action("Service Line Item Label")
            {
                ApplicationArea = Service;
                Caption = 'Service Line Item Label';
                Image = "Report";
                Promoted = false;
                //The property 'PromotedCategory' can only be set if the property 'Promoted' is set to 'true'
                //PromotedCategory = "Report";
                RunObject = Report "Service Item Line Labels";
                ToolTip = 'View the list of service items on service orders. The report shows the order number, service item number, serial number, and the name of the item.';
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        UpdateShipToCode;
    end;

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        if Rec."Item No." = '' then
            if Rec.GetFilter("Item No.") <> '' then
                if Rec.GetRangeMin("Item No.") = Rec.GetRangemax("Item No.") then
                    Rec."Item No." := Rec.GetRangeMin("Item No.");

        if Rec."Customer No." = '' then
            if Rec.GetFilter("Customer No.") <> '' then
                if Rec.GetRangeMin("Customer No.") = Rec.GetRangemax("Customer No.") then
                    Rec."Customer No." := Rec.GetRangeMin("Customer No.");
    end;

    var
        ResourceSkill: Record "Resource Skill";
        SkilledResourceList: Page "Skilled Resource List";

    local procedure UpdateShipToCode()
    begin
        if Rec."Ship-to Code" = '' then begin
            Rec."Ship-to Name" := Rec.Name;
            Rec."Ship-to Address" := Rec.Address;
            Rec."Ship-to Address 2" := Rec."Address 2";
            Rec."Ship-to Post Code" := Rec."Post Code";
            Rec."Ship-to City" := Rec.City;
            Rec."Ship-to Phone No." := Rec."Phone No.";
            Rec."Ship-to Contact" := Rec.Contact;
        end else
            Rec.CalcFields(
              "Ship-to Name", "Ship-to Name 2", "Ship-to Address", "Ship-to Address 2", "Ship-to Post Code", "Ship-to City",
              "Ship-to County", "Ship-to Country/Region Code", "Ship-to Contact", "Ship-to Phone No.");
    end;

    local procedure CustomerNoOnAfterValidate()
    begin
        if Rec."Customer No." <> xRec."Customer No." then
            UpdateShipToCode;
    end;
}

#pragma implicitwith restore

