#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 65058 "Funding Opportunity Closed"
{
    Caption = 'Funding Opportunity Announcement Card';
    DelayedInsert = false;
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = Card;
    SourceTable = "Funding Opportunity";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Call No."; Rec."Call No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Call No. field.';
                }
                field("Organization ID"; Rec."Organization ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Organization ID field.';
                }
                field("Issuing Organization"; Rec."Issuing Organization")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issuing Organization field.';
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Title field.';
                }
                field("Call Type"; Rec."Call Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Call Type field.';
                }
                field("External Announcement No"; Rec."External Announcement No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the External Announcement No field.';
                }
                field("Release Date"; Rec."Release Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Release Date field.';
                }
                field("Application Due Date"; Rec."Application Due Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Due Date field.';
                }
                field("Application date"; Rec."Application date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application date field.';
                }
                field("Expiration Date"; Rec."Expiration Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Expiration Date field.';
                }
                field("Home Page"; Rec."Home Page")
                {
                    ApplicationArea = Basic;
                    Caption = 'Home Page';
                    ToolTip = 'Specifies the value of the Home Page field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                group("Title Details:")
                {
                    Caption = 'Title Details:';
                    field("Opportunity Details"; WorkDescription)
                    {
                        ApplicationArea = Basic;
                        MultiLine = true;
                        StyleExpr = true;
                        ToolTip = 'Specifies the value of the WorkDescription field.';
                        trigger OnValidate()
                        begin
                            Rec.SetWorkDescription(WorkDescription);
                        end;
                    }
                }
            }
            group("Finance Details")
            {
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field("Opportunity Amount"; Rec."Opportunity Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Opportunity Amount field.';
                }
                field("Opportunity Amount(LCY)"; Rec."Opportunity Amount(LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Opportunity Amount(LCY) field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control23; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control22; Notes)
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
        area(processing)
        {
            action("Grants Applications")
            {
                ApplicationArea = Basic;
                Image = Grid;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = Page "Grant Funding Application List";
                RunPageLink = "FOA ID" = field("Call No.");
                ToolTip = 'Executes the Grants Applications action.';
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        WorkDescription := Rec.GetWorkDescription;
    end;

    var
        WorkDescription: Text;
}

#pragma implicitwith restore

