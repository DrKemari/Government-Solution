#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 65072 "Lost Grants Opportunities"
{
    ApplicationArea = Basic;
    Caption = 'Lost Grants Opportunities';
    DelayedInsert = false;
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Grant Funding Application";
    SourceTableView = where("Application Status" = const(Lost));
    UsageCategory = History;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Application No"; Rec."Application No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application No field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("FOA ID"; Rec."FOA ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the FOA ID field.';
                }
                field("External Document No"; Rec."External Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the External Document No field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Opportunity  Title"; Rec."Opportunity  Title")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Opportunity  Title field.';
                }
                field("Call Type"; Rec."Call Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Call Type field.';
                }
                field("Grant Type"; Rec."Grant Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grant Type field.';
                }
                field("Justification for Application"; Rec."Justification for Application")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Justification for Application field.';
                }
                field("Research Center"; Rec."Research Center")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Research Center field.';
                }
                field("Primary Research Program ID"; Rec."Primary Research Program ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Research Program ID field.';
                }
                field("Primary Research Area"; Rec."Primary Research Area")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Research Area field.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Series field.';
                }
                field("Principal Investigator"; Rec."Principal Investigator")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Principal Investigator field.';
                }
                field("Currency Code"; Rec."Currency Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Currency Code field.';
                }
                field("Requested Grant Amount"; Rec."Requested Grant Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requested Grant Amount field.';
                }
                field("Requested Grant Amount(LCY)"; Rec."Requested Grant Amount(LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requested Grant Amount(LCY) field.';
                }
                field("Awarded Grant Amount"; Rec."Awarded Grant Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Awarded Grant Amount field.';
                }
                field("Awarded Grant Amount (LCY)"; Rec."Awarded Grant Amount (LCY)")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Awarded Grant Amount (LCY) field.';
                }
                field("Application Status"; Rec."Application Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Status field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("Grant Admin Team Code"; Rec."Grant Admin Team Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grant Admin Team Code field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
                field("Closed Date"; Rec."Closed Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Closed Date field.';
                }
                field("Grantor No."; Rec."Grantor No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grantor No. field.';
                }
                field("Grantor Name"; Rec."Grantor Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grantor Name field.';
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address field.';
                }
                field(Address2; Rec.Address2)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Address2 field.';
                }
                field("Post Code"; Rec."Post Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Post Code field.';
                }
                field(City; Rec.City)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the City field.';
                }
                field("Phone No"; Rec."Phone No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No field.';
                }
                field("Mobile Phone No"; Rec."Mobile Phone No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mobile Phone No field.';
                }
                field("Grantor Research Contact ID"; Rec."Grantor Research Contact ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grantor Research Contact ID field.';
                }
                field("Grantor Research Reviewer"; Rec."Grantor Research Reviewer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grantor Research Reviewer field.';
                }
                field("Grantor Admin Contact ID"; Rec."Grantor Admin Contact ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grantor Admin Contact ID field.';
                }
                field("Grantor Admin Name"; Rec."Grantor Admin Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grantor Admin Name field.';
                }
                field("Grantor Finance Contact ID"; Rec."Grantor Finance Contact ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grantor Finance Contact ID field.';
                }
                field("Grantor Finance Contact"; Rec."Grantor Finance Contact")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grantor Finance Contact field.';
                }
                field("Application Due Date"; Rec."Application Due Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Due Date field.';
                }
                field("Application Submitted Date"; Rec."Application Submitted Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Submitted Date field.';
                }
                field("Estimated Award Date"; Rec."Estimated Award Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Estimated Award Date field.';
                }
                field("Currency Factor"; Rec."Currency Factor")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Currency Factor field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

