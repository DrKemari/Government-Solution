#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85043 "Exam Center Card"
{
    Caption = 'Exam Center Card';
    DeleteAllowed = false;
    PageType = Card;
    PromotedActionCategories = 'New,Process,Report,Location';
    SourceTable = "Examination Centres";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Location;
                    Importance = Promoted;
                    ToolTip = 'Specifies a location code for the warehouse or distribution center where your items are handled and stored before being sold.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Location;
                    ToolTip = 'Specifies the name or address of the location.';
                }
                field("Exam Zone"; Rec."Exam Zone")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Exam Zone field.';
                }
                field("Exam Region"; Rec."Exam Region")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Exam Region field.';
                }
                field("Exam Route"; Rec."Exam Route")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Exam Route field.';
                }
                field("Disability Friendly"; Rec."Disability Friendly")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disability Friendly field.';
                }
                field("Computer Based Friendly"; Rec."Computer Based Friendly")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Computer Based Friendly field.';
                }
                field("KISEB Centers"; Rec."KISEB Centers")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the KISEB Centers field.';
                }
                field("Exam Buffer Zone"; Rec."Exam Buffer Zone")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Exam Buffer Zone field.';
                }
                field("Neutral Buffer Zone"; Rec."Neutral Buffer Zone")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Neutral Buffer Zone field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
                field("Training Institution"; Rec."Training Institution")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Training Institution field.';
                }
                field(Institution; Rec.Institution)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Maximum Capacity Per Session"; Rec."Maximum Capacity Per Session")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Maximum Capacity Per Session field.';
                }
                field("Total Booked Students"; Rec."Total Booked Students")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Booked Students field.';
                }
            }
            group("Address & Contact")
            {
                Caption = 'Address & Contact';
                group(AddressDetails)
                {
                    Caption = 'Address';
                    field(Address; Rec.Address)
                    {
                        ApplicationArea = Location;
                        ToolTip = 'Specifies the location address.';
                    }
                    field("Address 2"; Rec."Address 2")
                    {
                        ApplicationArea = Location;
                        ToolTip = 'Specifies additional address information.';
                    }
                    field("Post Code"; Rec."Post Code")
                    {
                        ApplicationArea = Location;
                        ToolTip = 'Specifies the postal code.';
                    }
                    field(City; Rec.City)
                    {
                        ApplicationArea = Location;
                        ToolTip = 'Specifies the city of the location.';
                    }
                    field("Country/Region Code"; Rec."Country/Region Code")
                    {
                        ApplicationArea = Location;
                        ToolTip = 'Specifies the country/region of the address.';
                    }
                    field(ShowMap; ShowMapLbl)
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
                    field(Contact; Rec.Contact)
                    {
                        ApplicationArea = Location;
                        ToolTip = 'Specifies the name of the contact person at the location';
                    }
                    field("Phone No."; Rec."Phone No.")
                    {
                        ApplicationArea = Location;
                        Importance = Promoted;
                        ToolTip = 'Specifies the telephone number of the location.';
                    }
                    field("Fax No."; Rec."Fax No.")
                    {
                        ApplicationArea = Location;
                        ToolTip = 'Specifies the fax number of the location.';
                    }
                    field("E-Mail"; Rec."E-Mail")
                    {
                        ApplicationArea = Location;
                        ExtendedDatatype = EMail;
                        ToolTip = 'Specifies the email address of the location.';
                    }
                    field("Home Page"; Rec."Home Page")
                    {
                        ApplicationArea = Location;
                        ToolTip = 'Specifies the location''s web site.';
                    }
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1900383207; Links)
            {
                ApplicationArea = RecordLinks;
                Visible = false;
            }
            systempart(Control1905767507; Notes)
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
            group("&Location")
            {
                Caption = '&Location';
                Image = Warehouse;
                action("Online Map")
                {
                    ApplicationArea = Location;
                    Caption = 'Online Map';
                    Image = Map;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedOnly = true;
                    ToolTip = 'View the address on an online map.';

                    trigger OnAction()
                    begin
                        Rec.DisplayMap;
                    end;
                }
                action("Center Allocation Entries")
                {
                    ApplicationArea = Basic;
                    Image = "Report";
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ToolTip = 'Executes the Center Allocation Entries action.';
                    trigger OnAction()
                    begin
                        CenterBookingEntries.Reset;
                        CenterBookingEntries.SetRange("Exam Center Code", Rec.Code);
                        CenterBookingEntries.SetRange(Status, CenterBookingEntries.Status::Allocated);
                        Report.Run(85003, true, false, CenterBookingEntries);
                    end;
                }
                action("Examination Booking Entries")
                {
                    ApplicationArea = Basic;
                    Image = Statistics;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    RunObject = Page "Exam Booking Entries";
                    RunPageLink = "Exam Center" = field(Code);
                    ToolTip = 'Executes the Examination Booking Entries action.';
                }
            }
        }
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

#pragma implicitwith restore

