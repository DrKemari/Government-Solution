#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69690 "Job Grade Pointers"
{
    PageType = ListPart;
    SourceTable = "Salary Pointers";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Salary Pointer"; Rec."Salary Pointer")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Salary Pointer field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Min Salary"; Rec."Min Salary")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Min Salary field.';
                }
                field("Max Salary"; Rec."Max Salary")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Max Salary field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Job Grades Benefits")
            {
                ApplicationArea = Basic;
                Image = BinLedger;
                RunObject = Page "Job Grades Benefits";
                RunPageLink = "Salary Scale" = field("Salary Scale"),
                              "Salary Pointer" = field("Salary Pointer");
                ToolTip = 'Executes the Job Grades Benefits action.';
            }
        }
    }
}

#pragma implicitwith restore

