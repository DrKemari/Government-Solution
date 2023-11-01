#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 95364 "Draft  Portal Deferment"
{
    Caption = 'Portal Deferment Applications';
    CardPageID = "Student Deferment Voucher";
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "Student Processing Header";
    SourceTableView = where("Document Type" = filter(Defferment),
                            Posted = filter(false),
                            Portal = filter(true),
                            Submitted = filter(false));

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
                field("Examination ID"; Rec."Examination ID")
                {
                    ApplicationArea = Basic;
                    Caption = 'Examination  ID';
                    ToolTip = 'Specifies the value of the Examination  ID field.';
                }
                field("Examination Description"; Rec."Examination Description")
                {
                    ApplicationArea = Basic;
                    Caption = 'Examination ';
                    ToolTip = 'Specifies the value of the Examination  field.';
                }
                field(Disabled; Rec.Disabled)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Disabled field.';
                }
                field("NCPWD No."; Rec."NCPWD No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the NCPWD No. field.';
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
                field("Examination Sitting"; Rec."Examination Sitting")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Examination Sitting field.';
                }
                field("Student Reg. No."; Rec."Student Reg. No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Student Reg. No. field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

