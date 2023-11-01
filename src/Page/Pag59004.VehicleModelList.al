#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 59004 "Vehicle Model List"
{
    CardPageID = "Vehicle Model Card";
    DeleteAllowed = false;
    PageType = List;
    SourceTable = "Vehicle Model";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Make; Rec.Make)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Make field.';
                }
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }


            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

