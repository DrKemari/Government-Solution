#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85028 "Institution Applications"
{
    ApplicationArea = Basic;
    Caption = 'Institution Student Applications';
    CardPageID = "Institution Application";
    Editable = false;
    PageType = List;
    SourceTable = "Bulk Processing Header";
    SourceTableView = where("Document Type" = filter(Registration),
                            Posted = filter(false));
    UsageCategory = Tasks;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Date; Rec.Date)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Institution No."; Rec."Institution No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution No. field.';
                }
                field("Institution Name"; Rec."Institution Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Institution Name field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field(Portal; Rec.Portal)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Portal field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("Registration Date"; Rec."Registration Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Registration Date field.';
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
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Import Student Details")
            {
                ApplicationArea = Basic;
                ToolTip = 'Executes the Import Student Details action.';
            }
        }
    }
}

#pragma implicitwith restore

