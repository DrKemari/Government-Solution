#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80381 "Approved Customer Experiences"
{
    ApplicationArea = Basic;
    CardPageID = "Approved Customer Experience";
    Editable = false;
    PageType = List;
    SourceTable = "Business Research Survey";
    SourceTableView = where("Business Research Category" = const("Customer Experience"),
                            "Approval Status" = const(Released));
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Business Research Category"; Rec."Business Research Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Business Research Category field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Survey Type"; Rec."Survey Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Survey Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Business Research Template ID"; Rec."Business Research Template ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Business Research Template ID field.';
                }
                field("Target Respondent Type"; Rec."Target Respondent Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Target Respondent Type field.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project ID field.';
                }
                field("Primary Department ID"; Rec."Primary Department ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Department ID field.';
                }
                field("Primary Directorate ID"; Rec."Primary Directorate ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Directorate ID field.';
                }
                field(Published; Rec.Published)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Published field.';
                }
                field("Date Published"; Rec."Date Published")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Published field.';
                }
                field("Response Due Date"; Rec."Response Due Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Response Due Date field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Creation Date field.';
                }
                field("Creation Time"; Rec."Creation Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Creation Time field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("No. of Responses"; Rec."No. of Responses")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Responses field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

