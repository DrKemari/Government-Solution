#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85245 "Bank Import Entries"
{
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Bank Import Entries";
    SourceTableView = where(Posted = filter(true));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Bank Code"; Rec."Bank Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Bank Code field.';
                }
                field("Transaction Date"; Rec."Transaction Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Transaction Date field.';
                }
                field("Reference No."; Rec."Reference No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reference No. field.';
                }
                field("Student Identifier"; Rec."Student Identifier")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Student Identifier field.';
                }
                field("Examination Code"; Rec."Examination Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Examination Code field.';
                }
                field("Form Serial No"; Rec."Form Serial No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Form Serial No field.';
                }
                field("Category Code"; Rec."Category Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Category Code field.';
                }
                field("Category Name"; Rec."Category Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Category Name field.';
                }
                field("Student Name"; Rec."Student Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Student Name field.';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field(Closed; Rec.Closed)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Closed field.';
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
                field("Registration No"; Rec."Registration No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Registration No field.';
                }
                field("M-PESA Code"; Rec."M-PESA Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the M-PESA Code field.';
                }
                field(Details; Rec.Details)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Details field.';
                }
                field("Mobile No"; Rec."Mobile No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Mobile No field.';
                }
                field(Branch; Rec.Branch)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Branch field.';
                }
                field(Posted; Rec.Posted)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Posted field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control23; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control24; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control25; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control26; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

