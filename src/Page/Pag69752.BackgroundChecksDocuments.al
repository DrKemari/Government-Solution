#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69752 "Background Checks Documents"
{
    PageType = ListPart;
    SourceTable = "Background Checks Document";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Clearance Document Type"; Rec."Clearance Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Clearance Document Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("External Document No."; Rec."External Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the External Document No. field.';
                }
                field("Clearing Agency"; Rec."Clearing Agency")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Clearing Agency field.';
                }
                field("Clearing Status"; Rec."Clearing Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Clearing Status field.';
                }
                field("Additional Comments"; Rec."Additional Comments")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Additional Comments field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

