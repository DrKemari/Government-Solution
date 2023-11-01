#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51554 "Audits Awaiting Site Visit"
{
    Caption = 'Audits Awaiting Site Visit';
    CardPageID = "Programme Audit Response";
    Editable = false;
    PageType = List;
    SourceTable = "Audit Requisition Header";
    SourceTableView = where("Document Type" = filter("SAR Response"),
                            "Document Status" = filter("Awaiting Site Inspection"));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Audit Plan No."; Rec."Audit Plan No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Plan No. field.';
                }
                field("Audit Plan Item"; Rec."Audit Plan Item")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Plan Item field.';
                }
                field("Audit Plan Start Date"; Rec."Audit Plan Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Plan Start Date field.';
                }
                field("Audit Plan End Date"; Rec."Audit Plan End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Audit Plan End Date field.';
                }
                field("Insitution/Programme No."; Rec."Insitution/Programme No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Insitution/Programme No. field.';
                }
                field("Responsible Officer No."; Rec."Responsible Officer No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Responsible Officer No. field.';
                }
                field("Officer Name"; Rec."Officer Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Officer Name field.';
                }
                field("SAR Template No."; Rec."SAR Template No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the SAR Template No. field.';
                }
                field("SAR Template Description"; Rec."SAR Template Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the SAR Template Description field.';
                }
                field("No. Of Questions"; Rec."No. Of Questions")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Of Questions field.';
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Status field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

