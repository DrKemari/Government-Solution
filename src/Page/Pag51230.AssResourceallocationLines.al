#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51230 "Ass. Resource allocation Lines"
{
    PageType = ListPart;
    SourceTable = "Site Inspection Comment";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("User Name"; Rec."User Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the User Name field.';
                }
                field("Date Created"; Rec."Date Created")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Date Created field.';
                }
                field("User Category"; Rec."User Category")
                {
                    ApplicationArea = Basic;
                    Caption = 'Resource No';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Resource No field.';
                }
                field(Observation; Rec.Observation)
                {
                    ApplicationArea = Basic;
                    Caption = 'Resource Name';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Resource Name field.';
                }
                field("No Series"; Rec."No Series")
                {
                    ApplicationArea = Basic;
                    Caption = 'Work Category';
                    Editable = false;
                    ToolTip = 'Specifies the value of the Work Category field.';
                }
                // field(Amount; Amount)
                // {
                //     ApplicationArea = Basic;
                //     Editable = false;
                //     ToolTip = 'Specifies the value of the Amount field.';
                // }
                field("Report Status"; Rec."Report Status")
                {
                    ApplicationArea = Basic;
                    Caption = 'No. Of Days';
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. Of Days field.';
                }
                field(Verdict; Rec.Verdict)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Verdict field.';
                }
            }
        }
    }

    actions
    {
    }

    var
        TotalCost: Decimal;
}

#pragma implicitwith restore

