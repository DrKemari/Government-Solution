#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 80208 "Employee Attestations Card"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "Employee Policy Attestation";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Attestation No."; Rec."Attestation No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Attestation No. field.';
                }
                field("Policy No."; Rec."Policy No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Policy No. field.';
                }
                field("Policy Name"; Rec."Policy Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Policy Name field.';
                }
                field("External Document No"; Rec."External Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the External Document No field.';
                }
                field("Policy Goal"; Rec."Policy Goal")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Policy Goal field.';
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No. field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Primary Directorate"; Rec."Primary Directorate")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Directorate field.';
                }
                field("Primary Department"; Rec."Primary Department")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Department field.';
                }
                field("Due Date"; Rec."Due Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Due Date field.';
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Acknowledge Policy")
            {
                ApplicationArea = Basic;
                Image = Agreement;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ToolTip = 'Executes the Acknowledge Policy action.';
                trigger OnAction()
                begin
                    if Rec."Employee Signing Status" <> Rec."employee signing status"::Approved then begin
                        Rec."Employee Signing Status" := Rec."employee signing status"::Approved;
                        Rec."Date Approved" := Today;
                        Rec.Modify;
                        Message('Acknowledgement Recorded Successfully');
                    end else
                        Error('Employee Signing Status must be Pending');
                end;
            }
        }
    }
}

#pragma implicitwith restore

