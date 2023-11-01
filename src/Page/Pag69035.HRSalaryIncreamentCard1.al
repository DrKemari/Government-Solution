#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 69035 "HR Salary Increament Card1"
{
    PageType = Card;
    SourceTable = "KPA Objectives";

    layout
    {
        area(content)
        {
            group(General)
            {
                Editable = editability;
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
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
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
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
            }
            part(Control10; "Hr Salary Increament Lines1")
            {
                Editable = editability;
                Enabled = editability;
                SubPageLink = "Employee No" = field("Employee No");
                UpdatePropagation = SubPart;
                ApplicationArea = Basic;
            }
        }
        area(factboxes)
        {
            systempart(Control8; Links)
            {
                ApplicationArea = Basic;
            }
            systempart(Control9; Notes)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Effect Salary Increament")
            {
                ApplicationArea = Basic;
                Enabled = editability;
                Image = PayrollStatistics;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                PromotedOnly = true;
                ToolTip = 'Executes the Effect Salary Increament action.';
                trigger OnAction()
                begin
                    // if Description = 0D then
                    //     Error('Please select effective date');
                    // TestField(Comments, Comments::"0");
                    // Lines.Reset;
                    // Lines.SetRange("Employee No", "Employee No");
                    // Lines.SetRange("Effective Date", Description);
                    // if Lines.Find('-') then begin
                    //     repeat
                    //         Lines.Validate(Comments);
                    //         Lines.Validate("KPA Entry No");
                    //         Employee.Reset;
                    //         Employee.SetRange("No.", Lines.Period);
                    //         if Employee.FindSet then begin
                    //             Employee."Salary Scale" := Lines."KPA Entry No";
                    //             Employee.Present := Lines.Comments;
                    //             Employee.Previous := Lines.Self;
                    //             Employee.Modify;
                    //         end;
                    //     until Lines.Next = 0;
                    //     Message('Salary Increament Completed..');
                    //     if Dialog.Confirm('You can now close this batch,\Do you want to close the batch?', true) then
                    //         Comments := Comments::"1";
                    // end;
                end;
            }
        }
    }

    // trigger OnOpenPage()
    // begin
    //     editability := true;
    //     if Comments = Comments::"1" then
    //         editability := false;
    // end;

    var
        Employee: Record Employee;
        Header: Record "KPA Objectives";
        Lines: Record "Key Performance Areas";
        editability: Boolean;
}

#pragma implicitwith restore

