#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51297 "Versions"
{
   // CardPageID = "Awaiting Completeness Card";
    Editable = false;
    PageType = List;
    SourceTable = "Acc Fee Schedules";
   // SourceTableView = where(Field92=filter(1));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Service; Rec.Service)
                {
                    ApplicationArea = Basic;
                }
                // field("Applies To New";"Applies To New")
                // {
                //     ApplicationArea = Basic;
                // }
                // field(Blocked;Blocked)
                // {
                //     ApplicationArea = Basic;
                // }
                field("Application Type"; Rec."Application Type")
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

