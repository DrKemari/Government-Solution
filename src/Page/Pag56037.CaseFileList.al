#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 56037 "Case File List"
{
    ApplicationArea = Basic;
    CardPageID = "Case File Card";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Case File";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
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
                field("Main Investigator No"; Rec."Main Investigator No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Main Investigator No field.';
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
                field("Court Rank"; Rec."Court Rank")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Court Rank field.';
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
                field("Case No"; Rec."Case No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Case No field.';
                }
                field("Date Removed"; Rec."Date Removed")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Removed field.';
                }
                field("Date brought back"; Rec."Date brought back")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date brought back field.';
                }
                field("Final Disposal Date"; Rec."Final Disposal Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Final Disposal Date field.';
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
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

