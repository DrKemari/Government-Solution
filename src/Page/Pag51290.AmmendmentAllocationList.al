#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51290 "Ammendment Allocation List"
{
    CardPageID = "Ammendment Allocation Card";
    Editable = false;
    PageType = List;
    SourceTable = "Proposal Document Sub-Topic";
    // SourceTableView = where(Field19 = filter(1),
    //                         test = filter('0' | '1' | '2'));

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
                field("Topic Code"; Rec."Topic Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Topic Code field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Chapter; Rec.Chapter)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Chapter field.';
                }
                // field("Created On"; "Created On")
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Created On field.';
                // }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

