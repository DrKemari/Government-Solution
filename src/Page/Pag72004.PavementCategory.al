#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 72004 "Pavement Category"
{
    ApplicationArea = Basic;
    PageType = List;
    SourceTable = "Pavement Category";
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
                field("Engineering Profile Summary"; Rec."Engineering Profile Summary")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Engineering Profile Summary field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

