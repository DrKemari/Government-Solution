#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85381 "MPESA Entries"
{
    ApplicationArea = Basic;
    DeleteAllowed = true;
    Editable = false;
    InsertAllowed = true;
    ModifyAllowed = true;
    PageType = List;
    SourceTable = "MPESA Integration Table";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(MPESA_TXN_ID; Rec.MPESA_TXN_ID)
                {
                    ApplicationArea = Basic;
                    Caption = 'Transaction ID';
                    ToolTip = 'Specifies the value of the Transaction ID field.';
                }
                field(MPESA_AMOUNT; Rec.MPESA_AMOUNT)
                {
                    ApplicationArea = Basic;
                    Caption = 'Amount';
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field(MPESA_TXN_DATE; Rec.MPESA_TXN_DATE)
                {
                    ApplicationArea = Basic;
                    Caption = 'Date';
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field(MSISDN_CUSTOMER; Rec.MSISDN_CUSTOMER)
                {
                    ApplicationArea = Basic;
                    Caption = 'Phone No.';
                    ToolTip = 'Specifies the value of the Phone No. field.';
                }
                field(ACCOUNT_NUMBER; Rec.ACCOUNT_NUMBER)
                {
                    ApplicationArea = Basic;
                    Caption = 'Reference No.';
                    ToolTip = 'Specifies the value of the Reference No. field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field("ID Number"; Rec."ID Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ID Number field.';
                }
                field("Applied Amount"; Rec."Applied Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Applied Amount field.';
                }
                field("Remaining Amount"; Rec."Remaining Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Remaining Amount field.';
                }
                field(Fetch; Rec.Fetch)
                {
                    ApplicationArea = Basic;
                    Caption = 'Utilized';
                    ToolTip = 'Specifies the value of the Utilized field.';
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
            systempart(Control22; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Update Mpesa Amount")
            {
                ApplicationArea = Basic;
                Image = UpdateUnitCost;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Update Mpesa Amount";
                RunPageLink = MPESA_TXN_ID = field(MPESA_TXN_ID);
                ToolTip = 'Executes the Update Mpesa Amount action.';
            }
        }
    }

    var
        Examination: Codeunit Examination;
}

#pragma implicitwith restore

