#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 59150 "File Movement Line App"
{
    PageType = ListPart;
    SourceTable = "File Movement Line";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("File Type"; Rec."File Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the File Type field.';
                }
                field("File Number"; Rec."File Number")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the File Number field.';
                }
                field("File Description"; Rec."File Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the File Description field.';
                }
                field("Purpose/Description"; Rec."Purpose/Description")
                {
                    ApplicationArea = Basic;
                    ShowMandatory = true;
                    ToolTip = 'Specifies the value of the Purpose/Description field.';
                }
                field("Issue Date"; Rec."Issue Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issue Date field.';
                }
                field("Account No."; Rec."Account No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issued To field.';
                }
                field("Issued To Name"; Rec."Issued To Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issued To Name field.';
                }
                field("Department Name"; Rec."Department Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department Name field.';
                }
                field("Date Returned"; Rec."Date Returned")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date Returned field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

