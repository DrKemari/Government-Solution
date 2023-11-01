page 81333 "PR Third Party Charges"
{

    ApplicationArea = All;
    Caption = 'PR Third Party Charges';
    PageType = List;
    SourceTable = "PR Third Party Charges";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }

                field("Charge Per Transaction"; "Charge Per Transaction")
                {
                    ApplicationArea = All;
                }

            }
        }
    }

}
