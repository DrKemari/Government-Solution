#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 56141 "Movement Voucher Lines"
{
    PageType = ListPart;
    SourceTable = "ICT Issuance Voucher Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Serial No. field.';
                }
                field("FA No"; Rec."FA No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the FA No field.';
                }
                field("Current Assigned Employee"; Rec."Current Assigned Employee")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Current Assigned Employee field.';
                }
                field("Dpt Current Assigned"; Rec."Dpt Current Assigned")
                {
                    ApplicationArea = Basic;
                    Caption = 'Currently Assigned Department';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Currently Assigned Department field.';
                }
                field("Reason For Movement"; Rec."Reason For Movement")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reason For Movement field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

