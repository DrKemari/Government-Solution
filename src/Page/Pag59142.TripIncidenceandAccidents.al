#pragma warning disable AA0005, AA0008, AA0018, AA0021, AA0072, AA0137, AA0201, AA0206, AA0218, AA0228, AL0254, AL0424, AS0011, AW0006 // ForNAV settings
#pragma implicitwith disable
Page 59142 "Trip Incidence and Accidents"
{
    PageType = ListPart;
    SourceTable = "Vehicle Accident Details";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(RegNo; Rec.RegNo)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Driver; Rec.Driver)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Accident date"; Rec."Accident date")
                {
                    ApplicationArea = Basic;
                }
                field("Accident Details"; Rec."Accident Details")
                {
                    ApplicationArea = Basic;
                }
                field("Driver Names"; Rec."Driver Names")
                {
                    ApplicationArea = Basic;
                }
                field("Police Obstract No"; Rec."Police Obstract No")
                {
                    ApplicationArea = Basic;
                }
                field(Remarks; Rec.Remarks)
                {
                    ApplicationArea = Basic;
                }
                field("Claim Payment Date"; Rec."Claim Payment Date")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

