#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 65019 "Grants Setup List"
{
    CardPageID = "Grants Setup Card";
    Editable = false;
    PageType = List;
    SourceTable = "Grants Setup";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Research Iinfrastructure Nos"; Rec."Research Iinfrastructure Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Research Iinfrastructure Nos field.';
                }
                field("Research Output Nos"; Rec."Research Output Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Research Output Nos field.';
                }
                field("Researcher Nos"; Rec."Researcher Nos")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Researcher Nos field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

