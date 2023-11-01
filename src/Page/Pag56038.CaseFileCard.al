#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 56038 "Case File Card"
{
    PageType = Card;
    SourceTable = "Case File";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("Case ID"; Rec."Case ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Case ID field.';
                }
                field("Court Case no"; Rec."Court Case no")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Court Case no field.';
                }
                field("Case Title"; Rec."Case Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Case Title field.';
                }
                field("Case Brief"; Rec."Case Brief")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Case Brief field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Year of the Case"; Rec."Year of the Case")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Year of the Case field.';
                }
                field("Accused Name"; Rec."Accused Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Accused Name field.';
                }
                field("Accused Address"; Rec."Accused Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Accused Address field.';
                }
                field("Accused Phone No"; Rec."Accused Phone No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Accused Phone No field.';
                }
                field("Complainant Name"; Rec."Complainant Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Complainant Name field.';
                }
                field("Complainant Address"; Rec."Complainant Address")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Complainant Address field.';
                }
                field("Complainant Phone No"; Rec."Complainant Phone No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Complainant Phone No field.';
                }
                field("Court Station"; Rec."Court Station")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Court Station field.';
                }
                field("Court Rank"; Rec."Court Rank")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Court Rank field.';
                }
                field("Main Investigator No"; Rec."Main Investigator No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Main Investigator No field.';
                }
                field("Main Investigator Name"; Rec."Main Investigator Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Main Investigator Name field.';
                }
                field("Arresting Officer No"; Rec."Arresting Officer No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Arresting Officer No field.';
                }
                field("Arresting Officer Name"; Rec."Arresting Officer Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Arresting Officer Name field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Case Types"; Rec."Case Types")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Case Types field.';
                }
                field("Exhibit No"; Rec."Exhibit No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Exhibit No field.';
                }
                field("Serial No"; Rec."Serial No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Serial No field.';
                }
                field("Exhibit Details"; Rec."Exhibit Details")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Exhibit Details field.';
                }
                field("Current Case File Location"; Rec."Current Case File Location")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Current Case File Location field.';
                }
                field("Nature of Offence"; Rec."Nature of Offence")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Nature of Offence field.';
                }
                field("Nature of cause of action"; Rec."Nature of cause of action")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Nature of cause of action field.';
                }
                field("Case Outcome"; Rec."Case Outcome")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Case Outcome field.';
                }
                field("Exhibit Disposed"; Rec."Exhibit Disposed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Exhibit Disposed field.';
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
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
            }
            group(Payments)
            {
                Caption = 'Payments';
                field("Decretal Amount"; Rec."Decretal Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Decretal Amount field.';
                }
                field("Awarded Amount"; Rec."Awarded Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Awarded Amount field.';
                }
                field("Payment Status"; Rec."Payment Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment Status field.';
                }
                field("Payment Amount"; Rec."Payment Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payment Amount field.';
                }
                field("Outstanding Amount"; Rec."Outstanding Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Outstanding Amount field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control31; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control32; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control33; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(Investigators)
            {
                ApplicationArea = Basic;
                Caption = 'Investigators';
                Image = Agreement;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page "Investigators Listing";
                RunPageLink = "Case No" = field("Case ID");
                ToolTip = 'Executes the Investigators action.';
            }
            action(Witnesses)
            {
                ApplicationArea = Basic;
                Caption = 'Witnesses';
                Image = PostingEntries;
                Promoted = true;
                PromotedIsBig = true;
                PromotedOnly = true;
                RunObject = Page Witnesses;
                RunPageLink = "Case No" = field("Case ID");
                ToolTip = 'Executes the Witnesses action.';
            }
            action("Registered Documents")
            {
                ApplicationArea = Basic;
                Caption = 'Registered Documents';
                Image = Database;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Document Registration List";
                RunPageLink = "Case ID" = field("Case ID");
                ToolTip = 'Executes the Registered Documents action.';
            }
        }
    }
}

#pragma implicitwith restore

