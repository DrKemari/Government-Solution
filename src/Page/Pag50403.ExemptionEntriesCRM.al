#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 50403 "Exemption Entries CRM"
{
    PageType = Card;
    SourceTable = "Exemption Entries";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field("Stud. Cust No."; Rec."Stud. Cust No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Stud. Cust No. field.';
                }
                field("Stud. Reg. No"; Rec."Stud. Reg. No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Stud. Reg. No field.';
                }
                field("Course Id"; Rec."Course Id")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Course Id field.';
                }
                field("Exemption Voucher No."; Rec."Exemption Voucher No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Exemption Voucher No. field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

