#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51557 "PSAR Site Visits"
{
    Caption = 'PSAR Site Visits';
    CardPageID = "PSAR Site Visit Voucher";
    Editable = false;
    PageType = List;
    SourceTable = "Audit Requisition Header";
    SourceTableView = where("Document Type" = filter("SAR Site Inspection"),
                            "Resource Feedback Type" = filter(Individual));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field("Institution Name"; Rec."Institution Name")
                {
                    ApplicationArea = Basic;
                }
                field("Institution Email"; Rec."Institution Email")
                {
                    ApplicationArea = Basic;
                }
                field("Institution Code"; Rec."Institution Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Task Type"; Rec."Task Type")
                {
                    ApplicationArea = Basic;
                }
                field("Audit Plan Start Date"; Rec."Audit Plan Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Audit Plan End Date"; Rec."Audit Plan End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Insitution/Programme No."; Rec."Insitution/Programme No.")
                {
                    ApplicationArea = Basic;
                }
                field("Responsible Officer No."; Rec."Responsible Officer No.")
                {
                    ApplicationArea = Basic;
                }
                field("Officer Name"; Rec."Officer Name")
                {
                    ApplicationArea = Basic;
                }
                field("Document Status"; Rec."Document Status")
                {
                    ApplicationArea = Basic;
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control44; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control45; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control46; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control47; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

