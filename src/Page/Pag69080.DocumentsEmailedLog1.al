#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69080 "Documents E-mailed Log1"
{
    Editable = false;
    PageType = List;
    SourceTable = "Document E-mail Log";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Entry No"; Rec."Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Entry No field.';
                }
                field("S/no"; Rec."S/no")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the S/no field.';
                }
                field("Customer No"; Rec."Customer No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Customer No field.';
                }
                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Customer Name field.';
                }
                field("E-mailed To"; Rec."E-mailed To")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the E-mailed To field.';
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
                field("File Extension"; Rec."File Extension")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the File Extension field.';
                }
                field(Time; Rec.Time)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time field.';
                }
                field("Profit Centre"; Rec."Profit Centre")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Profit Centre field.';
                }
                field("Branch code"; Rec."Branch code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Branch code field.';
                }
                field("Sender ID"; Rec."Sender ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Sender ID field.';
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInit()
    begin
        //
    end;
}

#pragma implicitwith restore

