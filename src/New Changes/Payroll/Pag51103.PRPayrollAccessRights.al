page 51103 "PR Payroll Access Rights"
{

    Caption = 'PR Payroll Access Rights';
    PageType = List;
    SourceTable = "PR Payroll Access Rights";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("User ID"; Rec."User ID")
                {
                    ApplicationArea = All;
                }
                field(Authorized; Rec.Authorized)
                {
                    ApplicationArea = All;
                }

                field("Last Modified By"; "Last Modified By")
                {
                    ApplicationArea = all;
                }

                field("Last DateTime Modified"; "Last DateTime Modified")
                {

                    ApplicationArea = all;
                }
            }
        }
    }

}
