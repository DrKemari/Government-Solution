#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 70047 "Appointment List"
{
    ApplicationArea = Basic;
    CardPageID = "Commitee Creation";
    Editable = false;
    PageType = List;
    SourceTable = "Tender Commitee Appointment1";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field("Appointment No"; Rec."Appointment No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Appointment No field.';
                }
                field("Tender/Quotation No"; Rec."Tender/Quotation No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Tender/Quotation No field.';
                }
                field("Committee ID"; Rec."Committee ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Committee ID field.';
                }
                field("Committee Name"; Rec."Committee Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Committee Name field.';
                }
                field("Creation Date"; Rec."Creation Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Creation Date field.';
                }
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the User ID field.';
                }
                field(Title; Rec.Title)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Title field.';
                }
                field("No. Series"; Rec."No. Series")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. Series field.';
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

