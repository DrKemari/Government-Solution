#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 57078 "EFT List"
{
    ApplicationArea = Basic;
    CardPageID = "Electronic Funds Transfer";
    DeleteAllowed = false;
    Editable = false;
    PageType = List;
    SourceTable = "EFT Header";
    UsageCategory = Lists;

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
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Series field.';
                }
                field(Transferred; Rec.Transferred)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transferred field.';
                }
                field("Date Transferred"; Rec."Date Transferred")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Transferred field.';
                }
                field("Time Transferred"; Rec."Time Transferred")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time Transferred field.';
                }
                field("Transferred By"; Rec."Transferred By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transferred By field.';
                }
                field("Date Entered"; Rec."Date Entered")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Entered field.';
                }
                field("Time Entered"; Rec."Time Entered")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time Entered field.';
                }
                field("Entered By"; Rec."Entered By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entered By field.';
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Remarks field.';
                }
                field("Payee Bank Name"; Rec."Payee Bank Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Payee Bank Name field.';
                }
                field("Bank  No"; Rec."Bank  No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank  No field.';
                }
                field("Salary Processing No."; Rec."Salary Processing No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Salary Processing No. field.';
                }
                field("Salary Options"; Rec."Salary Options")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Salary Options field.';
                }
                field(Total; Rec.Total)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total field.';
                }
                field("Total Count"; Rec."Total Count")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Total Count field.';
                }
                field(RTGS; Rec.RTGS)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the RTGS field.';
                }
                field("Document No. Filter"; Rec."Document No. Filter")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. Filter field.';
                }
                field("Date Filter"; Rec."Date Filter")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Filter field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

