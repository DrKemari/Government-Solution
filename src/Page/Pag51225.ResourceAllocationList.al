#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51225 "Resource Allocation List"
{
    CardPageID = "Resource Allocation Card";
    Editable = false;
    PageType = List;
    SourceTable = "Proposal Document Sub-Topic";
    // SourceTableView = where(test=filter('0'|'2'|'1'),
    //                         Field19=filter(0));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Code"; Rec.Code)
                {
                    ApplicationArea = Basic;
                }
                field("Topic Code"; Rec."Topic Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                // field("Start Date";"Start Date")
                // {
                //     ApplicationArea = Basic;
                // }
                // field("Required No. of Resources";"Required No. of Resources")
                // {
                //     ApplicationArea = Basic;
                // }
                field(test; Rec.test)
                {
                    ApplicationArea = Basic;
                }
                field(Chapter; Rec.Chapter)
                {
                    ApplicationArea = Basic;
                }
                // field("Created On";"Created On")
                // {
                //     ApplicationArea = Basic;
                // }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

