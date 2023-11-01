#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85031 "Examination Document Types"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Examination Document Type";
    UsageCategory = Administration;

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
                field("Track Expiry"; Rec."Track Expiry")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Track Expiry field.';
                }
                field("Special Group Requirement"; Rec."Special Group Requirement")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Special Group Requirement field.';
                }
                field("Issuing Agency"; Rec."Issuing Agency")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Issuing Agency field.';
                }
                field("Local Verification URL"; Rec."Local Verification URL")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Local Verification URL field.';
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Blocked field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

