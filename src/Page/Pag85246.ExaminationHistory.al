#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 85246 "Examination History"
{
    PageType = List;
    SourceTable = "Examination History";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Part"; Rec.Part)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Part field.';
                }
                field(Section; Rec.Section)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Section field.';
                }
                field(Paper; Rec.Paper)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Paper field.';
                }
                field(Type; Rec.Type)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Type field.';
                }
                field(Grade; Rec.Grade)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Grade field.';
                }
                field("Financial Year"; Rec."Financial Year")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Financial Year field.';
                }
                field(exsit; Rec.exsit)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the exsit field.';
                }
                field(ctr; Rec.ctr)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the ctr field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

