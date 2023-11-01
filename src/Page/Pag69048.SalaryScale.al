#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69048 "Salary Scale"
{
    PageType = List;
    SourceTable = "Salary Mapping";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Rank; Rec.Rank)
                {
                    ApplicationArea = Basic;
                }
                field("Profit Centre"; Rec."Profit Centre")
                {
                    ApplicationArea = Basic;
                }
                field("Basic Salary"; Rec."Basic Salary")
                {
                    ApplicationArea = Basic;
                }
                field("House Allowance"; Rec."House Allowance")
                {
                    ApplicationArea = Basic;
                }
                field("Uniform Cleaning Allowance"; Rec."Uniform Cleaning Allowance")
                {
                    ApplicationArea = Basic;
                }
                field("Responsibility Allowance"; Rec."Responsibility Allowance")
                {
                    ApplicationArea = Basic;
                }
                field("Meal Allowance"; Rec."Meal Allowance")
                {
                    ApplicationArea = Basic;
                }
                field("Night Allowance"; Rec."Night Allowance")
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control1000000011; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000012; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control1000000013; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

