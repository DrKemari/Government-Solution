#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 59094 "File Location SetUp Card"
{
    PageType = Card;
    SourceTable = "File Locations Setup";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(Location; Rec.Location)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Location field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Custodian Code"; Rec."Custodian Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Custodian Code field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

