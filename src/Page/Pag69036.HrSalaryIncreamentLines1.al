#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69036 "Hr Salary Increament Lines1"
{
    PageType = ListPart;
    SourceTable = "Key Performance Areas";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Period; Rec.Period)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Period field.';
                }
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
                field(Reviewer; Rec.Reviewer)
                {
                    ApplicationArea = Basic;
                    Caption = 'Current Salary Point';
                    ToolTip = 'Specifies the value of the Current Salary Point field.';
                }
                field(Self; Rec.Self)
                {
                    ApplicationArea = Basic;
                    Caption = 'Current Job Group';
                    ToolTip = 'Specifies the value of the Current Job Group field.';
                }
                field("KPA Entry No"; Rec."KPA Entry No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the KPA Entry No field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
                // field("Effective Date"; "Effective Date")
                // {
                //     ApplicationArea = Basic;
                //     Editable = true;
                //     ToolTip = 'Specifies the value of the Effective Date field.';
                // }
                // field(Date; Date)
                // {
                //     ApplicationArea = Basic;
                //     ToolTip = 'Specifies the value of the Date field.';
                // }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

