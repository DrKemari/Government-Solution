#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 56048 "Document Registration Card"
{
    PageType = Card;
    SourceTable = "Document registration";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field("Case ID"; Rec."Case ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Case ID field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                    trigger OnValidate()
                    begin
                        if DocType.Get(Rec."Document Type") then begin
                            if DocType."Require Court Date?" = true then
                                Court := true
                            else
                                Court := false
                        end;
                    end;
                }
                group(".")
                {
                    Caption = '.';
                    Visible = Court;
                    field("Court Date"; Rec."Court Date")
                    {
                        ApplicationArea = Basic;
                        ToolTip = 'Specifies the value of the Court Date field.';
                    }
                }
                field("Document Sub Type"; Rec."Document Sub Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Sub Type field.';
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
                field("Case Title"; Rec."Case Title")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Case Title field.';
                }
                field("Accused Name"; Rec."Accused Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Accused Name field.';
                }
                field("Assigned Investigator"; Rec."Assigned Investigator")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Assigned Investigator field.';
                }
                field("Court Rank"; Rec."Court Rank")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Court Rank field.';
                }
                field("Court Station"; Rec."Court Station")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Court Station field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
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
        area(factboxes)
        {
            systempart(Control19; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control20; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control21; MyNotes)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }

    trigger OnClosePage()
    begin
        Court := false;
    end;

    trigger OnInit()
    begin
        Court := false;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec.RegistrationType := Rec.Registrationtype::Document;
    end;

    trigger OnOpenPage()
    begin
        Court := false;
    end;

    var
        Court: Boolean;
        DocType: Record "Case Document Types";
}

#pragma implicitwith restore

