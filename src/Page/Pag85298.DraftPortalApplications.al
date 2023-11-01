#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
#pragma implicitwith disable
Page 85298 "Draft Portal Applications"
{
    ApplicationArea = Basic;
    Caption = 'Draft Portal  Applications';
    CardPageID = "Portal Student Application";
    Editable = false;
    PageType = List;
    SourceTable = "Student Processing Header";
    SourceTableView = where(Type = filter(New | Existing),
                            "Document Type" = filter(Registration),
                            Posted = filter(false),
                            Portal = filter(true),
                            "Approval Status" = filter(Open),
                            Submitted = filter(false));
    UsageCategory = History;

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
                field("Student No."; Rec."Student No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Student No. field.';
                }
                field("Student Name"; Rec."Student Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Student Name field.';
                }
                field("ID Number/Passport No."; Rec."ID Number/Passport No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ID Number/Passport No./Birth Certificate field.';
                }
                field("Examination Description"; Rec."Examination Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Examination';
                    ToolTip = 'Specifies the value of the Examination field.';
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
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field("Application Invoice"; Rec."Application Invoice")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Invoice field.';
                }
                field("Application Amount"; Rec."Application Amount")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Amount field.';
                }
                field("Application Receipt"; Rec."Application Receipt")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Application Receipt field.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        Rec.SetRange(Submitted, false);
        Rec.SetCurrentkey("Created On");
        Rec.SetAscending("Created On", true);
    end;
}
#pragma implicitwith restore


#pragma implicitwith restore

