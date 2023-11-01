#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51515 "Programme  Audit Responses"
{
    Caption = 'Programme  Audit Responses';
    CardPageID = "Programme Audit Response";
    Editable = false;
    PageType = List;
    SourceTable = "Audit Requisition Header";
    SourceTableView = where("Document Type"=filter("SAR Response"),
                            "Document Status"=filter("Awaiting Finance Processing"));

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
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Audit Plan No."; Rec."Audit Plan No.")
                {
                    ApplicationArea = Basic;
                }
                field("Audit Plan Item"; Rec."Audit Plan Item")
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
                field("SAR Template No."; Rec."SAR Template No.")
                {
                    ApplicationArea = Basic;
                }
                field("SAR Template Description"; Rec."SAR Template Description")
                {
                    ApplicationArea = Basic;
                }
                field("No. Of Questions"; Rec."No. Of Questions")
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
    }

    actions
    {
    }
}

#pragma implicitwith restore

