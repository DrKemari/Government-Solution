#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 52025 "Axle Permit Application"
{
    ApplicationArea = Basic;
    CardPageID = "Axle Permit Application Card";
    PageType = List;
    SourceTable = "Axle Load Permit Application";
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Applicant Name"; Rec."Applicant Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Applicant Name field.';
                }
                field("Applicant Address"; Rec."Applicant Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Applicant Address field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Vehicle/Trailer Reg No"; Rec."Vehicle/Trailer Reg No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vehicle/Trailer Reg No field.';
                }
                field("Tare Weight (KG)"; Rec."Tare Weight (KG)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tare Weight (KG) field.';
                }
                field("Vehicle Model/Make"; Rec."Vehicle Model/Make")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Vehicle Model/Make field.';
                }
                field("Total No of Axle"; Rec."Total No of Axle")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total No of Axle field.';
                }
                field("Total No of Wheels Per Axle"; Rec."Total No of Wheels Per Axle")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total No of Wheels Per Axle field.';
                }
                field("Journey Start Date"; Rec."Journey Start Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Journey Start Date field.';
                }
                field("Journey End Date"; Rec."Journey End Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Journey End Date field.';
                }
                field("Route to be folowed"; Rec."Route to be folowed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Route to be folowed field.';
                }
                field("Width(M)"; Rec."Width(M)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Width(M) field.';
                }
                field("Height(M)"; Rec."Height(M)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Height(M) field.';
                }
                field("Length(M)"; Rec."Length(M)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Length(M) field.';
                }
                field("Weight of the Cargo(KG)"; Rec."Weight of the Cargo(KG)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Weight of the Cargo(KG) field.';
                }
                field("Gross Vehicle Weight(KG)"; Rec."Gross Vehicle Weight(KG)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gross Vehicle Weight(KG) field.';
                }
                field("Description of Load"; Rec."Description of Load")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description of Load field.';
                }
                field("Escort Details"; Rec."Escort Details")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Escort Details field.';
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(Attachments)
            {
                ApplicationArea = All;
                Caption = 'Attachments';
                Image = Attach;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';

                trigger OnAction()
                var
                    DocumentAttachmentDetails: Page "Document Attachment Details";
                    RecRef: RecordRef;
                begin
                    RecRef.GetTable(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.RunModal;
                end;
            }
        }
    }
}

#pragma implicitwith restore

