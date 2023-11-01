#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69037 "HR Salary Increament Closed1"
{
    CardPageID = "HR Salary Increament Card1";
    DeleteAllowed = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    PageType = List;
    SourceTable = "KPA Objectives";
    SourceTableView = where(Comments = const('1'));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Employee No field.';
                }
                field(Period; Rec.Period)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Period field.';
                }
                field("KPA Code"; Rec."KPA Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the KPA Code field.';
                }
                field("KPA Description"; Rec."KPA Description")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the KPA Description field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

