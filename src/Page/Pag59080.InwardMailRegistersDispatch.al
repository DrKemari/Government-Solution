#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 59080 "Inward Mail Registers-Dispatch"
{
    ApplicationArea = Basic;
    Caption = ' Mail Register-Dispatch';
    CardPageID = "Inward Mail RegisterCard";
    Editable = false;
    PageType = List;
    SourceTable = "Inward Mail Register";
    SourceTableView = sorting("Mail Register No")
                      where("Document Type" = filter("Inward Register"));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Mail Register No"; Rec."Mail Register No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mail Register No field.';
                }
                field("Date received"; Rec."Date received")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date received field.';
                }
                field("Date of letter"; Rec."Date of letter")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date of Dispatch field.';
                }
                field("Organization Name"; Rec."Organization Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Organization Name field.';
                }
                field("Author Name"; Rec."Author Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Author Name field.';
                }
                field(Subject; Rec.Subject)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Subject field.';
                }
                field("File No"; Rec."File No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the File No field.';
                }
                field("File folio"; Rec."File folio")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the File folio field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

