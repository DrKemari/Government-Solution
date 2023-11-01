#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51207 "Insitution Onboarding Card"
{
    PageType = Card;
    SourceTable = "Accreditation Verdict Setup";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                //     field("Created On"; "Created On")
                //     {
                //         ApplicationArea = Basic;
                //         Editable = false;
                //         ToolTip = 'Specifies the value of the Created On field.';
                //     }
                //     field("Created By"; "Created By")
                //     {
                //         ApplicationArea = Basic;
                //         Editable = false;
                //         ToolTip = 'Specifies the value of the Created By field.';
                //     }
                //     field("Accreditation Code"; "Accreditation Code")
                //     {
                //         ApplicationArea = Basic;
                //         ToolTip = 'Specifies the value of the Accreditation Code field.';
                //     }
                //     field("Accreditation Type"; "Accreditation Type")
                //     {
                //         ApplicationArea = Basic;
                //         Editable = false;
                //         ToolTip = 'Specifies the value of the Accreditation Type field.';
                //         trigger OnValidate()
                //         begin
                //             FeeSchedule.Reset;
                //             FeeSchedule.SetRange(Code, "Accreditation Code");
                //             if FeeSchedule.FindSet then begin
                //                 if FeeSchedule."Applies To New" = false then begin
                //                     editable := true;
                //                     enabled := false;
                //                 end else begin
                //                     editable := false;
                //                     enabled := true;
                //                 end
                //             end
                //         end;
                //     }
                //     field("Insitution No."; "Insitution No.")
                //     {
                //         ApplicationArea = Basic;
                //         Enabled = editable;
                //         ToolTip = 'Specifies the value of the Insitution No. field.';
                //     }
                //     field("Institution Name"; "Institution Name")
                //     {
                //         ApplicationArea = Basic;
                //         Enabled = false;
                //         ToolTip = 'Specifies the value of the Institution Name field.';
                //     }
                //     field(Description; Description)
                //     {
                //         ApplicationArea = Basic;
                //         Caption = 'Proposed Name of Institution';
                //         ToolTip = 'Specifies the value of the Proposed Name of Institution field.';
                //     }
                //     field("KRA Pin"; "KRA Pin")
                //     {
                //         ApplicationArea = Basic;
                //         Enabled = enabled;
                //         ShowMandatory = true;
                //         ToolTip = 'Specifies the value of the KRA Pin field.';
                //     }
                //     field("Proposed Location"; "Accreditation Type")
                //     {
                //         ApplicationArea = Basic;
                //         Caption = 'Proposed Location';
                //         ToolTip = 'Specifies the value of the Proposed Location field.';
                //     }
                //     field(Sponsor; Sponsor)
                //     {
                //         ApplicationArea = Basic;
                //         Enabled = enabled;
                //         ToolTip = 'Specifies the value of the Sponsor field.';
                //     }
                // }
                // group("Communication Details")
                // {
                //     field("County Code"; "County Code")
                //     {
                //         ApplicationArea = Basic;
                //         ToolTip = 'Specifies the value of the County Code field.';
                //     }
                //     field(County; County)
                //     {
                //         ApplicationArea = Basic;
                //         Editable = false;
                //         ToolTip = 'Specifies the value of the County field.';
                //     }
                //     field("Constituency Code"; "Constituency Code")
                //     {
                //         ApplicationArea = Basic;
                //         ToolTip = 'Specifies the value of the Constituency Code field.';
                //     }
                //     field("Constituency Name"; "Constituency Name")
                //     {
                //         ApplicationArea = Basic;
                //         Editable = false;
                //         ToolTip = 'Specifies the value of the Constituency Name field.';
                //     }
                //     field(Address; Address)
                //     {
                //         ApplicationArea = Basic;
                //         ToolTip = 'Specifies the value of the Address field.';
                //     }
                //     field(City; City)
                //     {
                //         ApplicationArea = Basic;
                //         ToolTip = 'Specifies the value of the City field.';
                //     }
                //     field("Post Code"; "Post Code")
                //     {
                //         ApplicationArea = Basic;
                //         ToolTip = 'Specifies the value of the Post Code field.';
                //     }
                //     field("Country Code"; "Country Code")
                //     {
                //         ApplicationArea = Basic;
                //         ToolTip = 'Specifies the value of the Country Code field.';
                //     }
                //     field(Email; Email)
                //     {
                //         ApplicationArea = Basic;
                //         Caption = 'Email';
                //         ToolTip = 'Specifies the value of the Email field.';
                //     }
                //     field("Institutional Website"; "Institutional Website")
                //     {
                //         ApplicationArea = Basic;
                //         Image = Stack;
                //         ToolTip = 'Specifies the value of the Institutional Website field.';
                //     }
                //     field("Phone No."; "Phone No.")
                //     {
                //         ApplicationArea = Basic;
                //         ToolTip = 'Specifies the value of the Phone No. field.';
                //     }
            }
            group(Verification)
            {
                group("Required Documents")
                {
                    // field("Application Letter"; "Application Letter")
                    // {
                    //     ApplicationArea = Basic;
                    //     ToolTip = 'Specifies the value of the Application Letter field.';
                    // }
                    // field("KRA Copy"; "KRA Copy")
                    // {
                    //     ApplicationArea = Basic;
                    //     ToolTip = 'Specifies the value of the KRA Copy field.';
                    // }
                }
            }
        }
        area(factboxes)
        {
            part(Control46; "Customer Picture")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "No." = field(Code);
            }
            part(Control45; "Office Customer Details")
            {
                ApplicationArea = All;
                Caption = 'Details';
                SubPageLink = "No." = field(Code);
            }
            part(AgedAccReceivableChart2; "Aged Acc. Receivable Chart")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field(Code);
            }
            part(Control43; "CRM Statistics FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field(Code);
            }
            part(SalesHistSelltoFactBox; "Sales Hist. Sell-to FactBox")
            {
                ApplicationArea = Basic, Suite;
                SubPageLink = "No." = field(Code);
            }
            part(SalesHistBilltoFactBox; "Sales Hist. Bill-to FactBox")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field(Code);
                Visible = false;
            }
            part(CustomerStatisticsFactBox; "Customer Statistics FactBox")
            {
                ApplicationArea = Advanced;
                SubPageLink = "No." = field(Code);
            }
            part(Control37; "Dimensions FactBox")
            {
                ApplicationArea = Advanced;
                SubPageLink = "Table ID" = const(18),
                              "No." = field(Code);
            }
            part(Control36; "Service Hist. Sell-to FactBox")
            {
                ApplicationArea = Advanced;
                SubPageLink = "No." = field(Code);
                Visible = false;
            }
            part(Control35; "Service Hist. Bill-to FactBox")
            {
                ApplicationArea = Advanced;
                SubPageLink = "No." = field(Code);
                Visible = false;
            }
            part(WorkflowStatus; "Workflow Status FactBox")
            {
                ApplicationArea = Suite;
                Editable = false;
                Enabled = false;
                ShowFilter = false;
            }
            systempart(Control29; Links)
            {
                ApplicationArea = Basic;
            }
            systempart(Control25; Notes)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(creation)
        {
            separator(Action12)
            {
                Caption = '       -';
            }
            // action("Create Customer Account")
            // {
            //     ApplicationArea = Basic;
            //     Caption = 'Create Customer Account';
            //     Enabled = enabled;
            //     Image = Customer;
            //     Promoted = true;
            //     PromotedCategory = New;
            //     PromotedIsBig = true;
            //     Visible = true;
            //     ToolTip = 'Executes the Create Customer Account action.';
            //     trigger OnAction()
            //     begin
            //         GenSetUp.Get();
            //         TestField(Created, false);
            //         TestField("KRA Copy");
            //         TestField("KRA Pin");
            //         TestField("Application Letter");
            //         if Confirm(Text003, false) = true then begin
            //             categoriesNoSetup.Reset;
            //             categoriesNoSetup.SetRange(categoriesNoSetup.Code, "Accreditation Code");
            //             if categoriesNoSetup.FindSet then begin
            //                 NoSeriesMgt.InitSeries(categoriesNoSetup."No. Series", categoriesNoSetup."No. Series", 0D, AppNo, categoriesNoSetup."No. Series");
            //                 Cust."No." := AppNo;
            //                 Cust.Name := Description;
            //                 Cust.Address := Address;
            //                 Cust."Post Code" := "Post Code";
            //                 Cust.City := City;
            //                 Cust.County := County;
            //                 Cust."Phone No." := "Phone No.";
            //                 Cust."Customer Posting Group" := GenSetUp."Customer Posting Group";
            //                 Cust."Gen. Bus. Posting Group" := GenSetUp."Gen. Bus. Posting Group";
            //                 Cust."E-Mail" := Email;
            //                 Cust.Type := Type;
            //                 Cust."Customer Type" := Cust."customer type"::Trade;
            //                 Cust."P.I.N" := "KRA Pin";
            //                 Cust.Insert(true);
            //                 BOSAACC := Cust."No.";

            //                 Cust.Reset;
            //                 if Cust.Get(BOSAACC) then begin
            //                     Cust.Validate(Cust.Name);
            //                     Cust.Validate(Cust."Global Dimension 1 Code");
            //                     Cust.Validate(Cust."Global Dimension 2 Code");
            //                     Cust.Modify;
            //                 end;

            //                 Message(Text004);
            //                 "Converted By" := UserId;
            //                 "Converted On" := Today;
            //                 Created := true;
            //                 "Insitution No." := AppNo;
            //                 Modify;

            //             end else
            //                 Error(Text006, "Accreditation Code");

            //         end else begin
            //             Message(Text005, "KRA Pin");
            //         end
            //     end;
            // }
            action(Dimensions)
            {
                ApplicationArea = Basic;
                Caption = 'Dimensions';
                Image = Dimensions;
                RunObject = Page "Default Dimensions";
                ShortCutKey = 'Shift+Ctrl+D';
                ToolTip = 'Executes the Dimensions action.';
            }
        }
        // Page "Sales Invoice";
        //     GenSetUp;
        //     Text001Codeunit "Lines Instruction Mgt."Codeunit "Sales-Post (Yes/No)"Codeunit "Payments-Post"Codeunit "SMTP Mail"Codeunit ""
    }
}
#pragma implicitwith restore
