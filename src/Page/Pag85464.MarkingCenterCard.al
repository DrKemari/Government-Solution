#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
Page 85464 "Marking Center Card"
{
    Caption = 'Exam Center Card';
    DeleteAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Report,Location';
    SourceTable = "Marking Centres";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Code";Rec.Code)
                {
                    ApplicationArea = Location;
                    Importance = Promoted;
                    ToolTip = 'Specifies a location code for the warehouse or distribution center where your items are handled and stored before being sold.';
                }
                field(Name;Rec.Name)
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the name or address of the location.';
                }
            }
            group(AddressContact)
            {
                Caption = 'Address & Contact';
                group(AddressDetails)
                {
                    Caption = 'Address';
                    field(Address;Rec.Address)
                    {
                        ApplicationArea = Location;
                        ToolTip = 'Specifies the location address.';
                    }
                    field(Address2;Rec."Address 2")
                    {
                        ApplicationArea = Location;
                        ToolTip = 'Specifies additional address information.';
                    }
                    field(PostCode;Rec."Post Code")
                    {
                        ApplicationArea = Location;
                        ToolTip = 'Specifies the postal code.';
                    }
                    field(City;Rec.City)
                    {
                        ApplicationArea = Location;
                        ToolTip = 'Specifies the city of the location.';
                    }
                    field(CountryRegionCode;Rec."Country/Region Code")
                    {
                        ApplicationArea = Location;
                        ToolTip = 'Specifies the country/region of the address.';
                    }
                    field(ShowMap;ShowMapLbl)
                    {
                        ApplicationArea = Location;
                        Editable = false;
                        ShowCaption = false;
                        Style = StrongAccent;
                        StyleExpr = true;
                        ToolTip = 'Specifies the address of the location on your preferred map website.';

                        trigger OnDrillDown()
                        begin
                            CurrPage.Update;
                            Rec.DisplayMap;
                        end;
                    }
                }
                group(ContactDetails)
                {
                    Caption = 'Contact';
                    field(Contact;Rec.Contact)
                    {
                        ApplicationArea = Location;
                        ToolTip = 'Specifies the name of the contact person at the location';
                    }
                    field(PhoneNo;Rec."Phone No.")
                    {
                        ApplicationArea = Location;
                        Importance = Promoted;
                        ToolTip = 'Specifies the telephone number of the location.';
                    }
                    field(FaxNo;Rec."Fax No.")
                    {
                        ApplicationArea = Location;
                        ToolTip = 'Specifies the fax number of the location.';
                    }
                    field(EMail;Rec."E-Mail")
                    {
                        ApplicationArea = Location;
                        ExtendedDatatype = EMail;
                        ToolTip = 'Specifies the email address of the location.';
                    }
                    field(HomePage;Rec."Home Page")
                    {
                        ApplicationArea = Location;
                        ToolTip = 'Specifies the location''s web site.';
                    }
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
    }

    trigger OnInit()
    begin
        UseCrossDockingEnable := true;
        UsePutAwayWorksheetEnable := true;
        BinMandatoryEnable := true;
        RequireShipmentEnable := true;
        RequireReceiveEnable := true;
        RequirePutAwayEnable := true;
        RequirePickEnable := true;
        DefaultBinSelectionEnable := true;
        UseADCSEnable := true;
        DirectedPutawayandPickEnable := true;
        CrossDockBinCodeEnable := true;
        PickAccordingToFEFOEnable := true;
        AdjustmentBinCodeEnable := true;
        ShipmentBinCodeEnable := true;
        ReceiptBinCodeEnable := true;
        FromProductionBinCodeEnable := true;
        ToProductionBinCodeEnable := true;
        OpenShopFloorBinCodeEnable := true;
        ToAssemblyBinCodeEnable := true;
        FromAssemblyBinCodeEnable := true;
        AssemblyShipmentBinCodeEnable := true;
        CrossDockDueDateCalcEnable := true;
        AlwaysCreatePutawayLineEnable := true;
        AlwaysCreatePickLineEnable := true;
        PutAwayTemplateCodeEnable := true;
        AllowBreakbulkEnable := true;
        SpecialEquipmentEnable := true;
        BinCapacityPolicyEnable := true;
        BaseCalendarCodeEnable := true;
        InboundWhseHandlingTimeEnable := true;
        OutboundWhseHandlingTimeEnable := true;
        EditInTransit := true;
    end;

    var
        CustomizedCalEntry: Record "Customized Calendar Entry";
        CustomizedCalendar: Record "Customized Calendar Change";
        CalendarMgmt: Codeunit "Calendar Management";
        [InDataSet]
        OutboundWhseHandlingTimeEnable: Boolean;
        [InDataSet]
        InboundWhseHandlingTimeEnable: Boolean;
        [InDataSet]
        BaseCalendarCodeEnable: Boolean;
        [InDataSet]
        BinCapacityPolicyEnable: Boolean;
        [InDataSet]
        SpecialEquipmentEnable: Boolean;
        [InDataSet]
        AllowBreakbulkEnable: Boolean;
        [InDataSet]
        PutAwayTemplateCodeEnable: Boolean;
        [InDataSet]
        AlwaysCreatePickLineEnable: Boolean;
        [InDataSet]
        AlwaysCreatePutawayLineEnable: Boolean;
        [InDataSet]
        CrossDockDueDateCalcEnable: Boolean;
        [InDataSet]
        OpenShopFloorBinCodeEnable: Boolean;
        [InDataSet]
        ToProductionBinCodeEnable: Boolean;
        [InDataSet]
        FromProductionBinCodeEnable: Boolean;
        [InDataSet]
        ReceiptBinCodeEnable: Boolean;
        [InDataSet]
        ShipmentBinCodeEnable: Boolean;
        [InDataSet]
        AdjustmentBinCodeEnable: Boolean;
        [InDataSet]
        ToAssemblyBinCodeEnable: Boolean;
        [InDataSet]
        FromAssemblyBinCodeEnable: Boolean;
        AssemblyShipmentBinCodeEnable: Boolean;
        [InDataSet]
        PickAccordingToFEFOEnable: Boolean;
        [InDataSet]
        CrossDockBinCodeEnable: Boolean;
        [InDataSet]
        DirectedPutawayandPickEnable: Boolean;
        [InDataSet]
        UseADCSEnable: Boolean;
        [InDataSet]
        DefaultBinSelectionEnable: Boolean;
        [InDataSet]
        RequirePickEnable: Boolean;
        [InDataSet]
        RequirePutAwayEnable: Boolean;
        [InDataSet]
        RequireReceiveEnable: Boolean;
        [InDataSet]
        RequireShipmentEnable: Boolean;
        [InDataSet]
        BinMandatoryEnable: Boolean;
        [InDataSet]
        UsePutAwayWorksheetEnable: Boolean;
        [InDataSet]
        UseCrossDockingEnable: Boolean;
        [InDataSet]
        EditInTransit: Boolean;
        ShowMapLbl: label 'Show on Map';
        CenterBookingEntries: Record "Center Booking Entries";
}
