#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 56047 "Document Registration List"
{
    ApplicationArea = Basic;
    CardPageID = "Document Registration Card";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "Document registration";
    SourceTableView = where(RegistrationType = const(Document));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field("Document Sub Type"; Rec."Document Sub Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Sub Type field.';
                }
                field("Case ID"; Rec."Case ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Case ID field.';
                }
                field("Case Title"; Rec."Case Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Case Title field.';
                }
                field("Accused Name"; Rec."Accused Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Accused Name field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Document Description"; Rec."Document Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Description field.';
                }
                field("Document Origin"; Rec."Document Origin")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Origin field.';
                }
                field("Court Date"; Rec."Court Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Court Date field.';
                }
                field("Assigned Investigator"; Rec."Assigned Investigator")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Assigned Investigator field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Created field.';
                }
                field("Time Created"; Rec."Time Created")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time Created field.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.RegistrationType := Rec.Registrationtype::Document;
    end;
}

#pragma implicitwith restore

