#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 51344 "Accreditation Admin Staff"
{
    PageType = ListPart;
    SourceTable = "Acc Administrative Staff";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Category; Rec.Category)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Category field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("No. of Staff"; Rec."No. of Staff")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Staff field.';
                }
                field("Highest Academic Qualification"; Rec."Highest Academic Qualification")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Highest Academic Qualification field.';
                }
                field("Lowest Academic Qualification"; Rec."Lowest Academic Qualification")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Lowest Academic Qualification field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

